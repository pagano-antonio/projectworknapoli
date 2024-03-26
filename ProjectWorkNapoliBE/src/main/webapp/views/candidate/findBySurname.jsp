<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Recruiter Gestional Tool</title>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">

		<form action="${pageContext.request.contextPath}/CandidateCtr/findBySurname">
		
				<label for="id"> CERCA PER COGNOME </label><br>
				<input type="text" id="surname" name="surname"><br>
			
				<input type="submit" value="Invia">
			</form>
		
		</div>
	</div>

</body>
</html>