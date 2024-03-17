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
            <form action="${pageContext.request.contextPath}/ContractTypeCtr/updateContractType">
                
                <label for="idContractType">ID Contract Type:</label><br>
                <input type="number" id="idContractType" name="idContractType" readonly="readonly" value="${contractType.idContractType}"><br>
                
                <label for="contractTypeName">title:</label><br>
                <input type="text" id="contractTypetitle" name="contractTypetitle" value="${contractType.contractTypetitle}"><br>
                
                <label for="contractTypeDescription">description:</label><br>
                <textarea id="contractTypeDescription" name="contractTypeDescription">${contractType.contractTypeDescription}</textarea><br>
                
                <input type="submit" value="Update">
            </form>
                
                
        </div>
    </div>
</body>
</html>