import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ContractType } from '../model/ContractType';

@Injectable({
  providedIn: 'root'
})
export class ContractTypeService {

  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }

  getAllContractType() {
    return this.http.get<ContractType[]>(`http://${this.server}:${this.port}/ContractType/getAllContractType`);
  }
}
