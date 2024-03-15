<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <h2>ADD EMPLOYEE</h2>
<form action="addEmployee" method="post">
                <!-- Username -->
                <div class="input-100 mb-2">
                    <label for="username">Username:</label>
                    <input  type="text" class="form-control" id="username" name="username" required>
                </div>
                <!-- Name -->
                <div class="input-100 mb-2">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <!-- Surname -->
                <div class="input-100 mb-2">
                    <label for="surname">Surname:</label>
                    <input type="text" class="form-control" id="surname" name="surname" required>
                </div>
                
                <!-- Contract Type -->
            <div class="mb-2 input-50">
    <label class="form-label" for="employeeType.idEmployeeType">Employee type:</label>
    <select class="form-control" name="employeeType.idEmployeeType" id="employeeType.idEmployeeType" required>
        <c:forEach var="type" items="${types}">
            <option value="${type.idEmployeeType}">${type.idEmployeeType} - ${type.description}</option>
        </c:forEach>
    </select>
</div>
                <!-- Email -->
                <div class="input-100 mb-2">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                
                <!-- Password -->
                <div class="input-100 mb-2">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                
                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Add employee</button>
				
	</form>			
</div>
</body>
</html>