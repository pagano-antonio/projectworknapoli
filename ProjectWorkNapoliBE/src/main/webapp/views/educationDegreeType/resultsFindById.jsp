<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ page import= "com.model.Education" %>
<%@ page import= "com.model.EducationDegreeType" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<h2> RISULTATI AGGIORNABILI</h2>

<%EducationDegreeType edt = (EducationDegreeType) request.getAttribute("IdEducationDegreeType"); %>


<form action= "${pageContext.request.contextPath}/EducationDegreeTypeCtr/updateEducationDegreeType" method= "post">

<%if (edt != null){%>


		<br><label>ID EDUCATION DEGREE TYPE</label><br>
	
	<input type="number" id="idEducationDegreeType" name="idEducationDegreeType" readOnly value="<%=edt.getIdEducationDegreeType() %>">

		<label>DESCRIPTION</label>
		
	<input type="text" id="description" name="description" value="<%=edt.getDescription() %>">
	
       <input type="submit" value="Aggiorna">

<% } %>

</form>

</body>
</html>