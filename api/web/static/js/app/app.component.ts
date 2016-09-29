import { Component, NgZone } from '@angular/core';
import socket from '../socket'

@Component({
  selector: 'my-app',
  template: `
    <div>
      <h1>My First Angular 2 App</h1>
      {{messages}}
    </div>
  `
})
export class AppComponent {
  messages : Array<String> = [];

  constructor (private _ngZone: NgZone) {

  }
  ngOnInit() {
    // Now that you are connected, you can join channels with a topic:
    let channel = socket.channel("ning:lobby", {});
    channel.join()
      .receive("ok", resp => {
          channel.push("msg:new:text", { body: "some message" })
          channel.push("msg:new:text", { body: "some message" })
          channel.push("msg:new:text", { body: "some message" })
          channel.push("msg:new:text", { body: "some message" })
      }).receive("error", resp => { console.log("Unable to join", resp) })

    channel.on("msg:broadcast:string", (message) => {
      this._ngZone.run(() => { this.messages.push(message.body) });
    })
  }

}
