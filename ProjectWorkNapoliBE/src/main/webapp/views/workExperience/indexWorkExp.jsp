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
		<a href="${pageContext.request.contextPath}/workExpCtr/toAdd">Add work experience</a><br>
		<a href="${pageContext.request.contextPath}/workExpCtr/tofindById">Find by work experience id</a><br>
		<a href="${pageContext.request.contextPath}/workExpCtr/toUpdateById">Update work experience by id</a><br>
		<a href="${pageContext.request.contextPath}/workExpCtr/toDeleteById">Delete by work experience id</a><br>
	</div>
</body>
</html>