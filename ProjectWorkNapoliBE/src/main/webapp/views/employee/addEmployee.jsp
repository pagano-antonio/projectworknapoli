<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/EmployeeCtr/addIdEmployee">

	<h2>ADD EMPLOYEE</h2>
	
			<label>ID EMPLOYEE</label>
			<br> <input type="text" id="idEmployee" name="idEmployee" ><br>
			<label>ID EMPLOYEE TYPE</label>
			<br> <input type="text" id="employee.employeeType" name="employee.employeeType"><br>
			<label>USERNAME</label>
			<br> <input type="text" id="username" name="username"><br>
			<label>PASSWORD</label>
			<br> <input type="text" id="password" name="password"><br>
			<label>submit</label>
				<input type="submit" value="invia">
				
	</form>			
</body>
</html>