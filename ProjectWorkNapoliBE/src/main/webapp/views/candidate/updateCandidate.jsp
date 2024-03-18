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
			
				<h2>Update candidate</h2>
			
				<form action="${pageContext.request.contextPath}/CandidateCtr/updateCandidate">

				
<!-- 				  <label for="idCandidate">ID Candidato:</label><br> -->
				  <input type="hidden" id="idCandidate" name="idCandidate" readonly="readonly" value="${findToUpdateCandidate.idCandidate}">
				
				 
				 <div class="mb-2 input-50">
				  <label class="form-label" for="name">Nome:</label><br>
				  <input type="text" id="name" name="name" required class="form-control" value="${findToUpdateCandidate.name}"><br>
				 </div>
				  
				 <div class="mb-2 input-50"> 
				  <label class="form-label" for="surname">Cognome:</label><br>
				  <input type="text" id="surname" name="surname" required class="form-control" value="${findToUpdateCandidate.surname}"><br>
				</div>
				
				 <div class="mb-2 input-50">
				  <label class="form-label" for="birthPlace">Luogo di nascita:</label><br>
				  <input type="text" id="birthPlace" name="birthPlace" required class="form-control" value="${findToUpdateCandidate.birthPlace}"><br>
				 </div>
				 
				 <div class="mb-2 input-50">
				  <label class="form-label" for="birthday">Data di nascita:</label><br>
				  <input type="date" id="birthday" name="birthday" required class="form-control" value="${findToUpdateCandidate.birthday}"><br> 
				</div>
				  
				<div class="mb-2 input-50">
				  <label class="form-label" for="address">Indirizzo:</label><br>
				  <input type="text" id="address" name="address" required class="form-control" value="${findToUpdateCandidate.address}"><br>
				</div>
				
				<div class="mb-2 input-50">
				  <label class="form-label" for="city">Città:</label><br>
				  <input type="text" id="city" name="city" required class="form-control" value="${findToUpdateCandidate.city}"><br>
				</div>  
				
				<div class="mb-2 input-50">  
				  <label class="form-label" for="email">Email:</label><br>
				  <input type="email" id="email" name="email" required class="form-control" value="${findToUpdateCandidate.email}"><br>
				</div>
				
				 <div class="mb-2 input-50">
				  <label class="form-label" for="phone">Telefono:</label><br>
				  <input type="text" id="phone" name="phone" required class="form-control" value="${findToUpdateCandidate.phone}"><br>
				 </div> 
				 
				  <input type="submit" value="Invia">
				</form>
				
			</div>
		</div>

 
</body>
</html>