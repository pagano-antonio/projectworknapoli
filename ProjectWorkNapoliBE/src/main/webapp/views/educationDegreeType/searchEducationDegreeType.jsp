<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>Search education degree type</h2>
			<form action="${pageContext.request.contextPath}/EducationDegreeTypeCtr/searchEducationDegreeType" method="post">
			   <div class="input-100 mb-2">
			  <label class="form-label" for="id">Id:</label>
			  <input class="form-control" type="number" id="id" name="id">
			  </div>
			  <div class="input-100 mb-2">
			  <label class="form-label" for="description">Description:</label>
			  <input class="form-control" type="text" id="description" name="description">
			  </div>
			  <input class="btn form-btn" type="submit" value="Search Education Degree Type">
			</form>
	</div>
	</div>
	<div class="my-toast ${toastTitle}">
    <div class="my-toast-content">
    <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>close</title><path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>
    
        <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>check-circle-outline</title><path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
        <div class="message">
            <span class="text text-1">${toastTitle}!</span>
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