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
			<form action="${pageContext.request.contextPath}/workExpCtr/addWorkExp" method="get">
			  <label for="candidate.idCandidate">Id candidate:</label><br>
			  <input type="number" id="candidate.idCandidate" name="candidate.idCandidate"><br>
			  <label for="title">title:</label><br>
			  <input type="text" id="title" name="title"><br>
			  <label for="description">description:</label><br>
			  <input type="text" id="description" name="description"><br>
			  <label for="startDate">start date:</label><br>
			  <input type="date" id="startDate" name="startDate"><br>
			  <label for="endDate">end date:</label><br>
			  <input type="date" id="endDate" name="endDate"><br>
			  <label for="company">company:</label><br>
			  <input type="text" id="company" name="company"><br>
			  <label for="city">city:</label><br>
			  <input type="text" id="city" name="city"><br>
			  <input type="submit" value="Submit">
			</form>
	</div>
	</div>
</body>
</html>