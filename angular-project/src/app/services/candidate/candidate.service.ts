import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Candidate } from '../../model/Candidate';
import { CandidateSkill } from '../../model/CandidateSkill';
import { Observable } from 'rxjs';
import { Education } from '../../model/Education';
import { WorkExperience } from '../../model/WorkExperience';
import { CandidateCommercialData } from '../../model/CommercialData';

@Injectable({
  providedIn: 'root'
})
export class CandidateService {
  updateCandidate(candidate: Candidate) {
    return this.http.post<any>(`http://${this.server}:${this.port}/CandidateRest/updateCandidateDTO`, candidate);

  }
  server: string = "localhost";
  port: string = "8080";

  constructor(private http: HttpClient) { }
  getCandidates(): Observable<Candidate[]> {
    return this.http.get<Candidate[]>(`http://${this.server}:${this.port}/CandidateRest/getCandidates`);

  }

  addCandidate(candidate: Candidate) {
    return this.http.post<Candidate>(`http://${this.server}:${this.port}/CandidateRest/addCandidate`, candidate);
  }

  addSkills(candidateSkills: CandidateSkill[]): Observable<any> {
    return this.http.post<any>(`http://${this.server}:${this.port}/CandidateSkillRest/addSkills`, candidateSkills);
  }
  addEducation(educations: Education[]): Observable<any> {
    return this.http.post<any>(`http://${this.server}:${this.port}/EducationRest/addEducations`, educations);

  }
  addWorks(works: WorkExperience[]): Observable<any> {
    return this.http.post<any>(`http://${this.server}:${this.port}/WorkExperienceRest/addWorkExperience`, works);

  }
  addCommercialData(commercialData: CandidateCommercialData[]) {
    return this.http.post<any>(`http://${this.server}:${this.port}/CandidateCommercialDataRest/addCommercialData`, commercialData);
  }

  searchCandidate(candidate: Candidate, selectedSkills: number[] | null, degree: number | null, jobinterview: number | null, dateAfter: Date | null): Observable<Candidate[]> {
    const body = {
      candidate,
      selectedSkills,
      degree,
      jobinterview,
      dateAfter
    };

    return this.http.post<Candidate[]>(`http://${this.server}:${this.port}/CandidateRest/searchCandidate`, body);
  }

}
