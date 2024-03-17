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
            <h2>Add Company Client</h2>
            <form action="${pageContext.request.contextPath}/CompanyClientCtr/createCompanyClient" >
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required><br>
             
                <label for="city">City:</label><br>
                <input type="text" id="city" name="city" required><br>
                
                <label for="address">Address:</label><br>
                <textarea id="address" name="address" required></textarea><br>
                
                <input type="submit" value="Add Company Client">
            </form>
        </div>
    </div>
</body>
</html>