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
		<a href="${pageContext.request.contextPath}/skillCtr/toAdd">Add skill</a><br>
		<a href="${pageContext.request.contextPath}/skillCtr/tofindById">Find by skill id</a><br>
		<a href="${pageContext.request.contextPath}/skillCtr/toUpdateById">Update skill by id</a><br>
		<a href="${pageContext.request.contextPath}/skillCtr/toDeleteById">Delete by skill id</a><br>
	</div>
</body>
</html>