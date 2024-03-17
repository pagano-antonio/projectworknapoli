<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			            <th>ID Contract Type</th>
			            <th>title</th>
			            <th>description</th>
			       

			        </tr>
			        <tr>
			            <td>${findById.idCompanyClient}</td>
			            <td>${findById.skill.name}</td>
			            <td>${findById.skill.city}</td>
			            <td>${findById.skill.address}</td>

			        </tr>
    		</table>
			</div>
		</div>

</body>
</html>