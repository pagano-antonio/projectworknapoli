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
				<form action="${pageContext.request.contextPath}/CandidateCommercialCtr/updateCandidateCommercial">
				    
				    <label for="idCandidateCommercial">ID Candidato Commerciale:</label><br>
				    <input type="number" id="idCandidateCommercial" name="idCandidateCommercial" value="${candidatecommercial.idCandidateCommercial}"><br>
				    
				    <label for="idCandidate">ID Candidato:</label><br>
				    <input type="number" id="candidate.idCandidate" name="candidate.idCandidate" value="${candidatecommercial.candidate.idCandidate}"><br>
				    
				    <label for="currentRal">Retribuzione Attuale:</label><br>
				    <input type="number" id="currentRal" name="currentRal" value="${candidatecommercial.currentRal}"><br>
				    
				    <label for="proposedRal">Retribuzione Proposta:</label><br>
				    <input type="number" id="proposedRal" name="proposedRal" value="${candidatecommercial.proposedRal}"><br>
				    
				    <label for="monthRefund">Rimborso Mensile:</label><br>
				    <input type="number" id="monthRefund" name="monthRefund" value="${candidatecommercial.monthRefund}"><br>
				    
				    <label for="businessCost">Costo Business:</label><br>
				    <input type="number" id="businessCost" name="businessCost" value="${candidatecommercial.businessCost}"><br>
				    
				    <label for="subsidyFlag">Sussidio:</label><br>
				    <input type="number" id="subsidyFlag" name="subsidyFlag" value="${candidatecommercial.subsidyFlag}"><br>
				    
				    <label for="notes">Note:</label><br>
				    <input type="text" id="notes" name="notes" value="${candidatecommercial.notes}"><br><br>
				    
				    <input type="submit" value="Invia">
			</form>
				
				
			</div>
		</div>
</body>
</html>