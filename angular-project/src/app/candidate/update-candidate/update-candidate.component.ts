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
import { DropdownModule } from 'primeng/dropdown';
import { Skill } from '../../model/Skill';
import { SkillService } from '../../services/skill/skill.service';
import { MultiSelectModule } from 'primeng/multiselect';
import { Education } from '../../model/Education';
import { EducationDegreeType } from '../../model/EducationDegreeType';
import { EducationDegreeTypeService } from '../../services/educationDegreeType/education-degree-type.service';
import { WorkExperience } from '../../model/WorkExperience';
@Component({
  selector: 'app-update-candidate',
  standalone: true,
  imports: [DropdownModule, FormsModule, ButtonModule, MultiSelectModule, CommonModule, CalendarModule, StepperModule, ToastModule],
  templateUrl: './update-candidate.component.html',
  styleUrl: './update-candidate.component.scss',
  providers: [MessageService]
})
export class UpdateCandidateComponent implements OnInit {
  updateCandidate() {
    this.candidate.candidateSkills = this.selectedSkills;
    this.candidateService.updateCandidate(this.candidate).subscribe(
      (res: number) => {
        if (res == 200) {
          this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Candidate updated'! });

        }
      },
      (error: any) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while updating candidate: ' + error.name + ": " + error.statusText });

      }
    );
  }
  removeCommercialData(index: number) {
    if (index >= 0 && index < this.candidate.commercialData.length) {
      this.candidate.commercialData.splice(index, 1);
    }
  }
  removeWorkExperience(index: number) {
    if (index >= 0 && index < this.candidate.workExperiences.length) {
      this.candidate.workExperiences.splice(index, 1);
    }
  }
  moreWork() {
    this.candidate.workExperiences.push(new WorkExperience());
  }
  moreEducation() {
    this.candidate.educations.push(new Education());
  }
  removeEducation(index: number) {
    if (index >= 0 && index < this.candidate.educations.length) {
      this.candidate.educations.splice(index, 1);
    }
  }
  candidate: Candidate = new Candidate();
  stepIndex: number = 0;
  skills: Skill[] = [];
  educations: Education[] = [new Education()];
  selectedSkills: Skill[] = []
  isCandidateAdded: boolean = true;
  educationDegreeType: EducationDegreeType[] = [new EducationDegreeType()];
  constructor(private router: Router, private candidateService: CandidateService, private skillService: SkillService, private degreeService: EducationDegreeTypeService, private messageService: MessageService) {
    const currentNavigation = this.router.getCurrentNavigation();
    if (currentNavigation && currentNavigation.extras && currentNavigation.extras.state) {
      const data = currentNavigation.extras.state['data'];
      if (data) {
        this.candidate = data as Candidate;
        this.candidate.birthday = new Date(this.candidate.birthday);
        if (data.candidateSkills) {
          data.candidateSkills.forEach((s: any) => {
            this.selectedSkills.push(s.skill as Skill);

          });
        }
        if (data.educations) {
          data.educations.forEach((s: any, index: number) => {
            this.candidate.educations[index].date = new Date(this.candidate.educations[index].date);
          });
        }
        if (data.workExperiences) {
          data.workExperiences.forEach((e: any, index: number) => {
            this.candidate.workExperiences[index].startDate = new Date(this.candidate.workExperiences[index].startDate);
            this.candidate.workExperiences[index].endDate = new Date(this.candidate.workExperiences[index].endDate);
          });
        }
        if (data.candidateCommercialData) {
          this.candidate.commercialData = data.candidateCommercialData;
        }
      }
    }
  }
  ngOnInit(): void {
    this.populateSkills();
    this.populateDegreeTypes();
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
      next: (ed) => {
        this.educationDegreeType = ed;
      },
      error: (error) => {
        console.log(error);
      }
    })
  }

  allEducationKeysFilled(): boolean {
    let check = true;
    if (this.candidate.educations.length == 1 && Object.keys(this.candidate.educations[0]).length == 1 && this.candidate.educations[0].educationDegreeType == undefined) {
      return false;
    }
    for (const education of this.candidate.educations) {
      const keys = Object.keys(education);
      if (keys.length > 0) {
        if (
          (education.date !== undefined && education.date !== null) &&
          (education.finalGrade !== undefined && education.finalGrade !== null) &&
          (education.place !== undefined && education.place !== null) &&
          (education.schoolName !== undefined && education.schoolName !== null) &&
          (education.educationDegreeType !== undefined && education.educationDegreeType !== null)
        ) {
          check = false;
        } else {
          check = true;
          break;
        }
      }
    }
    if (this.candidate.educations.every(ed => Object.keys(ed).length === 0)) {
      check = false;
    }
    return check;
  }

  allCommercialKeysFilled(): boolean {
    let check = false;
    if (this.candidate.commercialData.length == 1 && Object.keys(this.candidate.commercialData[0]).length == 1 && this.candidate.commercialData[0].subsidyFlag == undefined) {
      return false;
    }
    this.candidate.commercialData.forEach(c => {
      if (!(c.businessCost !== undefined && c.businessCost !== null &&
        c.currentRal !== undefined && c.currentRal !== null &&
        c.monthRefund !== undefined && c.monthRefund !== null &&
        c.proposedRal !== undefined && c.proposedRal !== null &&
        c.subsidyFlag !== undefined && c.subsidyFlag !== null)) {
        check = true;
        return;
      }
    })
    return check;



  }

  allWorkKeysFilled(): boolean {
    let check = true;
    if (this.candidate.workExperiences.length == 1 && Object.keys(this.candidate.workExperiences[0]).length == 0) {
      return false;
    }
    for (const work of this.candidate.workExperiences) {
      if (
        (work.title !== undefined && work.title !== null) &&
        (work.city !== undefined && work.city !== null) &&
        (work.description !== undefined && work.description !== null) &&
        (work.company !== undefined && work.company !== null) &&
        (work.startDate !== undefined && work.startDate !== null) &&
        (work.endDate !== undefined && work.endDate !== null)
      ) {
        check = false;
      } else {
        check = true;
        break;
      }
    }
    return check;
  }

}
