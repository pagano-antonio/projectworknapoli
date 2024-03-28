import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { CommonModule } from '@angular/common';
import { CalendarModule } from 'primeng/calendar';
import { StepperModule } from 'primeng/stepper';
import { MultiSelectModule } from 'primeng/multiselect';
import { ToastModule } from 'primeng/toast';
import { MessageService } from 'primeng/api';
import { DropdownModule } from 'primeng/dropdown';
import { JobOffer } from '../../model/JobOffer';
import { JobOfferService } from '../job-offer.service';
import { CompanyClient } from '../../model/CompanyClient';
import { CompanyClientService } from '../../companyClient/company-client.service';
import { Skill } from '../../model/Skill';
import { SkillService } from '../../services/skill/skill.service';
import { ContractTypeService } from '../../contractType/contract-type.service';
import { ContractType } from '../../model/ContractType';
import { JobOfferSkill } from '../../model/JobOfferSkill';
import { JobOfferSkillService } from '../../jobOfferSkill/job-offer-skill.service';


@Component({
  selector: 'app-add-job-offer',
  standalone: true,
  imports: [FormsModule, ButtonModule, DropdownModule, CommonModule, CalendarModule, StepperModule, MultiSelectModule, ToastModule],
  providers: [MessageService],
  templateUrl: './add-job-offer.component.html',
  styleUrl: './add-job-offer.component.scss'
})
export class AddJobOfferComponent implements OnInit {

  ngOnInit(): void {
    this.populateCompanyClient();
    this.populateSkills();
    this.populateContracts();
  }
  constructor(private jobOffereService: JobOfferService, private companyService: CompanyClientService, private skillService: SkillService, private contractService: ContractTypeService, private jobOfferSkillService: JobOfferSkillService, private messageService: MessageService) { }
  jobOffer: JobOffer = new JobOffer();
  companies: CompanyClient[] = [];
  skills: Skill[] = [];
  selectedSkills: Skill[] = [];
  contracts: ContractType[] = [];

  save() {
    console.log("save", this.jobOffer);
    this.jobOffereService.addJobOffer(this.jobOffer).subscribe({
      next: (j: JobOffer) => {
        if (j && j.idJobOffer > 0) {
          if (this.selectedSkills.length > 0) {
            let jobOfferSkills: JobOfferSkill[] = [];
            for (const s of this.selectedSkills) {
              let n: JobOfferSkill = new JobOfferSkill();
              n.skill = s;
              n.jobOffer = j;
              jobOfferSkills.push(n);
            }
            console.log(jobOfferSkills);
            this.jobOfferSkillService.addJobOfferSkill(jobOfferSkills).subscribe({
              next: (value) => {
                if (value == 200) {
                  this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Job Offer added!' });
                }
              },
              error: (error) => {
                console.log(error);
                this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding job offer: ' + error.name + ": " + error.statusText });

              }
            });
          }
        } else {
          this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Job Offer added!' });
        }
      },
      error: (error) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while adding job offer: ' + error.name + ": " + error.statusText });
        console.log(error);
      }
    })
  }

  populateCompanyClient() {
    this.companyService.getAllCompanies().subscribe({
      next: (comp) => {
        this.companies = comp;
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

  populateContracts() {
    this.contractService.getAllContractType().subscribe({
      next: (ct) => {
        this.contracts = ct;
      },
      error: (error) => {
        console.log(error);
      }
    })
  }
}
