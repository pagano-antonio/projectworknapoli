import { Candidate } from './Candidate';

export class WorkExperience {
    public idWorkExperience!: number;
    public city!: string;
    public company!: string;
    public description!: string;
    public endDate!: Date;
    public startDate!: Date;
    public title!: string;
    public candidate!: Candidate;

    constructor() {
    }
}
