import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-error',
  standalone: true,
  imports: [],
  templateUrl: './error.component.html',
  styleUrl: './error.component.scss'
})
export class ErrorComponent implements OnInit {
  @Input()
  errorMessage!: string;
  ngOnInit(): void { }
  constructor() { }

}
