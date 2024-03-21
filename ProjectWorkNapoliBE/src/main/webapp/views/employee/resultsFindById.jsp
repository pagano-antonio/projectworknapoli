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
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">

<h2> RISULTATI AGGIORNABILI</h2>

<%Employee e = (Employee) request.getAttribute("IdEmployee"); %>


<form action= "${pageContext.request.contextPath}/EmployeeCtr/updateEmployee" method= "post">

<%if (e != null){%>


		<br><label>ID EMPLOYEE</label><br>
	
	<input type="text" id="idEmployee" name="idEmployee" readOnly value="<%=e.getIdEmployee() %>">

		<br><label>ID EMPLOYEE TYPE</label><br>
	
	<input type="text" id="employeeType.idEmployeeType" name="employeeType.idEmployeeType" value="<%=e.getEmployeeType().getIdEmployeeType() %>">
		
		<br><label>NAME</label><br>
	<input type="text" id="name" name="name" value="<%=e.getName() %>">
	
		<br><label>SURNAME</label><br>
	<input type="text" id="surname" name="surname" value="<%=e.getSurname() %>">
	
			<br><label>EMAIL</label><br>
	<input type="text" id="email" name="email" value="<%=e.getEmail() %>">
		
		<br><label>USERNAME</label><br>
	<input type="text" id="username" name="username" value="<%=e.getUsername() %>">
	
		<br><label>PASSWORD</label><br>
	<input type="text" id="password" name="password" value="<%=e.getPassword() %>">
	
       <input type="submit" value="Aggiorna">

<% } %>

</form>
		</div>
	</div>
</body>
</html>