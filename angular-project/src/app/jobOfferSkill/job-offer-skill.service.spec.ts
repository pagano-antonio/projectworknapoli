import { TestBed } from '@angular/core/testing';

import { JobOfferSkillService } from './job-offer-skill.service';

describe('JobOfferSkillService', () => {
  let service: JobOfferSkillService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(JobOfferSkillService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
