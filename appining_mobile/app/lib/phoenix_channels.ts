import { Socket, Channel} from "phoenix";
import {EventEmitter, Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';

export class PhoenixChannel {
  public socket : Socket;
  public topic : string;
  public channel : Channel;

  constructor(socket : Socket, topic : string, options = {}) {
    this.socket = socket;
    this.topic = topic;
    this.channel = this.socket.channel(topic, options);
  }

  join(options = {}) {
    let joined = this.channel.join();
    return new Observable( (observer) => {
      joined
        .receive("ok", resp => {
          console.log("connected", resp);
          observer.next(resp);
        })
        .receive("error", resp => { observer.error(resp); });
    });
  }

  leave() {
    this.channel.leave();
  }

  observeMessage(message) {
    return new Observable( (observer) => {
      this.channel.on(message, (resp) => {
        console.log(message, resp);
        observer.next(resp);
      });
    });
  }

  sendMessage(message : string, body : {}) {
    this.channel.push(message, body);
  }
}

export default class PhoenixChannels {
  public socket : Socket;

  constructor(socketUrl, opts = {}) {
    this.socket =  new Socket(socketUrl, opts);
    this.socket.connect();
  }

  channel(topic) {
    return new PhoenixChannel(this.socket, topic);
  }
}
