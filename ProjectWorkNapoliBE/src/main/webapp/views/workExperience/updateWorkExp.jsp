<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update work experience</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		<h1>${workExpFound.candidate.name} ${workExpFound.candidate.surname}</h1>
			<form action="${pageContext.request.contextPath}/workExpCtr/update" method="get">
			  <input type="hidden" id="idWorkExperience" name="idWorkExperience" value="${workExpFound.getIdWorkExperience()}"><br>
			  <input type="hidden" id="candidate.idCandidate" name="candidate.idCandidate" value="${workExpFound.candidate.idCandidate}"><br>
 
			   <!-- Title -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">Title:</label>
                    <input type="text" name="title" required class="form-control" value="${workExpFound.getTitle()}">
                </div>
			   <!-- description -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">description:</label>
                    <input type="text" name="description" required class="form-control" value="${workExpFound.getDescription()}">
                </div>
			   
			                 <!-- Start Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="startDate">Start Date:</label>
                    <input type="date" name="startDate" class="form-control" required value="${workExpFound.getStartDate()}">
                </div>

                <!-- End Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="endDate">End Date:</label>
                    <input type="date" name="endDate" class="form-control" required value="${workExpFound.getEndDate()}">
               </div>
               
			  <!-- work exp company -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="company">Azienda:</label>
                    <input type="text" name="company" required class="form-control" value="${workExpFound.getCompany()}">
                </div>
                
               	<!-- work exp city -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="city">Città:</label>
                    <input type="text" name="city" required class="form-control" value="${workExpFound.getCity()}">
                </div>
               
			  <input type="submit" value="Submit" class="btn form-btn">
			</form>
	</div>
	</div>
</body>
</html>