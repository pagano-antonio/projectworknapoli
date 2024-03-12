<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/EducationDegreeTypeCtr/findById">
 
<label for="Id"> ID EDUCATION DEGREE TYPE</label>
<br><input type= "number" id="idEducationDegreeType" name="idEducationDegreeType"><br>
<label> SUBMIT</label>
<br><input type ="submit" value="invia"><br>

</form>

</body>
</html>