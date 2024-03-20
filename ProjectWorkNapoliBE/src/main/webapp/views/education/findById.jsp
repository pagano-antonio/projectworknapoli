<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recruiter Gestional Tool</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/EducationCtr/findById">
 
<label for="Id"> ID EDUCATION </label>
<br><input type= "number" id="idEducation" name="idEducation"><br>
<label> SUBMIT</label>
<br><input type ="submit" value="invia"><br>

</form>

</body>
</html>