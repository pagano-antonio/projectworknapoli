import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CompanyClient } from '../model/CompanyClient';

@Injectable({
  providedIn: 'root'
})
export class CompanyClientService {
  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }

  getAllCompanies() {
    return this.http.get<CompanyClient[]>(`http://${this.server}:${this.port}/CompanyClient/getAllCompanies`);
  }
}
