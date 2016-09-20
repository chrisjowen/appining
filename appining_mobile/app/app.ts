import { Component, NgZone, provide } from '@angular/core';
import { Platform, ionicBootstrap } from 'ionic-angular';
import { StatusBar } from 'ionic-native';
import { HomePage } from './pages/home/home';
import { Socket, SocketOptions, Channel } from 'phoenix'
import PhoenixChannels from './lib/phoenix_channels'




@Component({
  template: '<ion-nav [root]="rootPage">asdasd</ion-nav>'
})
export class MyApp {

  public rootPage: any;
  public messages : Array<String> = [];

  constructor(private platform: Platform, private _ngZone: NgZone) {
    this.rootPage = HomePage;

    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      StatusBar.styleDefault();
    });
  }
}


let phoenixChannelsProvider = provide(PhoenixChannels, { useFactory: () => {
  return new PhoenixChannels("ws://localhost:4000/socket");
} });
ionicBootstrap(MyApp, [phoenixChannelsProvider]);
