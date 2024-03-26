import { TestBed } from '@angular/core/testing';

import { JobStateInterviewService } from './job-state-interview.service';

describe('JobStateInterviewService', () => {
  let service: JobStateInterviewService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(JobStateInterviewService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
