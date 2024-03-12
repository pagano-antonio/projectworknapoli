<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/EducationDegreeTypeCtr/addEducationDegreeType">

	<h2>ADD EDUCATION DEGREE TYPE</h2>
	
			<label>ID EDUCATION DEGREE TYPE</label>
			<br> <input type="text" id="educationDegreeType.idEducationDegreeType" name="educationDegreeType.idEducationDegreeType" ><br>
			<label>DESCRIPTION</label>
			<br> <input type="text" id="description" name="description"><br>
				<label>submit</label>
				<input type="submit" value="invia">
				
	</form>			
</body>
</html>