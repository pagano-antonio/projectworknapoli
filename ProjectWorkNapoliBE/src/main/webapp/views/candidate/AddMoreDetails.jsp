<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aggiungi dettagli candidato</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
			<h2>${candidate.name} ${candidate.surname} aggiunto!</h2><br>
		
			<h2>Titoli di studio</h2><br>
			<form action="addEducationWorkExp/${candidate.idCandidate}" method="post">
			
                <!-- Select degree type  -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="educationDegreeType.idEducationDegreeType">Seleziona titolo di studio:</label>
                    <select multiple="multiple" name="educationDegreeType.idEducationDegreeType" class="multiselect">
                    <c:forEach var="type" items="${degreeType}">
                            <option value="${type.idEducationDegreeType}">${type.description}</option>
                     </c:forEach>
                    </select>
                </div>
                
               <!-- school name -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="schoolName">Istituto:</label>
                    <input type="text" name="schoolName" required class="form-control">
                </div>
                
                <!-- education place -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="place">Città:</label>
                    <input type="text" name="place" required class="form-control">
                </div>
                
                <!-- date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="date">Data conseguimento:</label>
                    <input type="date" name="date" class="form-control" required>
               </div>
               
                <!-- final Grade -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="finalGrade">Voto:</label>
                    <input type="number" name="finalGrade" class="form-control" required>
               </div>
               
                <!-- Submit Button -->
            	<input type="submit" value="Aggiungi">
            	</form>
               
				<h2>Esperienze lavorative</h2><br>
				<form action="addEducationWorkExp/${candidate.idCandidate}" method="post">
				<!-- work exp title -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="title">Titolo:</label>
                    <input type="text" name="title" required class="form-control">
                </div>
                
                 <!-- work exp Description -->
                <div class="input-100 mb-2">
                    <label class="form-label" for="description">Descrizione:</label>
                    <textarea rows="4" cols="50" name="description" class="form-control"></textarea>
                </div>
                
                <!-- Start Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="startDate">Data di inizio:</label>
                    <input type="date" name="startDate" class="form-control" required>
                </div>

                <!-- End Date -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="endDate">Data di fine:</label>
                    <input type="date" name="endDate" class="form-control" required>
               </div>
               
               	<!-- work exp company -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="company">Azienda:</label>
                    <input type="text" name="company" required class="form-control">
                </div>
                
               	<!-- work exp city -->
                <div class="mb-2 input-50">
                    <label class="form-label" for="city">Città:</label>
                    <input type="text" name="city" required class="form-control">
                </div>
               
                <!-- Submit Button -->
            	<input type="submit" value="Aggiungi">
			
			</form>
			
		</div>
	</div>
</body>
</html>