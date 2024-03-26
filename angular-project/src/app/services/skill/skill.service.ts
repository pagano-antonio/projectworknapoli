import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Skill } from '../../model/Skill';

@Injectable({
  providedIn: 'root'
})
export class SkillService {
  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }

  getSkills() {
    return this.http.get<Skill[]>(`http://${this.server}:${this.port}/skill/getSkills`);
  }
}
