import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JobOffer } from '../model/JobOffer';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class JobOfferService {


  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }

  getJobOffers(): Observable<JobOffer[]> {
    return this.http.get<JobOffer[]>(`http://${this.server}:${this.port}/JobOffer/getJobOffers`);
  }

  deleteJobOffer(id: number) {
    console.log("delete", id);
    return this.http.delete<any>(`http://${this.server}:${this.port}/JobOffer/deleteJobOffer/${id}`);
  }

  addJobOffer(offer: JobOffer) {
    return this.http.post<JobOffer>(`http://${this.server}:${this.port}/JobOffer/addJobOffer`, offer);
  }
}
