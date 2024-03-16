<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="/css/globalStyle.css">
<style>

.my-toast {
    position: absolute;
    top: 25px;
    right: 30px;
    min-width: 350px;
    border-radius: 5px;
    font-weight: 500;
    background: #01a9c0;
    padding: 20px 35px 20px 25px;
    box-shadow: 0 6px 20px -5px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transform: translateX(calc(100% + 30px));
    transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.35);
}
.my-toast.Success {
    background: #01a9c0;
}
.my-toast.Warning {
    background: #c4147d;
}
.my-toast.active {
    transform: translateX(0%);
}
.my-toast .my-toast-content {
    display: flex;
    align-items: center;
    padding: 0 10px 10px 10px;
    position: relative;
    width: 100%;
    justify-content: center;
}
.my-toast-content .check {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 35px;
    min-width: 35px;
    background-color: #2770ff;
    color: #3F50B5;
    font-size: 20px;
    border-radius: 50%;
}
.my-toast-content .my-toast-ok {
    width: 45px;
    min-width: 45px;
    max-width: 45px;
    height: auto;
}
.my-toast-ok path {
    fill: white;
}
.my-toast-close {
    width: 15px;
    height: auto;
    position: absolute;
    top: -10px;
    right: -18px;
}
.my-toast-close path {
    fill: white;
}
.my-toast-content .message {
    display: flex;
    flex-direction: column;
    margin: 0 20px;
    width: 100%;
    justify-content: center;
    align-items: center;
}
.message .text.text-1 {
    font-size: 18px;
    text-align: center;
    color: #1e2653;
    font-weight: 600;
}
.message .text.text-2 {
    font-size: 16px;
    margin-top: 2.5px;
    font-weight: 400;
    color: white;
    text-align: center;
    text-transform: uppercase;
}
.my-toast .my-alert-close {
    position: absolute;
    top: 10px;
    right: 15px;
    padding: 5px;
    cursor: pointer;
    opacity: 0.7;
}
.my-toast .my-alert-close {
    opacity: 1;
}
.my-toast .progress {
    position: absolute;
    bottom: 0;
    left: 0;
    height: 3px;
    width: 100%;
}
.my-toast .progress:before {
    content: "";
    position: absolute;
    bottom: 0;
    right: 0;
    height: 100%;
    width: 100%;
    background-color: #1289c4;
}
.my-toast.Success .progress:before {
    background-color: #1289c4;
}
.my-toast.Warning .progress:before {
    background-color: #3E50B5;
}
.progress.active:before {
    animation: progress 2.5s linear forwards;
}
@keyframes progress {
    100% {
        right: 100%;
    }
}

input[type=submit],
button {
    padding: 8px 20px;
    font-size: 16px;
    text-transform:uppercase;
    outline: none;
    border: none;
    background-color: #147DC4;
    color: #fff;
    border-radius: 3px;
    cursor: pointer;
    transition: 0.3s;
}
input[type=submit]:hover,
button:hover {
    background-color: #3E50B5;
}
.login-reset {
display: flex;
    width: 100%;
    justify-content: center;
    color:grey;
	
}
.wrapper {
width:100%;
height:100vh;
display:flex;
align-items:flex-start;
justify-content:center;
}
#content {
margin-top:5%;
width:100%;
max-width: 450px;
}
p {
color:red;

}

</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

</head>
<body>
	<div class="wrapper">
		<div id="content">

			<h2 class="pb-2">Reset Password</h2>
			<form action="resetPassword" method="post">
				<!-- Email -->
				<div class="input-100 mt-4 mb-2">
					<label class="form-label" for="email">Email:</label> 
					<input type="text" name="email" value="" autocomplete="false" required class="form-control">
				</div>

				<!-- Psw -->
				<div class="input-100 mb-4">
					<label class="form-label" for="psw">Choose a new Password:</label> <input
						type="password" name="psw" autocomplete="false" value="" required class="form-control">
				</div>
				<input type="submit" value="Reset Password">
			</form>
			
			<a class="pt-4 login-reset" href="${pageContext.request.contextPath}/login">
			<i>Back to login</span>
				</a>
			
		

		</div>
	</div>

        <div class="my-toast ${toastTitle}">
                <div class="my-toast-content">
                    <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <title>close</title>
                        <path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                    </svg>
                    <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <title>check-circle-outline</title>
                        <path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" />
                    </svg>
                    <div class="message">
                        <span class="text text-1">${toastTitle}!</span>
                        <span class="text text-2">${toastMessage}</span>
                    </div>
                </div>
                <div class="progress active"></div>
            </div>
            <input type="hidden" id="modelAttr" name="modelAttr" value="${showToast}" />
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous" type="text/javascript"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous" type="text/javascript"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous" type="text/javascript"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var modelAttr = $("#modelAttr").val();
            if (modelAttr == "true") {
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
