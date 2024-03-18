<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Job Interview</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>Create Job Interview</h2>
            <form action="addJobInterview" method="post">
            
             <!-- Candidates  -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="candidate.idCandidate">Select candidate:</label>
                    <select name="candidate.idCandidate" class="multiselect">
                    <c:forEach var="candidate" items="${candidates}">
                            <option value="${candidate.idCandidate}">${candidate.name} ${candidate.surname}</option>
                        </c:forEach>
                    </select>
                </div>
                
                 <!-- State interview -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="stateJobInterview.idStateJobInterview">Select job interview state:</label>
                    <select name="stateJobInterview.idStateJobInterview" class="multiselect">
                    <c:forEach var="state" items="${states}">
                            <option value="${state.idStateJobInterview}">${state.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Date -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="dateFormat">Date:</label>
                    <input type="date" name="dateFormat" required class="form-control">
                </div>
                
                <!-- Date -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="outcome">Outcome:</label>
                    <input type="number" name="outcome" required class="form-control">
                </div>

                <!-- Notes -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="notes">Notes:</label>
                    <textarea rows="4" cols="50" name="notes" class="form-control"></textarea>
                </div>
              <div class="mb-2 input-100">
    <label class="form-label" for="employee.idEmployee">Select employee:</label>
    <select name="employee.idEmployee" class="multiselect ${sessionScope.idUser > 0 ? 'multi-disabled' : ''}">
        <c:forEach var="emp" items="${employees}">
            <c:choose>
                <c:when test="${emp.idEmployee == sessionScope.idUser}">
                    <option required value="${emp.idEmployee}" selected>${emp.name} ${emp.surname}</option>
                </c:when>
                <c:otherwise>
                    <option required value="${emp.idEmployee}">${emp.name} ${emp.surname}</option>
                </c:otherwise>
            </c:choose>
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
