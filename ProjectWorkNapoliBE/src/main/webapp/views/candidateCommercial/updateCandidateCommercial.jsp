<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate commercial data</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
		<div class="wrapper">
			<jsp:include page="../sidebar.jsp" />
			<div id="content">
				<form action="${pageContext.request.contextPath}/CandidateCommercialCtr/updateCandidateCommercial">
				    
				   <div class="mb-2 input-50">
				  	  <label for="idCandidateCommercial" class="form-label">ID Candidato Commerciale:</label><br>
				   	 <input class="form-control" type="number" id="idCandidateCommercial" name="idCandidateCommercial" readonly = "readonly" value="${candidatecommercial.idCandidateCommercial}"><br>
				   </div>
				    
				    <div class="mb-2 input-50">
					    <label for="idCandidate" class="form-label">ID Candidato:</label><br>
					    <input class="form-control" type="number"  id="candidate.idCandidate"  name="candidate.idCandidate" value="${candidatecommercial.candidate.idCandidate}"><br>
				    </div>
				    
				  <div class="mb-2 input-50">
				    <label for="currentRal" class="form-label">Retribuzione Attuale:</label><br>
				    <input class="form-control" type="number" id="currentRal" name="currentRal" value="${candidatecommercial.currentRal}"><br>
				  </div> 
				   
				   <div class="mb-2 input-50">
				    <label for="proposedRal" class="form-label">Retribuzione Proposta:</label><br>
				   	<input class="form-control" type="number" id="proposedRal" name="proposedRal" value="${candidatecommercial.proposedRal}"><br>
				   </div> 
				 
				   <div class="mb-2 input-50" > 
				   	<label for="monthRefund" class="form-label">Rimborso Mensile:</label><br>
				    <input class="form-control" type="number" id="monthRefund" name="monthRefund" value="${candidatecommercial.monthRefund}"><br>
				   </div>
				    
				   <div class="mb-2 input-50">
				    <label for="businessCost" class="form-label">Costo Business:</label><br>
				    <input class="form-control" type="number" id="businessCost" name="businessCost" value="${candidatecommercial.businessCost}"><br>
				   </div>
				    
				   <div class="mb-2 input-50">
				    <label for="subsidyFlag" class="form-label">Sussidio:</label><br>
				    <input class="form-control" type="number" id="subsidyFlag" name="subsidyFlag" value="${candidatecommercial.subsidyFlag}"><br>
				   </div>
				    
				   <div class="mb-2 input-50">
				    <label for="notes" class="form-label">Note:</label><br>
				    <textarea id="notes" name="notes" rows="4" cols="50" required class="form-control" >${candidatecommercial.notes}"</textarea ><br><br>
				  </div>
				    
				    <input type="submit" value="Invia" class="btn form-btn">
			</form>
				
				
			</div>
		</div>
</body>
</html>