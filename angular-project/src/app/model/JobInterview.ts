import { Candidate } from "./Candidate";
import { Employee } from "./Employee";
import { StateJobInterview } from "./stateJobInterview";

export class JobInterview {
    public idJobInterview!: number;

    public date!: string;

    public notes!: string;

    public outcome!: number;

    public candidate!: Candidate;

    public employee!: Employee;

    public stateJobInterview!: StateJobInterview;


}