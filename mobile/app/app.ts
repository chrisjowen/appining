import { Component, NgZone, provide } from '@angular/core';
import { Platform, ionicBootstrap } from 'ionic-angular';
import { StatusBar } from 'ionic-native';
import { TabsPage } from './pages/tabs/tabs';
import { NingsPage } from './pages/nings/nings';
import { Socket, SocketOptions, Channel } from 'phoenix'
import PhoenixChannels from './services/phoenix_channels'
import LocationProvider from './services/location_provider'
import { NingsApi } from './services/nings_api'

@Component({
  template: '<ion-nav [root]="rootPage">asdasd</ion-nav>'
})
export class MyApp {

  public rootPage: any;
  public messages : Array<String> = [];

  constructor(private platform: Platform, private _ngZone: NgZone) {
    this.rootPage = TabsPage;

    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      StatusBar.styleDefault();
    });
  }
}


let phoenixChannelsProvider = provide(PhoenixChannels, { useFactory: () => {
  if (window["cordova"]) {
      return new PhoenixChannels("ws://192.168.1.104:4000/socket");
    } else {
      return new PhoenixChannels("ws://localhost:4000/socket");
    }

} });
ionicBootstrap(MyApp, [phoenixChannelsProvider, LocationProvider, NingsApi]);
