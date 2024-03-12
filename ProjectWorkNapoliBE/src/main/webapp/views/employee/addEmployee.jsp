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
	
			<label>ID EMPLOYEE TYPE</label>
			<br> <input type="text" id="employeeType.idEmployeeType" name="employeeType.idEmployeeType"><br>
			<label>NAME</label>
			<br> <input type="text" id="name" name="name"><br>
			<label>SURNAME</label>
			<br> <input type="text" id="surname" name="surname"><br>
			<label>EMAIL</label>
			<br> <input type="text" id="email" name="email"><br>
			<label>USERNAME</label>
			<br> <input type="text" id="username" name="username"><br>
			<label>PASSWORD</label>
			<br> <input type="text" id="password" name="password"><br>
			<label>submit</label>
				<input type="submit" value="invia">
				
	</form>			
</body>
</html>