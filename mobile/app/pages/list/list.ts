import { Component, Inject, Input } from '@angular/core';
import { Http } from '@angular/http';
import { NavController } from 'ionic-angular';
import { ListItem } from '../../components/list.item/list.item';
import  {LocationInfo}  from '../../services/location_provider';
import { Api } from '../../services/api';

@Component({
  templateUrl: 'build/pages/list/list.html',
  directives: [ListItem]
})
export class ListPage {
  public items  = []

  constructor(
    public navCtrl: NavController,
    private locationInfo : LocationInfo,
    private api: Api
  ) {}

  ngOnInit() {
    this.locationInfo.locationChanged(this.locationChanged.bind(this))
  }

  private locationChanged(location) {
    let coords = location.coords;
    this.api
        .getOffers(coords.latitude, coords.longitude, 10000, 1)
        .subscribe((items) => {
          this.items=items;
        });
  }
}
