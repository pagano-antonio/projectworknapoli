<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiter Gestional Tool</title>
</head>
<body>
  <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>All Job Offers</h2>
    
    <table class="table table-striped table-sm align-middle table-responsive">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Min Ral</th>
                <th>Max Ral</th>
                <th>Company</th>
                <th>Contract Type</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="jobOffer" items="${jobOffers}">
                <tr>
                    <td class="align-middle">${jobOffer.idJobOffer}</td>
                    <td class="align-middle">${jobOffer.title}</td>
                    <td class="align-middle">${jobOffer.description}</td>
                    <td class="align-middle">
                        <fmt:formatNumber value="${jobOffer.startDate.dayOfMonth}" pattern="00"/>-
                        <fmt:formatNumber value="${jobOffer.startDate.monthValue}" pattern="00"/>-
                        <fmt:formatNumber value="${jobOffer.startDate.year}" pattern="0000"/>
                    </td>
                    <td class="align-middle">
                        <fmt:formatNumber value="${jobOffer.endDate.dayOfMonth}" pattern="00"/>-
                        <fmt:formatNumber value="${jobOffer.endDate.monthValue}" pattern="00"/>-
                        <fmt:formatNumber value="${jobOffer.endDate.year}" pattern="0000"/>
                    </td>
                    <td class="align-middle text-right">${jobOffer.minRal}$</td>
                    <td class="align-middle text-right">${jobOffer.maxRal}$</td>
                    <td class="align-middle">${jobOffer.companyClient.name}</td>
                    <td class="align-middle">${jobOffer.contractType.title}</td>
                    <td class="align-middle">
                    <div class="actions">
                     <a href="${pageContext.request.contextPath}/JobOfferCtr/updateJobOfferForm?id=${jobOffer.idJobOffer}">
					       <button> 
					       <i class="fas fa-edit"></i>
					       <span>Edit</span>
					       </button>
					 </a>
					
					 <a href="${pageContext.request.contextPath}/JobOfferCtr/deleteJobOffer/${jobOffer.idJobOffer}">
				         <button><i class="fas fa-trash"></i> <span>Delete</span></button>
				    </a>

                  
                    </div>
                    
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
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
