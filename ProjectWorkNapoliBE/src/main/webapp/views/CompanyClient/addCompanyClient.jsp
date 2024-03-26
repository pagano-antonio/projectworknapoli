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
            <form action="${pageContext.request.contextPath}/CompanyClientCtr/addCompanyClient" >
               
               <div class="mb-2 input-50">
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" class="form-control"><br>
             </div>
             
             <div class="mb-2 input-50">
                <label for="city">City:</label><br>
                <input type="text" id="city" name="city" class="form-control"><br>
               </div>
               
               <div class="mb-2 input-100">
                <label for="address">Address:</label><br>
                <input type = "text" id="address" name="address" class="form-control"><br>
               </div>
                
                <input type="submit" value="Submit" class="btn form-btn">
            </form>
        </div>
    </div>
</body>
</html>