import { JobInterview } from "./JobInterview";
import { CandidateCommercialData } from "./CommercialData";
import { Skill } from "./Skill";
import { Education } from "./Education";
import { WorkExperience } from "./WorkExperience";
export class Candidate {
    public idCandidate!: number;
    public address!: string;
    public birthday!: Date;
    public birthPlace!: string;
    public city!: string;
    public email!: string;
    public name!: string;
    public phone!: string;
    public surname!: string;
    public jobInterviews: JobInterview[] = [];
    public CandidateCommercialData: CandidateCommercialData = new CandidateCommercialData;
    public educations: Education[] = [];
    public workExperiences: WorkExperience[] = [];
    public commercialData: CandidateCommercialData[] = [];
    public candidateSkills: Skill[] = [];
}
