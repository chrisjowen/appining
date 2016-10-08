import { Component } from '@angular/core';
import { NavController, NavParams} from 'ionic-angular';

@Component({
  templateUrl: 'build/pages/details/details.html'
})
export class DetailsPage {
  public item : any

  constructor(public navCtrl: NavController, private navParams: NavParams) {
    this.item = navParams.get('item');
  }
}
