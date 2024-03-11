<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Job Offers</title>
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
					       <i class="fas fa-edit"></i>
					       <button> Edit</button>
					 </a>
					
	 <a href="${pageContext.request.contextPath}/JobOfferCtr/deleteJobOffer/${jobOffer.idJobOffer}">
         <button class="fas fa-trash">Delete</button>
    </a>

                  
                    </div>
                    
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>


</div>

</body>
</html>
