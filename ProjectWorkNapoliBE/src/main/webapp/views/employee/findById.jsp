<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/EmployeeCtr/findById">
 
<label for="Id"> ID EMPLOYEE </label>
<br><input type= "number" id="idEmployee" name="idEmployee"><br>
<label> SUBMIT</label>
<br><input type ="submit" value="invia"><br>

</form>

</body>
</html>