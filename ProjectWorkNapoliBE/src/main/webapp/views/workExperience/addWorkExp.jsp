<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add work experience</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
					<c:if test="${reload}">
			 	
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

	<h2>Add Work Experience</h2>

			<form action="${pageContext.request.contextPath}/workExpCtr/addWorkExp" method="get">
			
			    <!-- Select Candidate-->
                <div class="mb-2 input-100">
                    <label class="form-label" for="candidate.idCandidate">Select Candidate:</label>
                    <select name="candidate.idCandidate" class="multiselect">
                    <c:forEach var="c" items="${candidates}">
                            <option value="${c.idCandidate}">${c.name} ${c.surname}</option>
                    </c:forEach>
                    </select>
                </div>
 
			   <!-- Title -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">Title:</label>
                    <input type="text" name="title" required class="form-control">
                </div>
			   <!-- description -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">description:</label>
                    <input type="text" name="description" required class="form-control">
                </div>
			   
			                 <!-- Start Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="startDate">Start Date:</label>
                    <input type="date" name="startDate" class="form-control" required>
                </div>

                <!-- End Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="endDate">End Date:</label>
                    <input type="date" name="endDate" class="form-control" required>
               </div>
               
			  <!-- work exp company -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="company">Azienda:</label>
                    <input type="text" name="company" required class="form-control">
                </div>
                
               	<!-- work exp city -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="city">Città:</label>
                    <input type="text" name="city" required class="form-control">
                </div>
               
                <!-- Submit Button -->
            	<input type="submit" value="Add" class="btn form-btn">
			</form>
	</div>
	</div>
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