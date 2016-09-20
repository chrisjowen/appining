import { Component, Inject } from '@angular/core';
import { Http } from '@angular/http';
import { NavController } from 'ionic-angular';
import  PhoenixChannels  from '../../lib/phoenix_channels';
import  {PhoenixChannel}  from '../../lib/phoenix_channels';

@Component({
  templateUrl: 'build/pages/home/home.html'
})
export class HomePage {
  private messages: Array<{}> = [];
  private channelNames: Array<{}> = [];
  private message: String;
  private eventChannel: PhoenixChannel;
  private viewChannel: PhoenixChannel;

  constructor(
    public navCtrl: NavController,
    private channels : PhoenixChannels,
    private http : Http) {}

  ngOnInit() {
    this.joinEventChannel()
  }

  createNing(name) {
    this.http
        .post("http://localhost:4000/api", {ning: {name: name}} )
        .subscribe(res => console.log("Response came!!!", res))
  }

  onJoin(name)  {
    if(this.viewChannel){
      this.viewChannel.leave()
    }
    this.messages = []
    this.viewChannel = this.channels.channel(`ning:${name}`);
    this.viewChannel.join().subscribe((result) => {
      this.viewChannel.observeMessage("msg:new:text").subscribe((message) =>{
        console.log(message)
        this.messages.push(message)
      })
    })
  }

  onClick(message) {
    console.log("sending", message)
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
