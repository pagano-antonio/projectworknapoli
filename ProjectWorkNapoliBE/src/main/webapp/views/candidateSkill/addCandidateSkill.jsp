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
		
		
			<form action="${pageContext.request.contextPath}/CandidateSkillCtr/addCandidateSkill" >
    
			    
			    <label for="idCandidate">ID Candidato:</label><br>
			    <input type="number" id="candidate.idCandidate" name="candidate.idCandidate"><br>
			    
			    <label for="currentRal">ID Skill:</label><br>
			    <input type="number" id="skill.idSkill" name="skill.idSkill"><br>
			    
			    <input type="submit" value="Invia">
		</form>

		</div>
	</div>
</body>
</html>