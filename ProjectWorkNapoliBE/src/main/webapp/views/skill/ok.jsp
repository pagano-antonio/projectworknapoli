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
			<h1>OK</h1>
			<a href="${pageContext.request.contextPath}/skillCtr/indexSkill">Index</a><br>
		</div>
		</div>
</body>
</html>