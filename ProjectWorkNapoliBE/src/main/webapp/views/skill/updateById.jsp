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
			  <input type="hidden" id="tipoOp" name="tipoOp" value="update"><br>
			  <label for="id">Id of the skill you want to update:</label><br>
			  <input type="number" id="id" name="id"><br>
			  <input type="submit" value="Submit">
			</form>
		
		
		</div>
	</div>
</body>
</html>