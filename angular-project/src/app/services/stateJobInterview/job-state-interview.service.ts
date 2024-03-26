import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { StateJobInterview } from '../../model/stateJobInterview';

@Injectable({
  providedIn: 'root'
})
export class JobStateInterviewService {

  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }

  getStates() {
    return this.http.get<StateJobInterview[]>(`http://${this.server}:${this.port}/stateJobInterview/getStateJobInterviews`);
  }
}
