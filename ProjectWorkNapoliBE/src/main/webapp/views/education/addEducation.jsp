<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add education</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
			<h2>Add Education</h2>
			<form
				action="${pageContext.request.contextPath}/EducationCtr/addEducation">


				<div class="mb-2 input-50">
					<label class="form-label" for="candidates">CANDIDATE</label> 
					<select name="candidate.idCandidate" class="form-control multiselect">
						<option value="">Select candidate</option>
						<c:forEach var="candidate" items="${candidates}">
							<option value="${candidate.idCandidate}">${candidate.name}
								${candidate.surname}</option>
						</c:forEach>
					</select>
				</div>

				<div class="mb-2 input-50">
					<label class="form-label" for="educations">EDUCATION DEGREE
						TYPE</label> <select name="educationDegreeType.idEducationDegreeType"
						class="form-control">
						<option value="">Select degree type</option>
						<c:forEach var="degree" items="${educations}">
							<option value="${degree.idEducationDegreeType}">${degree.description}</option>
						</c:forEach>
					</select>
				</div>
				<div class="mb-2 input-50">
					<label class="form-label">SCHOOL NAME</label><input
						required class="form-control" type="text" id="schoolName"
						name="schoolName">
				</div>
				<div class="mb-2 input-50">
					<label class="form-label">PLACE</label><input
						required class="form-control" type="text" id="place" name="place"><br>
				</div>
				<div class="mb-2 input-50">
					<label class="form-label">DATE</label><input
						required class="form-control" type="date" id="date" name="date"><br>
				</div>
				<div class="mb-2 input-50">
					<label class="form-label">FINAL GRADE</label><input
						required class="form-control" type="text" id="finalGrade"
						name="finalGrade"><br>
				</div>

				<br><input class="btn form-btn" type="submit" value="invia">
				
				
			</form>
		</div>
	</div>
</body>
</html>