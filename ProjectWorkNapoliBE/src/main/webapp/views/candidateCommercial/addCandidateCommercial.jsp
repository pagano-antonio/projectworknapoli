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
		
		
			<form action="${pageContext.request.contextPath}/CandidateCommercialCtr/addCandidateCommercial" >
    
			    
			    <label for="idCandidate">ID Candidato:</label><br>
			    <input type="number" id="candidate.idCandidate" name="candidate.idCandidate"><br>
			    
			    <label for="currentRal">Retribuzione Attuale:</label><br>
			    <input type="number" id="currentRal" name="currentRal"><br>
			    
			    <label for="proposedRal">Retribuzione Proposta:</label><br>
			    <input type="number" id="proposedRal" name="proposedRal"><br>
			    
			    <label for="monthRefund">Rimborso Mensile:</label><br>
			    <input type="number" id="monthRefund" name="monthRefund"><br>
			    
			    <label for="businessCost">Costo Business:</label><br>
			    <input type="number" id="businessCost" name="businessCost"><br>
			    
			    <label for="subsidyFlag">Sussidio:</label><br>
			    <input type="number" id="subsidyFlag" name="subsidyFlag"><br>
			    
			    <label for="notes">Note:</label><br>
			    <input type="text" id="notes" name="notes"><br><br>
			    
			    <input type="submit" value="Invia">
		</form>

		</div>
	</div>
</body>
</html>