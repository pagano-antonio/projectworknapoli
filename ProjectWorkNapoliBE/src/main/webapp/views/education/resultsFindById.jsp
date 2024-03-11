<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ page import= "com.model.Education" %>
<%@ page import= "com.model.EducationDegreeType" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<h2> RISULTATI AGGIORNABILI</h2>

<%Education e = (Education) request.getAttribute("idEducationFound"); %>


<form action= "${pageContext.request.contextPath}/EducationCtr/updateEducation" method= "post">

<%if (e != null){%>


		<br><label>ID EDUCATION</label><br>
	
	<input type="text" id="idEducation" name="idEducation" readOnly value="<%=e.getIdEducation() %>">

		<label>ID EDUCATION DEGREE TYPE</label>
		
	<input type="text" id="educationDegreeType.idEducationDegreeType" name="educationDegreeType.idEducationDegreeType" value="<%=e.getEducationDegreeType().getIdEducationDegreeType() %>">
	
		<br><label>SCHOOL NAME</label><br>
	<input type="text" id="schoolName" name="schoolName" value="<%=e.getSchoolName() %>">
	
		<br><label>PLACE</label><br>
	<input type="text" id="place" name="place" value="<%=e.getPlace() %>">
	
		<br><label>DATE</label><br>
	<input type="date" id="date" name="date" value="<%=e.getDate() %>">
	
		<br><label>FINAL GRADE</label><br>
	<input type="text" id="finalGrade" name="finalGrade" value="<%=e.getFinalGrade() %>">				
		
	<br><label>ID CANDIDATE</label><br>
		<input type="text" id="candidate.idCandidate" name="candidate.idCandidate" value="<%=e.getCandidate().getIdCandidate() %>">
	
       <input type="submit" value="Aggiorna">

<% } %>

</form>

</body>
</html>