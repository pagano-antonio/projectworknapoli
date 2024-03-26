<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Gestional Tool</title>
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
                    <span>Candidates</span>
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li><a href="${pageContext.request.contextPath}/CandidateCtr/allCandidates">All candidates</a></li>
                     	<li><a href="${pageContext.request.contextPath}/CandidateCtr/searchCandidateForm">Search candidate</a></li>
                       	<li><a href="${pageContext.request.contextPath}/CandidateCtr/preAddCandidate">Add candidate</a></li>
             <%--            <li><a href="${pageContext.request.contextPath}/CandidateCtr/preFindById">Search for candidate by id</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preFindById">Search commercial data by id</a></li> --%>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preAddCandidateCommercial">Add commercial data</a></li>
                    <%--     <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preUpdateCandidateCommercial">Modify commercial data</a></li>
                        <li><a href="${pageContext.request.contextPath}/CandidateCommercialCtr/preUpdateCandidateCommercial">Update commercial data</a></li> --%>
                    <%--      <li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preFindById">Search candidate skills by id</a></li>  --%>
                      	<li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preAddCandidateSkill">Add candidate skills</a></li>
             <%--          	<li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preUpdateCandidateSkill">Update candidate skills</a></li>
                      	<li><a href="${pageContext.request.contextPath}/CandidateSkillCtr/preDeleteCandidateSkill">Delete candidate skills</a></li> --%>
                       <li><a href="${pageContext.request.contextPath}/EducationCtr/preAddEducation">Add Candidate Education</a></li>
                 <%--        <li><a href="${pageContext.request.contextPath}/EducationCtr/preFindById">Search by Candidate Education</a></li>
                    	<li><a href="${pageContext.request.contextPath}/EducationCtr/preDelete">Delete by Candidate Education</a></li> --%>
 					<%-- 	<li><a href="${pageContext.request.contextPath}/EducationDegreeTypeCtr/preAddEducationDegreeType">Add Education Degree Type </a></li>
                        <li><a href="${pageContext.request.contextPath}/EducationDegreeTypeCtr/preFindById">Search by Education Degree Type </a></li>
                    	<li><a href="${pageContext.request.contextPath}/EducationDegreeTypeCtr/preDeleteEducationDegreeType">Delete by Education Degree Type </a></li>
  --%>
                    </ul>
                </li>
                 <li>
                	<a href="#workExp" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>briefcase</title><path d="M10,2H14A2,2 0 0,1 16,4V6H20A2,2 0 0,1 22,8V19A2,2 0 0,1 20,21H4C2.89,21 2,20.1 2,19V8C2,6.89 2.89,6 4,6H8V4C8,2.89 8.89,2 10,2M14,6V4H10V6H14Z" /></svg>
                	<span>Work Experiences</span>
                	</a>
                    <ul class="collapse list-unstyled" id="workExp">
                        <li><a href="${pageContext.request.contextPath}/workExpCtr/toAdd">Add work experiences</a></li>
                        <li><a href="${pageContext.request.contextPath}/workExpCtr/toUpdateById">Update work experiences by id</a></li>
                        <li><a href="${pageContext.request.contextPath}/workExpCtr/toDeleteById">Delete work experiences by id</a></li>
                   </ul>
                </li>
                <li>
                    <a href="#jobOffer" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>email-newsletter</title><path d="M12 .64L8.23 3H5V5L2.97 6.29C2.39 6.64 2 7.27 2 8V18C2 19.11 2.9 20 4 20H20C21.11 20 22 19.11 22 18V8C22 7.27 21.61 6.64 21.03 6.29L19 5V3H15.77M7 5H17V9.88L12 13L7 9.88M8 6V7.5H16V6M5 7.38V8.63L4 8M19 7.38L20 8L19 8.63M8 8.5V10H16V8.5Z" /></svg>
                   <span>Job Offers</span>
                    </a>
                    <ul class="collapse list-unstyled" id="jobOffer">
                        <li><a href="${pageContext.request.contextPath}/JobOfferCtr/jobOffers">All job offers</a></li>
                       <li><a href="${pageContext.request.contextPath}/JobOfferCtr/jobOfferForm">Create job offer</a></li>
                        
                       <li><a href="${pageContext.request.contextPath}/JobOfferCtr/searchJobOfferForm">Search job offer</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#interviewJob" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>microphone</title><path d="M12,2A3,3 0 0,1 15,5V11A3,3 0 0,1 12,14A3,3 0 0,1 9,11V5A3,3 0 0,1 12,2M19,11C19,14.53 16.39,17.44 13,17.93V21H11V17.93C7.61,17.44 5,14.53 5,11H7A5,5 0 0,0 12,16A5,5 0 0,0 17,11H19Z" /></svg>
                	<span>Job Interview</span>
                	</a>
                    <ul class="collapse list-unstyled" id="interviewJob">
                     <li><a href="${pageContext.request.contextPath}/JobInterviewCtr/allJobInterviews">All job interviews</a></li>
                   
                    <li><a href="${pageContext.request.contextPath}/JobInterviewCtr/addJobInterviewForm">Add job interview</a></li>
                      <li><a href="${pageContext.request.contextPath}/JobInterviewCtr/searchJobInterviewForm">Search job interview</a></li>
                  
                   </ul>
                </li>
                <li>
                	<a href="#stateJob" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>state-machine</title><path d="M6.27 17.05C6.72 17.58 7 18.25 7 19C7 20.66 5.66 22 4 22S1 20.66 1 19 2.34 16 4 16C4.18 16 4.36 16 4.53 16.05L7.6 10.69L5.86 9.7L9.95 8.58L11.07 12.67L9.33 11.68L6.27 17.05M20 16C18.7 16 17.6 16.84 17.18 18H11V16L8 19L11 22V20H17.18C17.6 21.16 18.7 22 20 22C21.66 22 23 20.66 23 19S21.66 16 20 16M12 8C12.18 8 12.36 8 12.53 7.95L15.6 13.31L13.86 14.3L17.95 15.42L19.07 11.33L17.33 12.32L14.27 6.95C14.72 6.42 15 5.75 15 5C15 3.34 13.66 2 12 2S9 3.34 9 5 10.34 8 12 8Z" /></svg>
                	<span>Job Interview State</span>
                	</a>
                    <ul class="collapse list-unstyled" id="stateJob">
                    <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/goToAllStateJobInterview">All job interview status</a></li>
                        
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toAdd">Add job interview status</a></li>
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/searchJobInterviewForm">Search state job interview</a></li>
                        
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toUpdateById">Update job interview state by id</a></li>
                        <li><a href="${pageContext.request.contextPath}/stateJobIntCtr/toDeleteById">Delete job interview state by id</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#company" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>domain</title><path d="M18,15H16V17H18M18,11H16V13H18M20,19H12V17H14V15H12V13H14V11H12V9H20M10,7H8V5H10M10,11H8V9H10M10,15H8V13H10M10,19H8V17H10M6,7H4V5H6M6,11H4V9H6M6,15H4V13H6M6,19H4V17H6M12,7V3H2V21H22V7H12Z" /></svg>
                	<span>Company Client</span>
                	</a>
                    <ul class="collapse list-unstyled" id="company">
                   <li></li>
                    </ul>
                </li>
                <li>
                	<a href="#contractType" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>file-sign</title><path d="M19.7 12.9L14 18.6H11.7V16.3L17.4 10.6L19.7 12.9M23.1 12.1C23.1 12.4 22.8 12.7 22.5 13L20 15.5L19.1 14.6L21.7 12L21.1 11.4L20.4 12.1L18.1 9.8L20.3 7.7C20.5 7.5 20.9 7.5 21.2 7.7L22.6 9.1C22.8 9.3 22.8 9.7 22.6 10C22.4 10.2 22.2 10.4 22.2 10.6C22.2 10.8 22.4 11 22.6 11.2C22.9 11.5 23.2 11.8 23.1 12.1M3 20V4H10V9H15V10.5L17 8.5V8L11 2H3C1.9 2 1 2.9 1 4V20C1 21.1 1.9 22 3 22H15C16.1 22 17 21.1 17 20H3M11 17.1C10.8 17.1 10.6 17.2 10.5 17.2L10 15H8.5L6.4 16.7L7 14H5.5L4.5 19H6L8.9 16.4L9.5 18.7H10.5L11 18.6V17.1Z" /></svg>
                	<span>Contract Type</span>
                	</a>
                    <ul class="collapse list-unstyled" id="contractType">
                     <li><a href="${pageContext.request.contextPath}/ContractTypeCtr/allContractType">All Contract Type</a></li>
                     <li><a href="${pageContext.request.contextPath}/ContractTypeCtr/addContractTypeform">Add Contract Type</a></li>
                     <li><a href="${pageContext.request.contextPath}/ContractTypeCtr/SearchContractTypeform">Search Contract Type</a></li>
                     </ul>
                     
                </li>
                <li>
                	<a href="#skill" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>star-cog</title><path d="M18.8 12C15.59 12.1 12.91 14.37 12.19 17.39L12 17.27L5.82 21L7.45 13.97L2 9.24L9.19 8.62L12 2L14.81 8.62L22 9.24L18.8 12M23.83 20.64L22.83 22.37C22.76 22.5 22.63 22.5 22.5 22.5L21.27 22C21 22.18 20.73 22.34 20.43 22.47L20.24 23.79C20.22 23.91 20.11 24 20 24H18C17.86 24 17.76 23.91 17.74 23.79L17.55 22.47C17.24 22.35 16.96 22.18 16.7 22L15.46 22.5C15.34 22.5 15.21 22.5 15.15 22.37L14.15 20.64C14.09 20.53 14.12 20.4 14.21 20.32L15.27 19.5C15.25 19.33 15.24 19.17 15.24 19S15.25 18.67 15.27 18.5L14.21 17.68C14.11 17.6 14.09 17.47 14.15 17.36L15.15 15.63C15.22 15.5 15.35 15.5 15.46 15.5L16.7 16C16.96 15.82 17.25 15.66 17.55 15.53L17.74 14.21C17.76 14.09 17.87 14 18 14H20C20.11 14 20.22 14.09 20.23 14.21L20.42 15.53C20.73 15.65 21 15.82 21.27 16L22.5 15.5C22.63 15.5 22.76 15.5 22.82 15.63L23.82 17.36C23.88 17.47 23.85 17.6 23.76 17.68L22.7 18.5C22.73 18.67 22.74 18.83 22.74 19S22.72 19.33 22.7 19.5L23.77 20.32C23.86 20.4 23.89 20.53 23.83 20.64M20.5 19C20.5 18.17 19.83 17.5 19 17.5S17.5 18.17 17.5 19 18.16 20.5 19 20.5C19.83 20.5 20.5 19.83 20.5 19Z" /></svg>
                	<span>Skills</span>
                	</a>
                    <ul class="collapse list-unstyled" id="skill">
                    <li><a href="${pageContext.request.contextPath}/skillCtr/allSkills">All skills</a></li>
                        
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toAdd">Add skill</a></li>
                         <li><a href="${pageContext.request.contextPath}/skillCtr/searchSkillForm">Search skill</a></li>
                      
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toUpdateById">Update skill by id</a></li>
                        <li><a href="${pageContext.request.contextPath}/skillCtr/toDeleteById">Delete skill by id</a></li>
                    </ul>
                </li>
                <li>
                	<a href="#education" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>school</title><path d="M12,3L1,9L12,15L21,10.09V17H23V9M5,13.18V17.18L12,21L19,17.18V13.18L12,17L5,13.18Z" /></svg>
                	<span>Education Degree Type</span>
                	</a>
                    <ul class="collapse list-unstyled" id="education">
                        <li><a href="${pageContext.request.contextPath}/EducationDegreeTypeCtr/allEducationDegreeTypes">All education degree types</a></li>
                        <li><a href="${pageContext.request.contextPath}/EducationDegreeTypeCtr/addEducationDegreeTypeForm">Add education degree type</a></li>
                     	<li><a href="${pageContext.request.contextPath}/EducationDegreeTypeCtr/searchEducationDegreeTypeForm">Search education degree type</a></li>
                    </ul>
                </li>
                 <li>
                	<a href="#emp" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>account-tie</title><path d="M12 3C14.21 3 16 4.79 16 7S14.21 11 12 11 8 9.21 8 7 9.79 3 12 3M16 13.54C16 14.6 15.72 17.07 13.81 19.83L13 15L13.94 13.12C13.32 13.05 12.67 13 12 13S10.68 13.05 10.06 13.12L11 15L10.19 19.83C8.28 17.07 8 14.6 8 13.54C5.61 14.24 4 15.5 4 17V21H20V17C20 15.5 18.4 14.24 16 13.54Z" /></svg>
                	<span>Employees</span>
                	</a>
                    <ul class="collapse list-unstyled" id="emp">
                        <li><a href="${pageContext.request.contextPath}/EmployeeCtr/addEmployeeForm">Add employee</a></li>
                        
                    </ul>
                </li>
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
