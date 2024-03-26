import { TestBed } from '@angular/core/testing';

import { EducationDegreeTypeService } from './education-degree-type.service';

describe('EducationDegreeTypeService', () => {
  let service: EducationDegreeTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(EducationDegreeTypeService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
