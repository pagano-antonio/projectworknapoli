import { Component, Input, OnInit } from '@angular/core';
import { Employee } from '../../model/Employee';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-welcome',
  standalone: true,
  imports: [CommonModule],

  templateUrl: './welcome.component.html',
  styleUrl: './welcome.component.scss'
})
export class WelcomeComponent implements OnInit {
  @Input()
  employee!: Employee;
  ngOnInit(): void {
    /* if (history && history != null) {
      this.employee = history.state.employee;
    } */
  }

  constructor() { }


}
