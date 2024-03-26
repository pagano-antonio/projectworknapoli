<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.model.Candidate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><title>Recruiter Gestional Tool</title>
</head>
<body>
 <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
			<form action="${pageContext.request.contextPath}/CandidateCtr/findById">
		
				<label for="id">Id Candidate:</label><br>
				<input type="number" id="idCandidate" name="idCandidate"><br>
			
				<input type="submit" value="Invia">
			</form>
		
		</div>
	</div>
	
</body>
</html>