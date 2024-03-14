<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>Update Employee</h2>
            <form action="updateOwnProfile" method="post">
                <!-- IdEmployee -->
                <div class="input-100 mb-2 hidden">
                    <label for="idEmployee">Employee ID:</label>
                    <input type="text" class="form-control" id="idEmployee" name="idEmployee" value="${employee.idEmployee}" readonly>
                </div>
                
                <!-- Username -->
                <div class="input-100 mb-2">
                    <label for="username">Username:</label>
                    <input readonly type="text" class="form-control" id="username" name="username" value="${employee.username}" required>
                </div>
                <!-- Name -->
                <div class="input-100 mb-2">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="${employee.name}" required>
                </div>
                <!-- Surname -->
                <div class="input-100 mb-2">
                    <label for="surname">Surname:</label>
                    <input type="text" class="form-control" id="surname" name="surname" value="${employee.surname}" required>
                </div>
                <!-- Email -->
                <div class="input-100 mb-2">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="${employee.email}" required>
                </div>
                
                <!-- Password -->
                <div class="input-100 mb-2">
                    <label for="password">New Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                
                <!-- Password -->
                <p class="p-0 m-0">Insert your old password to update</p>
                <div class="input-100 mb-2">
                    <label for="oldpassword">Old Password:</label>
                    <input type="password" class="form-control" id="oldpassword" name="oldpassword" required>
                </div>
                
               
                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</body>
</html>
