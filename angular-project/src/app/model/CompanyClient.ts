import { JobOffer } from "./JobOffer";
export class CompanyClient {
    idCompanyClient!: number;
    address!: string;
    city!: string;
    name!: string;
    jobOffers!: JobOffer[];

    constructor() {
    }
}