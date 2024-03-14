<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Candidate Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>Candidate Form</h2>
            <form action="searchCandidate" method="post">

                <!-- Name -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="name">Name:</label>
                    <input type="text" name="name" class="form-control">
                </div>

                <!-- Surname -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="surname">Surname:</label>
                    <input type="text" name="surname" class="form-control">
                </div>


                <!-- Birthday -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="birthday">Birthday:</label>
                    <input type="date" name="birthday" class="form-control">
                </div>

                <!-- Birth Place -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="birthPlace">Birth Place:</label>
                    <input type="text" name="birthPlace" class="form-control">
                </div>
                
                 <!-- Address -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="address">Address:</label>
                    <input type="text" name="address" class="form-control">
                </div>
                <!-- City -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="city">City:</label>
                    <input type="text" name="city" class="form-control">
                </div>

                <!-- Email -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="email">Email:</label>
                    <input type="email" name="email" class="form-control">
                </div>

                <!-- Phone -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="phone">Phone:</label>
                    <input type="tel" name="phone" class="form-control">
                </div>
                
                 <!-- Education  -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="degree">Select degree:</label>
                    <select name="degree" class="form-control">
                    <option value="">Select degree</option>
                    <c:forEach var="degree" items="${degrees}">
                            <option value="${degree.idEducationDegreeType}">${degree.description}</option>
                        </c:forEach>
                    </select>
                </div>
                
                 <!-- Select Skills  -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="selectedSkills">Select Skills:</label>
                    <select multiple="multiple" name="selectedSkills" class="multiselect form-control">
                    <c:forEach var="skill" items="${skills}">
                            <option value="${skill.idSkill}">${skill.title}</option>
                        </c:forEach>
                    </select>
                </div>
                
                
                 <!-- Job interview  -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="jobinterview">Select state job interview</label>
                    <select name="jobinterview" class="form-control">
                    <option value="">Select state job interview</option>
                    <c:forEach var="stateJobInterview" items="${stateJobInterviews}">
                            <option value="${stateJobInterview.idStateJobInterview}">${stateJobInterview.title} - ${stateJobInterview.description}</option>
                        </c:forEach>
                    </select>
                </div>
                
                   <!-- Interview Date -->
                <div class="input-50 mb-2">
                    <label class="form-label" for="dateAfter">Interview State After:</label>
                    <input type="date" name="dateAfter" class="form-control">
                </div>
                

                <!-- Submit Button -->
                <input type="submit" value="Search candidate" class="btn form-btn">
            </form>
        </div>
    </div>
</body>
</html>
