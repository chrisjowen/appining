import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { NingsApi } from '../../services/nings_api';
import  {LocationInfo}  from '../../services/location_provider';
import  PhoenixChannels  from '../../services/phoenix_channels';
import  {PhoenixChannel}  from '../../services/phoenix_channels';

console.log(NingsApi)

@Component({
  templateUrl: 'build/pages/nings/nings.html'
})
export class NingsPage {
  private nings: Array<any>
  private currentLocation: Coordinates;
  private joinedNings: {}  = {};

  constructor(
    private locationInfo : LocationInfo,
    private ningsApi: NingsApi,
    private channels : PhoenixChannels
  ) {}

  ngOnInit() {
    this.locationInfo.locationChanged(this.locationChanged.bind(this))
  }

  private locationChanged(location) {
    this.currentLocation = location.coords;
    this.ningsApi
        .getNings(this.currentLocation.latitude, this.currentLocation.longitude)
        .subscribe((nings) => {
          this.nings=nings;
          this.listenToChannels(this.nings);
        });
  }
  private listenToChannels(nings) {
    nings.forEach((ning) => {
      let channel = this.channels.channel(`ning:${ning.id}`);
      this.joinedNings[ning.id] = channel;
      this.listenOnChannel(channel, ning)
    })
  }

  private listenOnChannel(channel : PhoenixChannel, ning: any) {
    channel.join().subscribe((result) => {
      channel.observeMessage("msg:new:text").subscribe((message : any) =>{
        ning.lastMessage = message.body;
      })
    })
  }
}
