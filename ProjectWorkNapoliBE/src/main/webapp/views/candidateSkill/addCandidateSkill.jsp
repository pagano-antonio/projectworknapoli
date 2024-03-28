<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate skills</title>
</head>
<body>
	 <jsp:include page="../header.jsp" />
		<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
		<h2>Add Candidate skill</h2>
		
			<form action="${pageContext.request.contextPath}/CandidateSkillCtr/addCandidateSkill" >
    
			      <div class="mb-2 input-50">
                    <label class="form-label" for="candidate.idCandidate">Select candidate:</label>
                    <select name="candidate.idCandidate" class="form-control multiselect">
	                    <option value="">Select Candidate</option>
					     <c:forEach var="candidate" items="${candidates}">
		                       <option value="${candidate.idCandidate}">${candidate.name} ${candidate.surname}</option>
		                  </c:forEach>
			    	</select>
			    <br>
			    </div>
			    
			    
			    <div class="mb-2 input-50">
                    <label class="form-label" for="skill.idSkill">Select Skills:</label>
                    <select  name="skill.idSkill" class="form-control multiselect" multiple="multiple">
	                  <option value="">Select Skill</option>
	                    <c:forEach var="skill" items="${skills}">
	                            <option value="${skill.idSkill}">${skill.title}</option>
	                    </c:forEach>
                    </select>
                    <br>
                </div>
			    
			    <div>
			    <input type="submit" value="Invia"  class="btn form-btn">
			    </div>
		</form>

		</div>
	</div>
</body>
</html>