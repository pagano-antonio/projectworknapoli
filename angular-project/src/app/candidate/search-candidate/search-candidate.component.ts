import { Component, OnInit } from '@angular/core';
import { Candidate } from '../../model/Candidate';
import { FormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { CommonModule } from '@angular/common';
import { CalendarModule } from 'primeng/calendar';
import { CandidateService } from '../../services/candidate/candidate.service';
import { MultiSelectModule } from 'primeng/multiselect';
import { Skill } from '../../model/Skill';
import { SkillService } from '../../services/skill/skill.service';
import { EducationDegreeType } from '../../model/EducationDegreeType';
import { EducationDegreeTypeService } from '../../services/educationDegreeType/education-degree-type.service';
import { DropdownModule } from 'primeng/dropdown';
import { StateJobInterview } from '../../model/stateJobInterview';
import { JobStateInterviewService } from '../../services/stateJobInterview/job-state-interview.service';
import { NavigationExtras, Router } from '@angular/router';
@Component({
  selector: 'app-search-candidate',
  standalone: true,
  imports: [DropdownModule, FormsModule, MultiSelectModule, ButtonModule, CommonModule, CalendarModule],
  templateUrl: './search-candidate.component.html',
  styleUrl: './search-candidate.component.scss'
})
export class SearchCandidateComponent implements OnInit {
  candidate: Candidate = new Candidate();
  selectedSkills: number[] | null = null;
  degree: number | null = null;
  jobinterview: number | null = null;
  dateAfter: Date | null = null;
  skills: Skill[] = [];
  states: StateJobInterview[] = [];
  educationDegreeType: EducationDegreeType[] = [];
  constructor(private router: Router, private stateService: JobStateInterviewService, private candidateService: CandidateService, private skillService: SkillService, private degreeService: EducationDegreeTypeService) { }

  ngOnInit(): void {
    this.populateState();
    this.populateSkills();
    this.populateDegreeTypes();
  }
  populateState() {
    this.stateService.getStates().subscribe({
      next: (st) => {
        this.states = st;
      },
      error: (error) => {
        console.log(error);
      }
    })
  }
  populateSkills() {
    this.skillService.getSkills().subscribe({
      next: (sk) => {
        this.skills = sk;
      },
      error: (error) => {
        console.log(error);
      }
    })
  }
  populateDegreeTypes() {
    this.degreeService.getEducationDegreeTypes().subscribe({
      next: (ed: EducationDegreeType[]) => {
        this.educationDegreeType = ed;
      },
      error: (error: any) => {
        console.log(error);
      }
    })
  }
  searchCandidate(): void {
    console.log(this.candidate);
    this.candidateService.searchCandidate(this.candidate, this.selectedSkills, this.degree, this.jobinterview, this.dateAfter)
      .subscribe(
        (found: Candidate[]) => {
          this.router.navigate(['allCandidates'], {
            state: {
              data: found
            }
          });
        },
        (error: any) => {
          console.log(error)
        }
      );
  }
}
