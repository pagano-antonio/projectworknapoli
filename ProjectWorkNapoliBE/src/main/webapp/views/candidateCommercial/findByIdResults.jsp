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
			<table>
			        <tr>
			            <th>ID Candidate Commercial</th>
			            <th>ID Candidato</th>
			            <th>Retribuzione Attuale</th>
			            <th>Retribuzione Proposta</th>
			            <th>Rimborso Mensile</th>
			            <th>Costo Business</th>
			            <th>Sussidio</th>
			            <th>Note</th>
			        </tr>
			        <tr>
			            <td>${findById.idCandidateCommercial}</td>
			            <td>${findById.candidate.idCandidate}</td>
			            <td>${findById.currentRal}</td>
			            <td>${findById.proposedRal}</td>
			            <td>${findById.monthRefund}</td>
			            <td>${findById.businessCost}</td>
			            <td>${findById.subsidyFlag}</td>
			            <td>${findById.notes}</td>
			        </tr>
    		</table>
			</div>
		</div>
	
</body>
</html>