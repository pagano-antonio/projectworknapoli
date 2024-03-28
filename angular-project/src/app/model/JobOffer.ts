import { CompanyClient } from "./CompanyClient";
import { ContractType } from "./ContractType";
import { JobOfferSkill } from "./JobOfferSkill";


export class JobOffer {
    public idJobOffer!: number;
    public description!: string;
    public endDate!: Date;
    public maxRal!: number;
    public minRal!: number;
    public startDate!: Date;
    public title!: string;
    public companyClient!: CompanyClient;
    public contractType!: ContractType;
    public jobOfferSkills!: JobOfferSkill[];

    constructor() {
    }
}