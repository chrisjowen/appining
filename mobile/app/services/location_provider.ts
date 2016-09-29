import { Geolocation } from 'ionic-native';
import { provide } from '@angular/core';
import { BehaviorSubject, Observable} from 'rxjs/Rx';

export class LocationInfo {
  private watcher;
  private subject: BehaviorSubject<Coordinates> = new BehaviorSubject(null);

  constructor() {
    this.watcher = Geolocation.watchPosition();
  }
  locationChanged(fn) {
    this.subject.filter((coord) => coord != null) .subscribe(fn);
    this.watcher.subscribe((result) => {
      this.subject.next(result)
    });

  }
}

let locationInfo = new LocationInfo();
let locationProvider = provide(LocationInfo, { useFactory: () => { return locationInfo } });
export default locationProvider;
