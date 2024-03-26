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
            <form action="${pageContext.request.contextPath}/CompanyClientCtr/updateCompanyClient">
                
                <div class="mb-2 input-50">
                <label class="form-label" for="idCompanyClient">ID Company Client:</label><br>
                <input type="number" class="form-control" id="idCompanyClient" name="idCompanyClient" readonly="readonly" value="${companyclient.idCompanyClient}"><br>
                </div>
                
                <div class="mb-2 input-50">
                <label class="form-label" for="contractTypeName">name:</label><br>
                <input type="text" class="form-control" id="name" name="name" value="${companyclient.name}"><br>
                </div>
                
                <div class="mb-2 input-50">
                <label class="form-label" for="companyClientaddress">address:</label><br>
                <input type= "text" class="form-control" id = "address" name = "address" value = "${companyclient.address}"><br>
                </div>
                
                <div class="mb-2 input-50">
                <label class="form-label" for="companyClientcity">city:</label><br>
                <input type = "text" class="form-control" id = "city" name = "city" value = "${companyclient.city}"><br>
                </div>
                
               <input type="submit" value="Update" class="btn form-btn">
            </form>
                
                
        </div>
    </div>
</body>
</html>