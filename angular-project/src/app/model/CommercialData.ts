import { Candidate } from "./Candidate";

export class CandidateCommercialData {
    public idCandidateCommercial!: number;
    public businessCost!: number;
    public currentRal!: number;
    public monthRefund!: number;
    public notes!: string;
    public proposedRal!: number;
    public subsidyFlag!: boolean;
    public candidate!: Candidate;

    constructor() { }
}
