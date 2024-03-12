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

<%EmployeeType eT = (EmployeeType) request.getAttribute("IdEmployeeType"); %>


<form action= "${pageContext.request.contextPath}/EmployeeTypeCtr/updateEmployeeType" method= "post">

<%if (eT != null){%>


		<br><label>ID EMPLOYEE TYPE</label><br>
	
	<input type="text" id="idEmployeeType" name="idEmployeeType" readOnly value="<%=eT.getIdEmployeeType() %>">

		<label>DESCRIPTION</label>
	
	<input type="text" id="description" name="description" value="<%=eT.getDescription() %>">
	
       <input type="submit" value="Aggiorna">

<% } %>

</form>

</body>
</html>