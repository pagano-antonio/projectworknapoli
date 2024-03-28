import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AllJobOffersComponent } from './all-job-offers.component';

describe('AllJobOffersComponent', () => {
  let component: AllJobOffersComponent;
  let fixture: ComponentFixture<AllJobOffersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AllJobOffersComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AllJobOffersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
