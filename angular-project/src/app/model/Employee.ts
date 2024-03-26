import { EmployeeType } from "./EmployeeType";
import { JobInterview } from "./JobInterview";

export class Employee {
    public idEmployee!: number;

    public email!: String;

    public name!: String;

    public password!: String;

    public surname!: String;

    public username!: string;

    public employeeType!: EmployeeType;

    public jobInterviews!: JobInterview[];
}