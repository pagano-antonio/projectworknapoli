import { Component } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';
import { ButtonModule } from 'primeng/button';
import { CommonModule } from '@angular/common';
import { SidebarComponent } from "./sidebar/sidebar/sidebar.component";
@Component({
  selector: 'app-root',
  standalone: true,
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
  imports: [RouterOutlet, ButtonModule, CommonModule, SidebarComponent]
})
export class AppComponent {
  title = 'angular-project';
  sidebar: boolean = false;

  constructor(private router: Router) { }

  showLayout(): boolean {
    const currentUrl = this.router.url;
    return currentUrl !== '/' && currentUrl !== '/login';
  }

  toggleSidebar = () => {
    this.sidebar = !this.sidebar;
  }
}


