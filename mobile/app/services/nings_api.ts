import { Injectable }     from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable }     from 'rxjs/Rx';

@Injectable()
export class NingsApi {
  private baseUrl = 'http://localhost:4000/api';  // URL to web API

  constructor (private http: Http) {}
  getNings (lat, lng): Observable<Array<any>> {
    return this.http.get(`${this.baseUrl}/nearby/${lat}/${lng}?distance=100000&page=2`)
                    .map(this.extractData)
                    .catch(this.handleError);
  }
  private extractData(res: Response) {
    let body = res.json();
    return body.data.map((item_with_distance) => {
      let item = item_with_distance[0];
      console.log(item_with_distance[1])
      item.distance = item_with_distance[1];
      return item;
    })
  }
  private handleError (error: any) {
    let errMsg = (error.message) ? error.message :
      error.status ? `${error.status} - ${error.statusText}` : 'Server error';
    console.error(errMsg); // log to console instead
    return Observable.throw(errMsg);
  }
}
