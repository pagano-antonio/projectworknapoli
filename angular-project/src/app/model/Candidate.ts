import { JobInterview } from "./JobInterview";
import { CandidateCommercialData } from "./CommercialData";
import { Skill } from "./Skill";
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
    public jobInterviews!: JobInterview[];
    public CandidateCommercialData!: CandidateCommercialData;
    public candidateSkills!: Skill[];
}
