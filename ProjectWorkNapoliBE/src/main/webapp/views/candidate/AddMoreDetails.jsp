<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Recruiter Gestional Tool</title>

</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
			<h2>${candidate.name} ${candidate.surname}</h2><br>
		
			<h2>Education</h2><br>
			
			<c:if test="${reload}">
			 	<!-- tabella educazione -->
			    <table class="table table-striped table-sm align-middle table-responsive">
			        <thead>
			            <tr>
			                <th>Title</th>
			                <th>School name</th>
			                <th>City</th>
			                <th>Date</th>
			                <th >Final grade</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="education" items="${educationsOfCandidate}">
			                <tr>
			                    <td class="align-middle">${education.educationDegreeType.description}</td>
			 					<td class="align-middle">${education.schoolName}</td>
			                    <td class="align-middle">${education.place}</td>
			                    <td class="align-middle">
			                        <fmt:formatNumber value="${education.date.dayOfMonth}" pattern="00"/>-
			                        <fmt:formatNumber value="${education.date.monthValue}" pattern="00"/>-
			                        <fmt:formatNumber value="${education.date.year}" pattern="0000"/>
			                    </td>
			                    <td class="align-middle" style="text-align:center">${education.finalGrade}</td>
			            </c:forEach>
			        </tbody>
			    </table>
			    	   <div class="my-toast ${toastTitle}">
    <div class="my-toast-content">
    <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>close</title><path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>
    
        <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>check-circle-outline</title><path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
        <div class="message">
            <span class="text text-1">${toastTitle}</span>
            <span class="text text-2">${toastMessage}</span>
        </div>
    </div>
    <div class="progress active"></div>
</div>
	<input type="hidden" id="modelAttr" name="modelAttr" value="${showToast}"/>
			</c:if>

			<form action="${pageContext.request.contextPath}/EducationCtr/addEducationToCandidate" method="post">
			
                <!-- Select degree type  -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="idDegreeType">Select degree type:</label>
                    <select name="idDegreeType" class="multiselect">
                    <c:forEach var="type" items="${degreeType}">
                            <option value="${type.idEducationDegreeType}">${type.description}</option>
                     </c:forEach>
                    </select>
                </div>
                
               <!-- school name -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="schoolName">School name:</label>
                    <input type="text" name="schoolName" required class="form-control">
                </div>
                
                <!-- education place -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="place">City:</label>
                    <input type="text" name="place" required class="form-control">
                </div>
                
                <!-- date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="date">Date:</label>
                    <input type="date" name="date" class="form-control" required>
               </div>
               
                <!-- final Grade -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="finalGrade">Final grade:</label>
                    <input type="number" name="finalGrade" class="form-control" required>
               </div>
               
                <!-- Submit Button -->
                <input type="hidden" name="idCandidate" required class="form-control" value="${candidate.idCandidate}">
            	<input type="submit" class="btn form-btn" value="Add another education">
            	</form>
               
               <br><br><br>
				<h2>Work experience</h2><br>
				
				
				<c:if test="${reloadW}">
					<!-- tabella work exp -->
				    <table class="table table-striped table-sm align-middle table-responsive">
				        <thead>
				            <tr>
				                <th>Title</th>
				                <th>Description</th>
				                <th>Start date</th>
				                <th>End date</th>
				                <th>Company</th>
				                <th>City</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="job" items="${workExpOfCandidate}">
				                <tr>
				                    <td class="align-middle">${job.title}</td>
				 					<td class="align-middle">${job.description}</td>
				                    <td class="align-middle">
				                        <fmt:formatNumber value="${job.startDate.dayOfMonth}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.startDate.monthValue}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.startDate.year}" pattern="0000"/>
				                    </td>
				                    <td class="align-middle">
				                        <fmt:formatNumber value="${job.endDate.dayOfMonth}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.endDate.monthValue}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.endDate.year}" pattern="0000"/>
				                    </td>
				                    <td class="align-middle">${job.company}</td>
				                    <td class="align-middle" style="text-align:center">${job.city}</td>
				            </c:forEach>
				        </tbody>
				    </table>
				    	   <div class="my-toast ${toastTitle}">
    <div class="my-toast-content">
    <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>close</title><path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>
    
        <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>check-circle-outline</title><path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
        <div class="message">
            <span class="text text-1">${toastTitle}</span>
            <span class="text text-2">${toastMessage}</span>
        </div>
    </div>
    <div class="progress active"></div>
</div>
	<input type="hidden" id="modelAttr" name="modelAttr" value="${showToast}"/>
				</c:if>
				<br>
				<form action="${pageContext.request.contextPath}/workExpCtr/addWorkExpToCandidate" method="post">
				<!-- work exp title -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">Title:</label>
                    <input type="text" name="title" required class="form-control">
                </div>
                
                 <!-- work exp Description -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="description">Description:</label>
                    <textarea rows="4" cols="50" name="description" class="form-control"></textarea>
                </div>
                
                <!-- Start Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="startDate">Start date:</label>
                    <input type="date" name="startDate" class="form-control" required>
                </div>

                <!-- End Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="endDate">End date:</label>
                    <input type="date" name="endDate" class="form-control" required>
               </div>
               
               	<!-- work exp company -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="company">Company:</label>
                    <input type="text" name="company" required class="form-control">
                </div>
                
               	<!-- work exp city -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="city">City:</label>
                    <input type="text" name="city" required class="form-control">
                </div>
               
                <!-- Submit Button -->
                <input type="hidden" name="idCandidate" required class="form-control" value="${candidate.idCandidate}">
            	<input type="submit" class="btn form-btn" value="Add another work experience">
			
			</form>
			
		</div>
	</div>
	   <div class="my-toast ${toastTitle}">
    <div class="my-toast-content">
    <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>close</title><path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>
    
        <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>check-circle-outline</title><path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
        <div class="message">
            <span class="text text-1">${toastTitle}</span>
            <span class="text text-2">${toastMessage}</span>
        </div>
    </div>
    <div class="progress active"></div>
</div>
	<input type="hidden" id="modelAttr" name="modelAttr" value="${showToast}"/>

<script>

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