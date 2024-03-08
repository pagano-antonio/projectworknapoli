<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
			<form action="${pageContext.request.contextPath}/workExpCtr/update" method="get">
			  <input type="hidden" id="idWorkExperience" name="idWorkExperience" value="${workExpFound.getIdWorkExperience()}"><br>
			  <label for="candidate.idCandidate">Id candidate:</label><br>
			  <input type="number" id="candidate.idCandidate" name="candidate.idCandidate" value="${workExpFound.getCandidate().getIdCandidate()}"><br>
			  <label for="title">title:</label><br>
			  <input type="text" id="title" name="title" value="${workExpFound.getTitle()}"><br>
			  <label for="description">description:</label><br>
			  <input type="text" id="description" name="description" value="${workExpFound.getDescription()}"><br>
			  <label for="startDate">start date:</label><br>
			  <input type="date" id="startDate" name="startDate" value="${workExpFound.getStartDate()}"><br>
			  <label for="endDate">end date:</label><br>
			  <input type="date" id="endDate" name="endDate" value="${workExpFound.getEndDate()}"><br>
			  <label for="company">company:</label><br>
			  <input type="text" id="company" name="company" value="${workExpFound.getCompany()}"><br>
			  <label for="city">city:</label><br>
			  <input type="text" id="city" name="city" value="${workExpFound.getCity()}"><br>
			  <input type="submit" value="Submit">
			</form>
	</div>
	</div>
</body>
</html>