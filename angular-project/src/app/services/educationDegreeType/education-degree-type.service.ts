import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { EducationDegreeType } from '../../model/EducationDegreeType';

@Injectable({
  providedIn: 'root'
})
export class EducationDegreeTypeService {

  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }

  getEducationDegreeTypes() {
    return this.http.get<EducationDegreeType[]>(`http://${this.server}:${this.port}/EducationDegreeType/getEducationDegreeTypes`);
  }
}
