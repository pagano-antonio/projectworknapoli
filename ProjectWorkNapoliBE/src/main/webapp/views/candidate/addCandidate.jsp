<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Recruiter Gestional Tool</title>

</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
			<h2>Add candidate</h2>
		
			<form action="addCandidate" method="post">
			    
			    <!-- candidate name -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="name">Name:</label>
                    <input type="text" name="name" required class="form-control">
                </div>
                
                <!-- candidate surname -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="surname">Surname:</label>
                    <input type="text" name="surname" required class="form-control">
                </div>
                
                <!-- birthday -->
                <div class="mb-2 input-25">
                    <label class="form-label" for="birthday">Birthday:</label>
                    <input type="date" name="birthday" class="form-control" required>
               </div>
               
               <!-- birthPlace -->
                <div class="mb-2 input-25">
                    <label class="form-label" for="birthPlace">Birth Place:</label>
                    <input type="text" name="birthPlace" class="form-control" required>
               </div>
               
               	<!-- candidate address -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="address">Address:</label>
                    <input type="text" name="address" required class="form-control">
                </div>
                
                <!-- city -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="city">City:</label>
                    <input type="text" name="city" required class="form-control">
                </div>
                
                <!-- email -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="email">E-mail:</label>
                    <input type="text" name="email" required class="form-control">
                </div>
                
                <!-- phone -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="phone">Phone:</label>
                    <input type="text" name="phone" required class="form-control">
                </div>
                                
                <!-- Submit Button -->
            	<input type="submit" value="Aggiungi" class="btn form-btn">
            	</form>  
            
			
		</div>
	</div>
</body>
</html>