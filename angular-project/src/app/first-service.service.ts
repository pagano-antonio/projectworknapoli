import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Employee } from './model/Employee';

@Injectable({
  providedIn: 'root', // o 'any' se la condivisione dell'istanza è richiesta in modo più flessibile
})
export class FirstServiceService {
  server: string = "localhost";
  port: string = "8080"
  constructor(private hC: HttpClient) { }

  getEmployeeById(id: number) {
    return this.hC.get<Employee>(`http://${this.server}:${this.port}/EmployeeRest/findById/` + id);
  }
}
