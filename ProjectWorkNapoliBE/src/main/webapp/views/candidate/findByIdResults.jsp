<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ page import="com.model.Candidate"%>
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
				<table>
					<tr>
						<th>Address</th> 
						<th>Birthday</th> 
						<th>Birthplace</th> 
					</tr>
					<tr>  
						<td>${findById.address}</td> 
						<td>${findById.birthday}</td> 
						<td>${findById.birthPlace}</td>
					</tr>
				</table>
			</div>
		</div>
	
</body>
</html>