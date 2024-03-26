<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Candidates Results</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
		<c:set var = "update" scope = "session" value = "update"/>
		
			<h2>Candidate Results</h2>

			<table class="table table-striped table-sm align-middle">
				<thead>
					<tr >
						<th class="align-middle">ID</th>
						<th class="align-middle">Name</th>
						<th class="align-middle">Surname</th>
						<th class="align-middle">Birthday</th>
						<th class="align-middle">BirthPlace</th>
						<th class="align-middle">Address</th>
						<th class="align-middle">City</th>
						<th class="align-middle">Email</th>
						<th class="align-middle">Phone</th>
						<th style="text-align:center" class="align-middle">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="index" value="0" />
					<c:forEach var="candidate" items="${candidates}">
						<tr onclick="openTr(${index})" class="cursor">
							<td class="align-middle">${candidate.idCandidate}</td>
							<td class="align-middle">${candidate.name}</td>
							<td class="align-middle">${candidate.surname}</td>
							<td class="align-middle"><fmt:formatNumber
									value="${candidate.birthday.dayOfMonth}" pattern="00" />- <fmt:formatNumber
									value="${candidate.birthday.monthValue}" pattern="00" />- <fmt:formatNumber
									value="${candidate.birthday.year}" pattern="0000" /></td>
							<td class="align-middle">${candidate.birthPlace}</td>
							<td class="align-middle">${candidate.address}</td>
							<td class="align-middle">${candidate.city}</td>
							<td class="align-middle">${candidate.email}</td>
							<td class="align-middle">${candidate.phone}</td>
							<td class="align-middle">
								<div class="actions">
								    <a href="${pageContext.request.contextPath}/CandidateCtr/findByIdToUpdate?idCandidate=${candidate.idCandidate}">
							       <button> 
							       <i class="fas fa-edit"></i>
							       <span>Edit</span>
									</button>
									 </a>	
									 <a href="${pageContext.request.contextPath}/CandidateCtr/deleteCandidate?idCandidate=${candidate.idCandidate}">
								         <button><i class="fas fa-trash"></i> <span>Delete</span></button>
								    </a>   
		                    </div> 
							</td>
						</tr>
						<td colspan="10" class="info-table hidden pt-2"><c:choose>
								<c:when test="${not empty candidate.educations}">

									<table class="table table-sm align-middle table-responsive mt-5">
										<tr class="info-tr align-middle">
											<th class="align-middle ddd"><h2>Education</h2></th>
											<th class="align-middle ddd" scope="col">Final Grade</th>
											<th class="align-middle ddd" scope="col">Date</th>
											<th class="align-middle ddd" scope="col">School</th>
											<th class="align-middle ddd td-100" scope="col">Place</th>
											<th style="text-align:center" class="align-middle">Actions</th>

										</tr>
										<c:forEach items="${candidate.educations}" var="education">
											<tr class="align-middle ddd">
												<th scope="row" class="ddd">${education.educationDegreeType.description}</th>
												<td class="align-middle">${education.finalGrade}</td>
												<td class="align-middle">${education.date}</td>
												<td class="align-middle">${education.schoolName}</td>
												<td class="align-middle td-100">${education.place}</td>
												<td class="align-middle">
												<div class="actions">
												    <a href="${pageContext.request.contextPath}/EducationCtr/findById?idEducation=${education.idEducation}">
											       <button> 
											       <i class="fas fa-edit"></i>
											       <span>Edit</span>
													</button>
												 </a>	
												 <a href="${pageContext.request.contextPath}/EducationCtr/deleteEducation?idEducation=${education.idEducation}">
											         <button><i class="fas fa-trash"></i> <span>Delete</span></button>
											    </a>   
						                    </div> 
											</td>
											</tr>
										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<p class="mt-5">No education found.</p>
								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${not empty candidate.workExperiences}">

									<table class="table table-sm align-middle table-responsive mt-5">
										<tr class="info-tr align-middle">
											<th class="align-middle ddd"><h2>Working
													Experiences</h2></th>
											<th class="align-middle ddd" scope="col">Description</th>
											<th class="align-middle ddd" scope="col">Company</th>
											<th class="align-middle ddd" scope="col">City</th>
											<th class="align-middle ddd" scope="col">Start Date</th>
											<th class="align-middle ddd" scope="col">End Date</th>
											<th style="text-align:center" class="align-middle">Actions</th>
										</tr>

										<c:forEach items="${candidate.workExperiences}" var="work">
											<tr class="align-middle">
												<th scope="row" class="ddd">${work.title}</th>
												<td class="align-middle">${work.description}</td>
												<td class="align-middle">${work.company}</td>
												<td class="align-middle">${work.city}</td>
												<td class="align-middle">${work.startDate}</td>
												<td class="align-middle">${work.endDate}</td>
												<td>
													<div class="actions">
												    <a href="${pageContext.request.contextPath}/workExpCtr/findById?id=${work.idWorkExperience}&tipoOp=${update}">
											       <button> 
											       <i class="fas fa-edit"></i>
											       <span>Edit</span>
													</button>
												 </a>	
												 <a href="${pageContext.request.contextPath}/workExpCtr/deleteEducation?idEducation=${education.idEducation}">
											         <button><i class="fas fa-trash"></i> <span>Delete</span></button>
											    </a>   
						                    </div> 
											</td>
											</tr>
										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<p class="mt-5">No working experience found.</p>
								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${not empty candidate.candidateCommercialData}">
									<table class="table table-sm align-middle table-responsive mt-5">
										<tr class="info-tr align-middle">
											<th class="align-middle ddd"><h2>Commercial
													Data</h2></th>
											<th class="align-middle ddd" scope="col">Current Ral</th>
											<th class="align-middle ddd" scope="col">Proposed Ral</th>
											<th class="align-middle ddd" scope="col">Month Refund</th>
											<th class="align-middle ddd" scope="col">Business Cost</th>
											<th class="align-middle ddd td-100" scope="col">Notes</th>
											<th style="text-align:center" class="align-middle">Actions</th>
										</tr>
										<c:forEach items="${candidate.candidateCommercialData}"
											var="data">
											<tr>
												<th scope="row" class="ddd"></th>
												<td class="align-middle">${data.currentRal}</td>
												<td class="align-middle">${data.proposedRal}</td>
												<td class="align-middle">${data.monthRefund}</td>
												<td class="align-middle">${data.businessCost}</td>
												<td class="align-middle td-100">${data.notes}</td>
												<td>
												<div class="actions">
												    <a href="${pageContext.request.contextPath}/CandidateCommercialCtr/findByIdToUpdate?idCandidateCommercial=${data.idCandidateCommercial}">
											    <button> 
											       <i class="fas fa-edit"></i>
											    <span>Edit</span>
													</button>
												 </a>	
												 <a href="${pageContext.request.contextPath}/CandidateCommercialCtr/deleteCandidateCommercial?idCandidateCommercial=${data.idCandidateCommercial}">
											         <button><i class="fas fa-trash"></i> <span>Delete</span></button>
											    </a>   
						                    </div> 
											</td>
											</tr>
										</c:forEach>
									</table>

								</c:when>
								<c:otherwise>
									<p class="mt-1">No commercial data found</p>
								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${not empty candidate.jobInterviews}">


									<table class="table table-sm align-middle table-responsive mt-5">
										<tr class="info-tr align-middle">
											<th class="align-middle ddd"><h2>Interviews</h2></th>
											<th class="align-middle ddd" scope="col">Date</th>
											<th class="align-middle ddd" scope="col">Outcome</th>
											<th class="align-middle ddd td-100" scope="col">Notes</th>
											<th style="text-align:center" class="align-middle">Actions</th>
										</tr>
										<c:forEach items="${candidate.jobInterviews}"
											var="jobInterview">
											<tr>
												<th scope="row" class="ddd">${jobInterview.stateJobInterview.title}</th>
												<td class="align-middle">${jobInterview.date}</td>
												<td class="align-middle">${jobInterview.outcome}</td>
												<td class="align-middle td-100">${jobInterview.notes}</td>
												<td>
												<div class="actions">
												    <a href="#">
											    <button> 
											       <i class="fas fa-edit"></i>
											    <span>Edit</span>
													</button>
												 </a>	
												 <a href="#">
											         <button><i class="fas fa-trash"></i> <span>Delete</span></button>
											    </a>   
						                    </div> 
											</td>
											</tr>
										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<p class="mt-5">No interviews found</p>
								</c:otherwise>
							</c:choose></td>
						<c:set var="index" value="${index + 1}" />
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="my-toast">
			<div class="my-toast-content">
				<svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24">
					<title>close</title><path
						d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>

				<svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24">
					<title>check-circle-outline</title><path
						d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
				<div class="message">
					<span class="text text-1">Success!</span> <span class="text text-2">${toastMessage}</span>
				</div>
			</div>
			<div class="progress active"></div>
		</div>


		<input type="hidden" id="modelAttr" name="modelAttr"
			value="${showToast}" />

		<script>

let currentRow = null;

function openTr(index) {
	const rows = document.querySelectorAll(".info-table");
    rows.forEach((r,i) => {
    	if(i == index){
    		if(r.classList.contains("hidden")) {
    			r.classList.remove("hidden");
    		} else {
    			r.classList.add("hidden");
    		}
    		
    	} else {
    	if(!r.classList.contains("hidden")) {
    		r.classList.add("hidden");
    	}
    	}
    })
    
}

document.addEventListener('DOMContentLoaded', function() {
	
        var modelAttr = $("#modelAttr").val();
        if(modelAttr == "true"){
        showToast();
        }
    
});
    function showToast() {
    	const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");
		
        let timer1, timer2;
		

        toast.classList.add("active");
        progress.classList.add("active");

        timer1 = setTimeout(() => {
            toast.classList.remove("active");
        }, 2500);

        timer2 = setTimeout(() => {
            progress.classList.remove("active");
        }, 2500);
    }

    const closeIcon = document.querySelector(".my-toast-close");
    console.log("closeIcon", closeIcon);

    closeIcon.addEventListener("click", () => {
        const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");

        toast.classList.remove("active");

        setTimeout(() => {
            progress.classList.remove("active");
        }, 300);

        clearTimeout(timer1);
        clearTimeout(timer2);
    });
</script>
</body>
</html>
