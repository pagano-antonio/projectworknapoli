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
			            <td>${findById.idContractType}</td>
			            <td>${findById.skill.title}</td>
			            <td>${findById.skill.description}</td>
			            

			        </tr>
    		</table>
			</div>
		</div>
	
</body>
</html>