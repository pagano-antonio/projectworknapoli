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
                
                <label for="idCompanyClient">ID Company Client:</label><br>
                <input type="number" id="idCompanyClient" name="idCompanyClient" readonly="readonly" value="${companyClient.idCompanyClient}"><br>
                
                <label for="contractTypeName">name:</label><br>
                <input type="text" id="companyClientname" name="companyClientname" value="${companyClient.companyClientname}"><br>
                
                <label for="companyClientaddress">address:</label><br>
                <textarea id="companyClientaddress" name="companyClientaddress">${companyClient.companyClientaddress}</textarea><br>
                
                <label for="companyClientcity">city:</label><br>
                <textarea id="companyClientcity" name="companyClientcity">${companyClient.companyClientcity}</textarea><br>
                
                <input type="submit" value="Update">
            </form>
                
                
        </div>
    </div>
</body>
</html>