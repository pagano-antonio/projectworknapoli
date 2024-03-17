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
			<form action="${pageContext.request.contextPath}/skillCtr/findById" method="get">
			  <label class="form-label" for="id">Id of the skill:</label>
			  <input class="form-control" type="number" id="id" name="id">
			  <input type="submit" value="Submit">
			</form>
		</div>
	</div>
</body>
</html>