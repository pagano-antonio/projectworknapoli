import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchCandidateComponent } from './search-candidate.component';

describe('SearchCandidateComponent', () => {
  let component: SearchCandidateComponent;
  let fixture: ComponentFixture<SearchCandidateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SearchCandidateComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(SearchCandidateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
