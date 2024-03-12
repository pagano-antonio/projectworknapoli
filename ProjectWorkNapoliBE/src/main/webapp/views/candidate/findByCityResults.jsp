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
				<table class="table table-striped table-sm align-middle table-responsive">
					<tr>			
						<th>Name</th>
                        <th>Surname</th>
                        <th>Birthplace</th>
                        <th>Birthday</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Email</th>
                        <th>Phone</th>
					</tr>
					
	<c:forEach var="city"  items="${findByCity}" >				
					  <tr>
                        <td>${city.name}</td>
                        <td>${city.surname}</td>
                        <td>${city.birthPlace}</td>
                        <td>${city.birthday}</td>
                        <td>${city.address}</td>
                        <td>${city.city}</td>
                        <td>${city.email}</td>
                        <td>${city.phone}</td>
                    </tr>
				</c:forEach>
				
				</table>
			</div>
		</div>
	
</body>
</html>