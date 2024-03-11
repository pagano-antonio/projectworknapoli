<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ page import= "com.model.Employee" %>
<%@ page import= "com.model.EmployeeType" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<h2> RISULTATI AGGIORNABILI</h2>

<%Employee e = (Employee) request.getAttribute("IdEmployee"); %>


<form action= "${pageContext.request.contextPath}/EmployeeCtr/updateEmployee" method= "post">

<%if (e != null){%>


		<br><label>ID EMPLOYEE</label><br>
	
	<input type="text" id="idEmployee" name="idEmployee" readOnly value="<%=e.getIdEmployee() %>">

		<label>ID EMPLOYEE TYPE</label>
	
	<input type="text" id="employeeType.idEmployeeType" name="employeeType.idEmployeeType" value="<%=e.getEmployeeType().getIdEmployeeType() %>">
	
		<br><label>USERNAME</label><br>
	<input type="text" id="userame" name="userame" value="<%=e.getUsername() %>">
	
		<br><label>PASSWORD</label><br>
	<input type="text" id="password" name="password" value="<%=e.getPassword() %>">
	
       <input type="submit" value="Aggiorna">

<% } %>

</form>

</body>
</html>