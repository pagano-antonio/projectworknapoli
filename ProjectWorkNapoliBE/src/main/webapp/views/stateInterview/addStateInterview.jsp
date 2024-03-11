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
			<form action="${pageContext.request.contextPath}/stateJobIntCtr/addStateInterview" method="get">
			  <label for="title">title:</label><br>
			  <input type="text" id="title" name="title"><br>
			  <label for="description">description:</label><br>
			  <input type="text" id="description" name="description"><br>
			  <input type="submit" value="Submit">
			</form>
	</div>
	</div>
</body>
</html>