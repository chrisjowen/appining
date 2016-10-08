import { Input, Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { DetailsPage } from '../../pages/details/details';

@Component({
    selector: '[list-item]',
    templateUrl: 'build/components/list.item/list.item.html',
})
export class ListItem {
    @Input() public item : any

    constructor(public navCtrl: NavController){}

    onClick() {
      this.navCtrl.push(DetailsPage, {item: this.item});
    }

}
