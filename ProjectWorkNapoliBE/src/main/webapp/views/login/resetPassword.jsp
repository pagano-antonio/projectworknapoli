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
			
			<p class="mt-4">${error}</p>

		</div>
	</div>

</body>
</html>
