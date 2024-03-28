import { ComponentFixture, TestBed } from '@angular/core/testing';

import { JobOfferSkillComponent } from './job-offer-skill.component';

describe('JobOfferSkillComponent', () => {
  let component: JobOfferSkillComponent;
  let fixture: ComponentFixture<JobOfferSkillComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [JobOfferSkillComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(JobOfferSkillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
