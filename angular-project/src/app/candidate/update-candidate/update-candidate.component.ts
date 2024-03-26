import { Component, OnInit } from '@angular/core';
import { Candidate } from '../../model/Candidate';
import { Router } from '@angular/router';
import { CandidateService } from '../../services/candidate/candidate.service';
import { FormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { CommonModule } from '@angular/common';
import { CalendarModule } from 'primeng/calendar';
import { StepperModule } from 'primeng/stepper';
import { ToastModule } from 'primeng/toast';
import { MessageService } from 'primeng/api';
import { Skill } from '../../model/Skill';
import { SkillService } from '../../services/skill/skill.service';
import { MultiSelectModule } from 'primeng/multiselect';
@Component({
  selector: 'app-update-candidate',
  standalone: true,
  imports: [FormsModule, ButtonModule, MultiSelectModule, CommonModule, CalendarModule, StepperModule, ToastModule],
  templateUrl: './update-candidate.component.html',
  styleUrl: './update-candidate.component.scss',
  providers: [MessageService]
})
export class UpdateCandidateComponent implements OnInit {
  candidate: Candidate = new Candidate();
  stepIndex: number = 0;
  skills: Skill[] = [];
  isCandidateAdded: boolean = true;
  constructor(private router: Router, private candidateService: CandidateService, private skillService: SkillService) {
    const currentNavigation = this.router.getCurrentNavigation();
    if (currentNavigation && currentNavigation.extras && currentNavigation.extras.state) {
      const data = currentNavigation.extras.state['data'];

      if (data) {
        this.candidate = data as Candidate;
        this.candidate.birthday = new Date(this.candidate.birthday);
        console.log(this.candidate)
      }
    }
  }
  ngOnInit(): void {
    this.populateSkills();
    //this.populateDegreeTypes();
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
  /* populateDegreeTypes() {
    this.degreeService.getEducationDegreeTypes().subscribe({
      next: (ed) => {
        this.educationDegreeType = ed;
      },
      error: (error) => {
        console.log(error);
      }
    })
  } */

}
