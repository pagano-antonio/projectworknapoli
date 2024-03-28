import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { WelcomeComponent } from './welcome/welcome/welcome.component';
import { ErrorComponent } from './errors/error/error.component';
import { AddCandidateComponent } from './candidate/add-candidate/add-candidate.component';
import { CandidatesListComponent } from './candidate/candidates-list/candidates-list.component';
import { SearchCandidateComponent } from './candidate/search-candidate/search-candidate.component';
import { UpdateCandidateComponent } from './candidate/update-candidate/update-candidate.component';
import { AllJobOffersComponent } from './jobOffer/all-job-offers/all-job-offers.component';
import { AddJobOfferComponent } from './jobOffer/add-job-offer/add-job-offer.component';

export const routes: Routes = [
    {
        path: '',
        component: LoginComponent
    },
    {
        path: 'login',
        component: LoginComponent
    },
    {
        path: 'welcome',
        component: WelcomeComponent
    },
    {
        path: 'searchCandidate',
        component: SearchCandidateComponent
    },
    {
        path: 'addCandidate',
        component: AddCandidateComponent
    },
    {
        path: 'updateCandidate',
        component: UpdateCandidateComponent
    },
    {
        path: 'allJobOffers',
        component: AllJobOffersComponent
    },
    {
        path: 'addJobOffer',
        component: AddJobOfferComponent
    },
    { path: 'allCandidates', component: CandidatesListComponent, data: { state: { found: null } } },
    {
        path: '**',
        component: ErrorComponent
    }
];
