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
                    <input  type="text" class="form-control" id="username" name="username" value="${employee.username}" required>
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
                    <label for="password">New Password: <i>please insert only if you wish to change your password.</i></label>
                    <input type="password" class="form-control" id="password" name="password" value="${employee.password}">
                </div>
                
                <!-- Password -->
                <div class="input-100 mb-2">
                    <label for="oldpassword" class="warningText">Insert your current password to update *</label>
                    <input type="password" class="form-control" id="oldpassword" name="oldpassword" required>
                </div>
                
               
                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
    
    <div class="my-toast ${toastTitle}">
    <div class="my-toast-content">
    <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>close</title><path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" /></svg>
    
        <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>check-circle-outline</title><path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" /></svg>
        <div class="message">
            <span class="text text-1">${toastTitle}!</span>
            <span class="text text-2">${toastMessage}</span>
        </div>
    </div>
    <div class="progress active"></div>
</div>


<input type="hidden" id="modelAttr" name="modelAttr" value="${showToast}"/>

<script>

document.addEventListener('DOMContentLoaded', function() {
	
        var modelAttr = $("#modelAttr").val();
        if(modelAttr == "true"){
        showToast();
        }
    
});
    function showToast() {
    	const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");
		
        let timer1, timer2;
		

        toast.classList.add("active");
        progress.classList.add("active");

        timer1 = setTimeout(() => {
            toast.classList.remove("active");
        }, 2500);

        timer2 = setTimeout(() => {
            progress.classList.remove("active");
        }, 2500);
    }

    const closeIcon = document.querySelector(".my-toast-close");
    console.log("closeIcon", closeIcon);

    closeIcon.addEventListener("click", () => {
        const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");

        toast.classList.remove("active");

        setTimeout(() => {
            progress.classList.remove("active");
        }, 300);

        clearTimeout(timer1);
        clearTimeout(timer2);
    });
</script>
</body>
</html>
