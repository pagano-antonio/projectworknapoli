<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
		<h1>Work experience updated!</h1>
			
			<table>
			  <tr>
			    <th>id Work Experience</th>
			    <th>id candidate</th>
			    <th>title</th>
			    <th>description</th>
			    <th>start date</th>
			    <th>end date</th>
			    <th>company</th>
			    <th>city</th>
			  </tr>
			  <tr>
			    <td>${workExpUpdated.getIdWorkExperience()}</td>
			    <td>${workExpUpdated.getCandidate().getIdCandidate()}</td>
			    <td>${workExpUpdated.getTitle()}</td>
			    <td>${workExpUpdated.getDescription()}</td>
			    <td>${workExpUpdated.getStartDate()}</td>
			    <td>${workExpUpdated.getEndDate()}</td>
			    <td>${workExpUpdated.getCompany()}</td>
			    <td>${workExpUpdated.getCity()}</td>
			  </tr>
			</table>
			
			<a href="${pageContext.request.contextPath}/workExpCtr/indexWorkExp">Index</a><br>
		
		</div>
	</div>
</body>
</html>