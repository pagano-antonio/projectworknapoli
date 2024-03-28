import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Candidate } from '../../model/Candidate';
import { CandidateService } from '../../services/candidate/candidate.service';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { MessageService } from 'primeng/api';
import { Router } from '@angular/router';

@Component({
  standalone: true,
  imports: [CommonModule, TableModule, ButtonModule, ToastModule],
  selector: 'app-candidates-list',
  templateUrl: './candidates-list.component.html',
  styleUrls: ['./candidates-list.component.scss'],
  providers: [MessageService]
})
export class CandidatesListComponent implements OnInit {

  candidates: Candidate[] = [];
  expanded: boolean = false;

  constructor(private router: Router, private messageService: MessageService, private candidateService: CandidateService) {
    const currentNavigation = this.router.getCurrentNavigation();
    if (currentNavigation && currentNavigation.extras && currentNavigation.extras.state) {
      const data = currentNavigation.extras.state['data'];

      if (data) {
        this.candidates = data as Candidate[];
        setTimeout(() => {
          this.messageService.add({ severity: 'success', summary: 'Success', detail: this.candidates.length === 1 ? '1 candidate found!' : this.candidates.length + ' candidates found!' });
        }, 100);
      }
    } else {
      this.getCandidates();
    }
  }

  ngOnInit(): void {
  }

  getCandidates() {
    this.candidateService.getCandidates().subscribe({
      next: (candidatesList: Candidate[]) => {
        this.candidates = candidatesList;
        this.messageService.add({ severity: 'success', summary: 'Success', detail: this.candidates.length === 1 ? '1 candidate found!' : this.candidates.length + ' candidates found!' });
      },
      error: (error: any) => {
        console.log(error);
      }
    });
  }

  delete(idCandidate: number) {
    this.candidateService.deleteCandidate(idCandidate).subscribe({
      next: (res: number) => {
        if (res == 200) {
          const index = this.candidates.findIndex(candidate => candidate.idCandidate === idCandidate);
          if (index !== -1) {
            this.candidates.splice(index, 1);
          }
          this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Candidate deleted!' });

        }
      },
      error: (error: any) => {
        console.log(error);
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error occurred while deleting candidate: ' + error.name + ": " + error.statusText });
      }
    });
  }
  update(c: Candidate) {
    this.router.navigate(['updateCandidate'], {
      state: {
        data: c
      }
    });
  }
}
