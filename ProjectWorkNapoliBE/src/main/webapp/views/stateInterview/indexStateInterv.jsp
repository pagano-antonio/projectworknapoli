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
		<a href="${pageContext.request.contextPath}/stateJobIntCtr/toAdd">Add state job interview</a><br>
		<a href="${pageContext.request.contextPath}/stateJobIntCtr/tofindById">Find by state job interview id</a><br>
		<a href="${pageContext.request.contextPath}/stateJobIntCtr/toUpdateById">Update state job interview by id</a><br>
		<a href="${pageContext.request.contextPath}/stateJobIntCtr/toDeleteById">Delete by state job interview id</a><br>
	</div>
</body>
</html>