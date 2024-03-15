<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Job Offer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>Create Job Offer</h2>
            <form action="addJobOffer" method="post">

                <!-- Job Offer Title -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">Title:</label>
                    <input type="text" name="title" required class="form-control">
                </div>

                <!-- Job Offer Description -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="description">Description:</label>
                    <textarea rows="4" cols="50" class="form-control"></textarea>
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
                    <input type="date" name="startDate" class="form-control" required>
                </div>

                <!-- End Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="endDate">End Date:</label>
                    <input type="date" name="endDate" class="form-control" required>
               </div>

                <!-- Minimum Salary -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="minRal">Minimum Salary:</label>
                    <input type="number" name="minRal" class="form-control" required>
                </div>

                <!-- Maximum Salary -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="maxRal">Maximum Salary:</label>
                    <input type="number" name="maxRal" class="form-control" required>
                </div>
            <!-- Company Client -->
            <div class="mb-2 input-50">
                <label class="form-label" for="CompanyClient">Company Client:</label>
                <select class="form-control" name="CompanyClient" required>
                    <c:forEach var="client" items="${clients}">
                        <option value="${client.idCompanyClient}">${client.name}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Contract Type -->
            <div class="mb-2 input-50">
                <label class="form-label" for="ContractType">Contract Type:</label>
                <select class="form-control" name="ContractType" required>
                    <c:forEach var="contract" items="${contractsType}">
                        <option value="${contract.idContractType}">${contract.title}</option>
                    </c:forEach>
                </select>
            </div>
            <!-- Submit Button -->
            <input type="submit" class="btn form-btn" value="Create Job Offer">
        </form>
    </div>
</div>
</body>
</html>
