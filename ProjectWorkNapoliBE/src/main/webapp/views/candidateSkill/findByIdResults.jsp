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
			            <th>ID Candidate Skill</th>
			            <th>ID Candidato</th>
			            <th>Nome</th>
			            <th>Cognome</th>
			            <th>ID Skill</th>

			        </tr>
			        <tr>
			            <td>${findById.idCandidateSkill}</td>
			            <td>${findById.candidate.idCandidate}</td>
			            <td>${findById.candidate.name}</td>
			            <td>${findById.candidate.surname}</td>
			            <td>${findById.skill.idSkill}</td>
			            <td>${findById.skill.title}</td>
			            <td>${findById.skill.description}</td>
			            

			        </tr>
    		</table>
			</div>
		</div>
	
</body>
</html>