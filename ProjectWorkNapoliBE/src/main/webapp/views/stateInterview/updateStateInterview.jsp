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
			<form action="${pageContext.request.contextPath}/stateJobIntCtr/update" method="get">
			  <label for="idStateJobInterview">Id state job interview:</label><br>
			  <input type="number" id="idStateJobInterview" name="idStateJobInterview" value="${stateJobFound.getIdStateJobInterview()}"><br>
			  <label for="title">title:</label><br>
			  <input type="text" id="title" name="title" value="${stateJobFound.getTitle()}"><br>
			  <label for="description">description:</label><br>
			  <input type="text" id="description" name="description" value="${stateJobFound.getDescription()}"><br>
			  <input type="submit" value="Submit">
			</form>
	</div>
	</div>
</body>
</html>