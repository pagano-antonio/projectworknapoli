<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
			<form action="${pageContext.request.contextPath}/CandidateCommercialCtr/deleteCandidateCommercial">
			
				<label for="id">Id Candidate Commercial:</label><br>
				<input type="number" id="idCandidateCommercial" name="idCandidateCommercial"><br>
			
				<input type="submit" value="Invia">
			</form>
		
		</div>
	</div>
</body>
</html>