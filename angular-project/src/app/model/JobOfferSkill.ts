import { JobOffer } from './JobOffer';
import { Skill } from './Skill';

export class JobOfferSkill {
    idJobOfferSkill!: number;
    jobOffer!: JobOffer;
    skill!: Skill;

    constructor() {
    }
}