<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/EmployeeTypeCtr/addIdEmployeeType">

	<h2>ADD EMPLOYEE TYPE</h2>
	
			<label>ID EMPLOYEE TYPE</label>
			<br> <input type="text" id="idEmployeeType" name="idEmployeeType" ><br>
			<label>DESCRIPTION</label>
			<br> <input type="text" id="description" name="description"><br>
			<label>submit</label>
				<input type="submit" value="invia">
				
	</form>			
</body>
</html>