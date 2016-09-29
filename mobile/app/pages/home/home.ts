import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';
import { NavController } from 'ionic-angular';
import  PhoenixChannels  from '../../services/phoenix_channels';
import  {PhoenixChannel}  from '../../services/phoenix_channels';
import  {LocationInfo}  from '../../services/location_provider';

@Component({
  templateUrl: 'build/pages/home/home.html'
})
export class HomePage {
  private messages: Array<{}> = [];
  private channelNames: Array<{}> = [];
  private message: String;
  private eventChannel: PhoenixChannel;
  private viewChannel: PhoenixChannel;
  private currentLocation: Coordinates;

  constructor(
    public navCtrl: NavController,
    private channels : PhoenixChannels,
    private http : Http,
    private locationInfo: LocationInfo) {
    }

  ngOnInit() {
    this.joinEventChannel()
    this.locationInfo.locationChanged((location) => this.currentLocation = location.coords )
  }

  createNing(name) {
    let  url =  (window["cordova"]) ? "192.168.1.104:4000" :  "localhost:4000"
    console.log(location)
    this.http
        .post(`http://${url}/api`, {ning: {name: name, position: [this.currentLocation.latitude, this.currentLocation.longitude]}} )
        .subscribe()
  }

  onJoin(name)  {
    if(this.viewChannel){
      this.viewChannel.leave()
    }
    this.messages = []
    this.viewChannel = this.channels.channel(`ning:${name}`);
    this.viewChannel.join().subscribe((result) => {
      this.viewChannel.observeMessage("msg:new:text").subscribe((message) =>{
        console.log("ning", message)
        this.messages.push(message)
      })
    })
  }

  onClick(message) {
    this.viewChannel.sendMessage("msg:new:text", { body: message })
  }

  private joinEventChannel() {
    this.eventChannel = this.channels.channel("ning:events");
    this.eventChannel.join().subscribe((result) => {
      this.eventChannel.observeMessage("ning:created").subscribe((message) =>{
        this.channelNames.push(message)
      })
    })
  }

}
