import { Component } from '@angular/core';
import { ListPage } from '../list/list';

@Component({
  templateUrl: 'build/pages/list.tabs/list.tabs.html'
})
export class ListTabsPage {

  public listPage: any;

  constructor() {
    // this tells the tabs component which Pages
    // should be each tab's root Page
    this.listPage = ListPage;
    // this.tab2Root = NingsPage;
  }
}
