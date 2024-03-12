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
		Sono il form del candidato
		<div class="provacss">Devo essere rosso</div>
		
			<form action="${pageContext.request.contextPath}/CandidateCtr/addCandidate" >
			    
			  <label for="name">Nome:</label><br>
			  <input type="text" id="name" name="name"><br>
			  
			  <label for="surname">Cognome:</label><br>
			  <input type="text" id="surname" name="surname"><br><br>
			  
			  <label for="birthPlace">Luogo di nascita:</label><br>
			  <input type="text" id="birthPlace" name="birthPlace"><br>
			  
			  <label for="birthday">Data di nascita:</label><br>
			  <input type="date" id="birthday" name="birthday"><br>
			  
			  <label for="address">Indirizzo:</label><br>
			  <input type="text" id="address" name="address"><br> 			  
			  
			  <label for="city">Città:</label><br>
			  <input type="text" id="city" name="city"><br>
			  
			  <label for="email">Email:</label><br>
			  <input type="email" id="email" name="email"><br>
			  
			  <label for="phone">Telefono:</label><br>
			  <input type="text" id="phone" name="phone"><br>
			  
			  <input type="submit" value="Invia">
			</form>
		</div>
	</div>
</body>
</html>