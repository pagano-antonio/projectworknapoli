import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { Router, NavigationExtras } from '@angular/router';
import { WelcomeComponent } from '../welcome/welcome/welcome.component';
import { ErrorComponent } from '../errors/error/error.component';
import { CommonModule } from '@angular/common';
import { Login } from '../services/login.service';
import { Employee } from '../model/Employee';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule, ButtonModule, WelcomeComponent, ErrorComponent],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {
  [x: string]: any;
  Object: any;
  ngOnInit(): void {
  }

  constructor(private router: Router, private loginService: Login) {

  }
  user: string = '';
  password: string = '';
  errorMessage: string = '';
  employee: Employee = {} as Employee;

  login() {
    if (!this.user || !this.password) {
      this.errorMessage = "Please enter both username and password to login.";
      return;
    }

    this.loginService.getEmployeeByUsername(this.user).subscribe({
      next: (emp) => {
        if (!emp) {
          this.errorMessage = "Invalid username or password.";
        } else if (emp.password !== this.password) {
          this.errorMessage = "Invalid password.";
        } else {
          let navigationExtras: NavigationExtras = {
            state: {
              employee: emp
            }
          };
          this.router.navigate(['/welcome'], navigationExtras);
        }
      },
      error: (error) => {
        this.errorMessage = "An error occurred while logging in. Please try again later.";
        console.error("Error during login:", error);
      }
    });
  }


  getObjectEntries(obj: any): any[] {
    return Object.entries(obj);
  }
}
