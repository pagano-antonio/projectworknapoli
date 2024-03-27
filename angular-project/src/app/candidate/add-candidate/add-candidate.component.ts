import { Component, OnInit } from '@angular/core';
import { Candidate } from '../../model/Candidate';
import { FormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { CommonModule } from '@angular/common';
import { CalendarModule } from 'primeng/calendar';
import { CandidateService } from '../../services/candidate/candidate.service';
import { StepperModule } from 'primeng/stepper';
import { MultiSelectModule } from 'primeng/multiselect';
import { Skill } from '../../model/Skill';
import { SkillService } from '../../services/skill/skill.service';
import { Education } from '../../model/Education';
import { EducationDegreeType } from '../../model/EducationDegreeType';
import { EducationDegreeTypeService } from '../../services/educationDegreeType/education-degree-type.service';
import { ToastModule } from 'primeng/toast';
import { MessageService } from 'primeng/api';
import { DropdownModule } from 'primeng/dropdown';
import { WorkExperience } from '../../model/WorkExperience';
import { CandidateSkill } from '../../model/CandidateSkill';
import { CandidateCommercialData } from '../../model/CommercialData';
@Component({
  standalone: true,
  selector: 'app-add-candidate',
  templateUrl: './add-candidate.component.html',
  styleUrls: ['./add-candidate.component.scss'],
  imports: [FormsModule, ButtonModule, DropdownModule, CommonModule, CalendarModule, StepperModule, MultiSelectModule, ToastModule],
  providers: [MessageService]
})
export class AddCandidateComponent implements OnInit {
  removeCommercial(index: number) {
    if (index >= 0 && index < this.commercialData.length) {
      this.commercialData.splice(index, 1);
    }
  }
  errorMessage: string = '';
  candidate: Candidate = new Candidate(); // Inizializza un nuovo candidato vuoto
  stepIndex: number = 0;
  isCandidateAdded: boolean = true;
  skills: Skill[] = [];
  selectedSkills!: Skill[];
  education: Education[] = [new Education()];
  workExperience: WorkExperience[] = [new WorkExperience()];
  educationDegreeType: EducationDegreeType[] = [];
  commercialData: CandidateCommercialData[] = [new CandidateCommercialData()];

  constructor(private candidateService: CandidateService, private skillService: SkillService, private degreeService: EducationDegreeTypeService, private messageService: MessageService) {
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
  moreCommercial() {
    const lastCommercial = this.commercialData[this.commercialData.length - 1];
    if (lastCommercial && lastCommercial.businessCost != null && lastCommercial.currentRal != null &&
      lastCommercial.monthRefund != null && lastCommercial.proposedRal != null && lastCommercial.subsidyFlag != null) {
      this.commercialData.push(new CandidateCommercialData());
    } else {
      console.error("L'ultima istanza di Commercial non è completa.");
    }
  }
  moreEducation() {
    const lastEducation = this.education[this.education.length - 1];
    if (lastEducation && this.isEducationComplete(lastEducation)) {
      this.education.push(new Education());
    } else {
      console.error("L'ultima istanza di Education non è completa.");
    }
  }

  isEducationComplete(education: Education): boolean {
    return (
      education.date != null &&
      education.finalGrade != null &&
      education.place != null &&
      education.schoolName != null &&
      education.educationDegreeType != null);
  }

  removeEducation(index: number) {
    if (index >= 0 && index < this.education.length) {
      this.education.splice(index, 1);
    }
  }

  removeWorkExperience(index: number) {
    if (index >= 0 && index < this.workExperience.length) {
      this.workExperience.splice(index, 1);
    }
  }

  moreWork() {
    const lastWorkExperience = this.workExperience[this.workExperience.length - 1];
    if (lastWorkExperience && this.isWorkExperienceComplete(lastWorkExperience)) {
      this.workExperience.push(new WorkExperience());
    } else {
      console.error("L'ultima istanza di WorkExperience non è completa.");
    }
  }

  isWorkExperienceComplete(workExperience: WorkExperience): boolean {
    return (
      workExperience.startDate != null &&
      workExperience.endDate != null &&
      workExperience.company != null &&
      workExperience.city != null &&
      workExperience.description != null &&
      workExperience.title != null
    );
  }

  addCandidate() {
    let success = true; // Variabile per tenere traccia dello stato di successo delle chiamate

    this.candidateService.addCandidate(this.candidate).subscribe({
      next: (candidateSaved) => {
        this.candidate = candidateSaved;
        console.log("Save new candidate: ", candidateSaved.idCandidate);
        if (this.selectedSkills && this.selectedSkills.length > 0 && this.selectedSkills[0].idSkill != null) {
          this.addSkills();
        }
        if (this.education.length > 0 && this.education[0].educationDegreeType != null) {
          this.addEducation();
        }
        if (this.workExperience.length > 0 && this.workExperience[0].title != null) {
          this.addWorkExperience();
        }
        if (Object.keys(this.commercialData).length > 0 && this.commercialData[0].subsidyFlag != undefined) {
          this.addCommercialData();
        }
      },
      error: (error) => {
        success = false;
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate: ' + error.name + ": " + error.statusText });

      },
      complete: () => {
        if (success) {
          this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Candidate added!' });
        }
      }
    });
  }


  addSkills() {
    const candidateSkills = this.selectedSkills.map(s => {
      const candidateSkill = new CandidateSkill();
      candidateSkill.candidate = this.candidate;
      candidateSkill.skill = s;
      return candidateSkill;
    });
    this.candidateService.addSkills(candidateSkills).subscribe({
      next: (status: number) => {
        if (status != 200) {
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s skills' });
        }
      },
      error: (error: any) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s skills: ' + error.name + ": " + error.statusText });
      }
    });
  }

  addEducation() {
    const educations = this.education.map(e => {
      e.candidate = this.candidate;
      return e;
    });
    this.candidateService.addEducation(educations).subscribe({
      next: (status: number) => {
        if (status != 200) {
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s education' });
        }
      },
      error: (error: any) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s education: ' + error.name + ": " + error.statusText });
      }
    });
  }
  addWorkExperience() {
    const works = this.workExperience.map(w => {
      w.candidate = this.candidate;
      return w;
    });
    this.candidateService.addWorks(works).subscribe({
      next: (status: number) => {
        if (status != 200) {
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s work experience' });
        }
      },
      error: (error: any) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s work experience: ' + error.name + ": " + error.statusText });
      }
    });
  }

  addCommercialData() {
    const c = this.commercialData.map(ca => {
      ca.candidate = this.candidate;
      ca.idCandidateCD = this.candidate.idCandidate;
      return ca;
    });
    console.log(c);
    this.candidateService.addCommercialData(c).subscribe({
      next: (status: number) => {
        if (status != 200) {
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s commercial data' });
        }
      },
      error: (error: any) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding candidate\'s commercial data: ' + error.name + ": " + error.statusText });
      }
    });
  }

  allEducationKeysFilled(): boolean {
    let check = true;
    if (this.education.length == 1 && Object.keys(this.education[0]).length == 1 && this.education[0].educationDegreeType == undefined) {
      return false;
    }
    for (const education of this.education) {
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
    if (this.education.every(ed => Object.keys(ed).length === 0)) {
      check = false;
    }
    return check;
  }

  allCommercialKeysFilled(): boolean {
    let check = false;
    if (this.commercialData.length == 1 && Object.keys(this.commercialData[0]).length == 1 && this.commercialData[0].subsidyFlag == undefined) {
      return false;
    }
    this.commercialData.forEach(c => {
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
    if (this.workExperience.length == 1 && Object.keys(this.workExperience[0]).length == 0) {
      return false;
    }
    for (const work of this.workExperience) {
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
