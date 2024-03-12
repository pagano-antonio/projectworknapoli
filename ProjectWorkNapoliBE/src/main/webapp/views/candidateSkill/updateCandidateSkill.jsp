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
				<form action="${pageContext.request.contextPath}/CandidateSkillCtr/updateCandidateSkill">
				    
				    <label for="idCandidateSkill">ID Candidate Skill:</label><br>
				    <input type="number" id="idCandidateSkill" name="idCandidateSkill" readonly="readonly" value="${candidateskill.idCandidateSkill}"><br>
				    
				    <label for="idCandidate">ID Candidate:</label><br>
				    <input type="number" id="candidate.idCandidate" name="candidate.idCandidate" value="${candidateskill.candidate.idCandidate}"><br>
				    
				    <label for="skill.idSkill">ID Skill:</label><br>
				    <input type="number" id="skill.idSkill" name="skill.idSkill" value="${candidateskill.skill.idSkill}"><br>
				    
				   
				    <input type="submit" value="Invia">
			</form>
				
				
			</div>
		</div>
</body>
</html>