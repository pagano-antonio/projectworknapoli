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
			
			<table>
			  <tr>
			    <th>id State Job Interview</th>
			    <th>title</th>
			    <th>description</th>
			  </tr>
			  <tr>
			    <td>${stateJobFound.getIdStateJobInterview()}</td>
			    <td>${stateJobFound.getTitle()}</td>
			    <td>${stateJobFound.getDescription()}</td>
			  </tr>
			</table>
			
			<a href="${pageContext.request.contextPath}/stateJobIntCtr/indexStateInterv">Index</a><br>
		
		</div>
	</div>
</body>
</html>