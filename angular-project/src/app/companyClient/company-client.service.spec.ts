import { TestBed } from '@angular/core/testing';

import { CompanyClientService } from './company-client.service';

describe('CompanyClientService', () => {
  let service: CompanyClientService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CompanyClientService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
