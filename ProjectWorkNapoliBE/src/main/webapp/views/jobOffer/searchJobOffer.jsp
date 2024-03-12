<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Job Offer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>Search Job Offer</h2>
            <form action="searchJobOffer" method="post">

                <!-- Job Offer Title -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">Title:</label>
                    <input type="text" name="title"  class="form-control">
                </div>

                
                <!-- Select Skills  -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="selectedSkills">Select Skills:</label>
                    <select multiple="multiple" name="selectedSkills" class="multiselect">
                    <c:forEach var="skill" items="${skills}">
                            <option value="${skill.idSkill}">${skill.title}</option>
                        </c:forEach>
                    </select>
                </div>
                
                
               <!-- Start Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="startDate">Start Date:</label>
                    <input type="date" name="startDate" class="form-control" >
                </div>

                <!-- End Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="endDate">End Date:</label>
                    <input type="date" name="endDate" class="form-control" >
               </div>

                <!-- Minimum Salary -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="stipendiomin">Minimum Salary:</label>
                    <input type="number" name="stipendiomin" class="form-control" >
                </div>

                <!-- Maximum Salary -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="stipendiomax">Maximum Salary:</label>
                    <input type="number" name="stipendiomax" class="form-control" >
                </div>
            <!-- Company Client -->
            <div class="mb-2 input-50">
                <label class="form-label" for="CompanyClient">Company Client:</label>
                <select class="form-control" name="CompanyClient" >
                 <option value="">Select Company Client</option>
                    <c:forEach var="client" items="${clients}">
                        <option value="${client.idCompanyClient}">${client.name}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Contract Type -->
            <div class="mb-2 input-50">
                <label class="form-label" for="ContractType">Contract Type:</label>
                <select class="form-control" name="ContractType" >
                     <option value="">Seleziona contratto</option>
                     <c:forEach var="contract" items="${contractsType}">
                        <option value="${contract.idContractType}">${contract.title}</option>
                    </c:forEach>
                </select>
            </div>
            <!-- Submit Button -->
            <input type="submit" value="Search Job Offer">
        </form>
    </div>
</div>
</body>
</html>
