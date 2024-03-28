import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Candidate } from '../../model/Candidate';
import { CandidateService } from '../../services/candidate/candidate.service';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { MessageService } from 'primeng/api';
import { Router } from '@angular/router';
import { JobOffer } from '../../model/JobOffer';
import { JobOfferService } from '../job-offer.service';

@Component({
  standalone: true,
  imports: [CommonModule, TableModule, ButtonModule, ToastModule],
  selector: 'app-all-job-offers',
  templateUrl: './all-job-offers.component.html',
  styleUrl: './all-job-offers.component.scss',
  providers: [MessageService]
})
export class AllJobOffersComponent implements OnInit {

  jobOffers: JobOffer[] = [];
  expanded: boolean = false;

  constructor(private router: Router, private messageService: MessageService, private jobOfferService: JobOfferService) {
    const currentNavigation = this.router.getCurrentNavigation();
    if (currentNavigation && currentNavigation.extras && currentNavigation.extras.state) {
      const data = currentNavigation.extras.state['data'];

      if (data) {
        this.jobOffers = data as JobOffer[];
        setTimeout(() => {
          this.messageService.add({ severity: 'success', summary: 'Success', detail: this.jobOffers.length === 1 ? '1 job offer found!' : this.jobOffers.length + ' job offers found!' });
        }, 100);
      }
    } else {
      this.getJobOffers();
    }
  }

  ngOnInit(): void {
  }

  getJobOffers() {
    this.jobOfferService.getJobOffers().subscribe({
      next: (jobs: JobOffer[]) => {
        this.jobOffers = jobs;
        this.messageService.add({ severity: 'success', summary: 'Success', detail: this.jobOffers.length === 1 ? '1 job offer found!' : this.jobOffers.length + ' job offers found!' });
      },
      error: (error: any) => {
        console.log(error);
      }
    });
  }

  delete(id: number) {
    this.jobOfferService.deleteJobOffer(id).subscribe({
      next: (res: number) => {
        if (res == 200) {
          const index = this.jobOffers.findIndex(job => job.idJobOffer === id);
          if (index !== -1) {
            this.jobOffers.splice(index, 1);
          }
          this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Job Offer deleted!' });

        }
      },
      error: (error: any) => {
        console.log(error);
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while deleting job offer: ' + error.name + ": " + error.statusText });
      }
    });
  }
  update(j: JobOffer) {
    this.router.navigate(['updateJobOffer'], {
      state: {
        data: j
      }
    });
  }
}
