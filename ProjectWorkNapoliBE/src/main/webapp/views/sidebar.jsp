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
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Candidati</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li><a href="${pageContext.request.contextPath}/CandidateCtr/preAddCandidate">Aggiungi candidato</a></li>
                       <li><a href="${pageContext.request.contextPath}/EducationCtr/preAddEducation">Aggiungi Titolo di Studio Candidato</a></li>
                        <li><a href="${pageContext.request.contextPath}/EducationCtr/preFindById">Cerca per Titolo di Studio </a></li>
                    	<li><a href="${pageContext.request.contextPath}/EducationCtr/preDelete">Elimina per Titolo di Studio </a></li>
 
                    </ul>
                </li>
                <li>
                    <a href="#jobOffer" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Offerte di lavoro</a>
                    <ul class="collapse list-unstyled" id="jobOffer">
                        <li><a href="${pageContext.request.contextPath}/JobOfferCtr/jobOfferForm">Crea offerta di lavoro</a></li>
                        <li><a href="${pageContext.request.contextPath}/JobOfferCtr/jobOffers">Tutte le offerte di lavoro</a></li>
                        <li><a href="${pageContext.request.contextPath}/JobOfferCtr/searchJobOfferForm">Cerca offerta di lavoro</a></li>
                       
                    </ul>
                </li>
                <li>
                	<a href="#skill" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Skills</a>
                    <ul class="collapse list-unstyled" id="skill">
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toAdd">Aggiungi skill</a></li>
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toUpdateById">Aggiorna skill per id</a></li>
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toDeleteById">Elimina skill per id</a></li>
                       <li><a href="#">Page 3</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#stateJob" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Stato job interview</a>
                    <ul class="collapse list-unstyled" id="stateJob">
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toAdd">Aggiungi stato della job interview</a></li>
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toUpdateById">Aggiorna stato della job interview per id</a></li>
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toDeleteById">Elimina stato della job interview per id</a></li>
                       <li><a href="#">Page 3</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#workExp" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Esperienze lavorative</a>
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