import { Injectable } from '@angular/core';
import { JobOfferSkill } from '../model/JobOfferSkill';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class JobOfferSkillService {

  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }
  addJobOfferSkill(offerSki: JobOfferSkill[]): Observable<any> {
    console.log("add job offer skills", offerSki)
    return this.http.post<any>(`http://${this.server}:${this.port}/JobOfferSkill/addJobOfferSkill`, offerSki);
  }
}
