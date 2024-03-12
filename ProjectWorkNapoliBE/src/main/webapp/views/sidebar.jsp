<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/globalStyle.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

 <!-- Sidebar  -->
        <nav id="sidebar">
            <ul class="list-unstyled components">
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>account-multiple</title><path d="M16 17V19H2V17S2 13 9 13 16 17 16 17M12.5 7.5A3.5 3.5 0 1 0 9 11A3.5 3.5 0 0 0 12.5 7.5M15.94 13A5.32 5.32 0 0 1 18 17V19H22V17S22 13.37 15.94 13M15 4A3.39 3.39 0 0 0 13.07 4.59A5 5 0 0 1 13.07 10.41A3.39 3.39 0 0 0 15 11A3.5 3.5 0 0 0 15 4Z" /></svg>
                    <span>Candidati</span>
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li><a href="${pageContext.request.contextPath}/CandidateCtr/preAddCandidate">Aggiungi candidato</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCtr/preFindById">Cerca un candidato tramite l'id</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCtr/preUpdateCandidate">Aggiorna il candidato tramite l'id</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCtr/preDeleteCandidate">Elimina il candidato tramite l'id</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preFindById">Cerca i dati commerciali tramite id</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preAddCandidateCommercial">Aggiungi i dati commerciali</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preUpdateCandidateCommercial">Modifica i dati commerciali</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preUpdateCandidateCommercial">Aggiorna i dati commerciali</a></li>
                         <li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preFindById">Cerca le skill del candidato tramite id</a></li> 
                      	<li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preAddCandidateSkill">Aggiungi le skill del candidato</a></li>
                      	<li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preUpdateCandidateSkill">Aggiorna le skill del candidato</a></li>
                      	<li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preDeleteCandidateSkill">Elimina le skill del candidato</a></li>
                       <li><a href="${pageContext.request.contextPath}/EducationCtr/preAddEducation">Aggiungi Titolo di Studio Candidato</a></li>
                        <li><a href="${pageContext.request.contextPath}/EducationCtr/preFindById">Cerca per Titolo di Studio Candidato</a></li>
                    	<li><a href="${pageContext.request.contextPath}/EducationCtr/preDelete">Elimina per Titolo di Studio Candidato</a></li>
 						<li><a href="${pageContext.request.contextPath}/EducationCtrDegreeType/preAddEducationDegreeType">Aggiungi Tipo Titolo di Studio </a></li>
                        <li><a href="${pageContext.request.contextPath}/EducationCtrDegreeType/preFindById">Cerca per Tipo Titolo di Studio </a></li>
                    	<li><a href="${pageContext.request.contextPath}/EducationCtrDegreeType/preDeleteEducationDegreeType">Elimina per Tipo Titolo di Studio </a></li>
 
                    </ul>
                </li>
                <li>
                    <a href="#jobOffer" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>briefcase</title><path d="M10,2H14A2,2 0 0,1 16,4V6H20A2,2 0 0,1 22,8V19A2,2 0 0,1 20,21H4C2.89,21 2,20.1 2,19V8C2,6.89 2.89,6 4,6H8V4C8,2.89 8.89,2 10,2M14,6V4H10V6H14Z" /></svg>
                    <span>Offerte di lavoro</span>
                    </a>
                    <ul class="collapse list-unstyled" id="jobOffer">
                        <li><a href="${pageContext.request.contextPath}/JobOfferCtr/jobOfferForm">Crea offerta di lavoro</a></li>
                        <li><a href="${pageContext.request.contextPath}/JobOfferCtr/jobOffers">Tutte le offerte di lavoro</a></li>
                       <li><a href="${pageContext.request.contextPath}/JobOfferCtr/searchJobOfferForm">Cerca offerta di lavoro</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#skill" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>star-cog</title><path d="M18.8 12C15.59 12.1 12.91 14.37 12.19 17.39L12 17.27L5.82 21L7.45 13.97L2 9.24L9.19 8.62L12 2L14.81 8.62L22 9.24L18.8 12M23.83 20.64L22.83 22.37C22.76 22.5 22.63 22.5 22.5 22.5L21.27 22C21 22.18 20.73 22.34 20.43 22.47L20.24 23.79C20.22 23.91 20.11 24 20 24H18C17.86 24 17.76 23.91 17.74 23.79L17.55 22.47C17.24 22.35 16.96 22.18 16.7 22L15.46 22.5C15.34 22.5 15.21 22.5 15.15 22.37L14.15 20.64C14.09 20.53 14.12 20.4 14.21 20.32L15.27 19.5C15.25 19.33 15.24 19.17 15.24 19S15.25 18.67 15.27 18.5L14.21 17.68C14.11 17.6 14.09 17.47 14.15 17.36L15.15 15.63C15.22 15.5 15.35 15.5 15.46 15.5L16.7 16C16.96 15.82 17.25 15.66 17.55 15.53L17.74 14.21C17.76 14.09 17.87 14 18 14H20C20.11 14 20.22 14.09 20.23 14.21L20.42 15.53C20.73 15.65 21 15.82 21.27 16L22.5 15.5C22.63 15.5 22.76 15.5 22.82 15.63L23.82 17.36C23.88 17.47 23.85 17.6 23.76 17.68L22.7 18.5C22.73 18.67 22.74 18.83 22.74 19S22.72 19.33 22.7 19.5L23.77 20.32C23.86 20.4 23.89 20.53 23.83 20.64M20.5 19C20.5 18.17 19.83 17.5 19 17.5S17.5 18.17 17.5 19 18.16 20.5 19 20.5C19.83 20.5 20.5 19.83 20.5 19Z" /></svg>
                	<span>Skills</span>
                	</a>
                    <ul class="collapse list-unstyled" id="skill">
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toAdd">Aggiungi skill</a></li>
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toUpdateById">Aggiorna skill per id</a></li>
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toDeleteById">Elimina skill per id</a></li>
                       <li><a href="#">Page 3</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#stateJob" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>microphone</title><path d="M12,2A3,3 0 0,1 15,5V11A3,3 0 0,1 12,14A3,3 0 0,1 9,11V5A3,3 0 0,1 12,2M19,11C19,14.53 16.39,17.44 13,17.93V21H11V17.93C7.61,17.44 5,14.53 5,11H7A5,5 0 0,0 12,16A5,5 0 0,0 17,11H19Z" /></svg>
                	<span>Stato job interview</span>
                	</a>
                    <ul class="collapse list-unstyled" id="stateJob">
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toAdd">Aggiungi stato della job interview</a></li>
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toUpdateById">Aggiorna stato della job interview per id</a></li>
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toDeleteById">Elimina stato della job interview per id</a></li>
                       <li><a href="#">Page 3</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#workExp" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>domain</title><path d="M18,15H16V17H18M18,11H16V13H18M20,19H12V17H14V15H12V13H14V11H12V9H20M10,7H8V5H10M10,11H8V9H10M10,15H8V13H10M10,19H8V17H10M6,7H4V5H6M6,11H4V9H6M6,15H4V13H6M6,19H4V17H6M12,7V3H2V21H22V7H12Z" /></svg>
                	<span>Esperienze lavorative</span>
                	</a>
                    <ul class="collapse list-unstyled" id="workExp">
                        <li><a href="${pageContext.request.contextPath}/workExpCtr/toAdd">Aggiungi esperienze lavorative</a></li>
                        <li><a href="${pageContext.request.contextPath}/workExpCtr/toUpdateById">Aggiorna stato delle esperienze lavorative per id</a></li>
                        <li><a href="${pageContext.request.contextPath}/workExpCtr/toDeleteById">Elimina stato delle esperienze lavorative per id</a></li>
                       <li><a href="#">Page 3</a></li>
                    </ul>
                </li>
                <li><a href="#">Sub menu</a></li>
            </ul>
        </nav>

        <!-- Overlay  -->
        <div id="overlay" class="d-md-none">
            <div id="dismiss">
                <i class="fas fa-arrow-left"></i>
            </div>
	</div>
</body>
</html>