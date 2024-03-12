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
				<form action="${pageContext.request.contextPath}/CandidateCtr/updateCandidate">

				  <label for="idCandidate">ID Candidato:</label><br>
				  <input type="text" id="idCandidate" name="idCandidate" readonly="readonly" value="${findToUpdateCandidate.idCandidate}"><br>
				  
				  <label for="name">Nome:</label><br>
				  <input type="text" id="name" name="name" value="${findToUpdateCandidate.name}"><br>
				  
				  <label for="surname">Cognome:</label><br>
				  <input type="text" id="surname" name="surname" value="${findToUpdateCandidate.surname}"><br>
				  
				  <label for="birthPlace">Luogo di nascita:</label><br>
				  <input type="text" id="birthPlace" name="birthPlace" value="${findToUpdateCandidate.birthPlace}"><br>
				  
				  <label for="birthday">Data di nascita:</label><br>
				  <input type="date" id="birthday" name="birthday" value="${findToUpdateCandidate.birthday}"><br> 
				  
				  <label for="address">Indirizzo:</label><br>
				  <input type="text" id="address" name="address" value="${findToUpdateCandidate.address}"><br>
				  
				  <label for="city">Città:</label><br>
				  <input type="text" id="city" name="city" value="${findToUpdateCandidate.city}"><br>
				  
				  <label for="email">Email:</label><br>
				  <input type="email" id="email" name="email" value="${findToUpdateCandidate.email}"><br>
				  
				  <label for="phone">Telefono:</label><br>
				  <input type="text" id="phone" name="phone" value="${findToUpdateCandidate.phone}"><br><br>
				  
				  <input type="submit" value="Invia">
				</form>
				
			</div>
		</div>

 
</body>
</html>