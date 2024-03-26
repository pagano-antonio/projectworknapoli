import { Candidate } from './Candidate';
import { EducationDegreeType } from './EducationDegreeType';

export class Education {
    public idEducation!: number;
    public date!: Date;
    public finalGrade!: string;
    public place!: string;
    public schoolName!: string;
    public candidate!: Candidate;
    public educationDegreeType!: EducationDegreeType;

    constructor() {
    }
}


