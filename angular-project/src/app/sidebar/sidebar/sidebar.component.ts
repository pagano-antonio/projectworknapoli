import { Component, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { MenuModule } from 'primeng/menu';
import { AccordionModule } from 'primeng/accordion';
import { Router, RouterModule } from '@angular/router';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss'],
  imports: [MenuModule, AccordionModule, RouterModule],
  standalone: true
})
export class SidebarComponent implements OnInit {
  constructor(private router: Router) { }

  candidateLinks!: MenuItem[];

  ngOnInit() {
    this.candidateLinks = [
      { label: 'All candidates', routerLink: ['/allCandidates'] },
      { label: 'Add candidate', routerLink: ['/addCandidate'] },
      { label: 'Search candidate', routerLink: ['/searchCandidate'] }
    ];

  }

}
