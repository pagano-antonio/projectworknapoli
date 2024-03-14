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

			<h2 class="pb-2">Login</h2>
			<i class="pt-2 pb-2" style="font-size:10px;">Per loggarsi occorre essere registrati nella tabella Employee,<br> oppure si può accedere usando "user" come username e "1234" come password</i>
			<form action="loginServlet" method="post">
				<!-- Username -->
				<div class="input-100 mt-4 mb-2">
					<label class="form-label" for="username">Username:</label> 
					<input type="text" name="username" value="" autocomplete="false" required class="form-control">
				</div>

				<!-- Psw -->
				<div class="input-100 mb-4">
					<label class="form-label" for="psw">Password:</label> <input
						type="password" name="psw" autocomplete="false" value="" required class="form-control">
				</div>
				<input type="submit" value="Login">
			</form>
			
			
			<p class="mt-4">${error}</p>

		</div>
	</div>

</body>
</html>
