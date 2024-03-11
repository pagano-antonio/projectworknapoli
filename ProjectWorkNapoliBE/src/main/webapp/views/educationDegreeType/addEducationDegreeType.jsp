<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/EducationCtr/addEducation">

	<h2>ADD EDUCATION</h2>
	
			<label>ID EDUCATION DEGREE TYPE</label>
			<br> <input type="text" id="educationDegreeType.idEducationDegreeType" name="educationDegreeType.idEducationDegreeType" ><br>
			<label>SCHOOL NAME</label>
			<br> <input type="text" id="schoolName" name="schoolName"><br>
			<label>PLACE</label>
			<br> <input type="text" id="place" name="place"><br>
			<label>DATE</label>
			<br> <input type="date" id="date" name="date"><br>
			<label>FINAL GRADE</label>
			<br> <input type="text" id="finalGrade" name="finalGrade"><br>
			<label>ID CANDIDATE</label>
			<br> <input type="text" id="candidate.idCandidate" name="candidate.idCandidate"><br>
			<label>submit</label>
				<input type="submit" value="invia">
				
	</form>			
</body>
</html>