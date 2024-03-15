<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		
			<h1>${candidate.name} ${candidate.surname}</h1><br>
		
			<h2>Titoli di studio</h2><br>
			
			<c:if test="${reload}">
			 	<!-- tabella educazione -->
			    <table class="table table-striped table-sm align-middle table-responsive">
			        <thead>
			            <tr>
			                <th>Titolo</th>
			                <th>Istituto</th>
			                <th>Città</th>
			                <th>Data</th>
			                <th>Voto</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="education" items="${educationsOfCandidate}">
			                <tr>
			                    <td class="align-middle">${education.educationDegreeType.description}</td>
			 					<td class="align-middle">${education.schoolName}</td>
			                    <td class="align-middle">${education.place}</td>
			                    <td class="align-middle">
			                        <fmt:formatNumber value="${education.date.dayOfMonth}" pattern="00"/>-
			                        <fmt:formatNumber value="${education.date.monthValue}" pattern="00"/>-
			                        <fmt:formatNumber value="${education.date.year}" pattern="0000"/>
			                    </td>
			                    <td class="align-middle">${education.finalGrade}</td>
			            </c:forEach>
			        </tbody>
			    </table>
			</c:if>

			<form action="${pageContext.request.contextPath}/EducationCtr/addEducationToCandidate" method="post">
			
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
                <input type="hidden" name="idCandidate" required class="form-control" value="${candidate.idCandidate}">
            	<input type="submit" value="Aggiungi un altro titolo di studio">
            	</form>
               
				<h2>Esperienze lavorative</h2><br>
				
				<c:if test="${reloadW}">
					<!-- tabella work exp -->
				    <table class="table table-striped table-sm align-middle table-responsive">
				        <thead>
				            <tr>
				                <th>Titolo</th>
				                <th>Descrizione</th>
				                <th>Data di inizio</th>
				                <th>Data di fine</th>
				                <th>Azienda</th>
				                <th>Città</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="job" items="${workExpOfCandidate}">
				                <tr>
				                    <td class="align-middle">${job.title}</td>
				 					<td class="align-middle">${job.description}</td>
				                    <td class="align-middle">
				                        <fmt:formatNumber value="${job.startDate.dayOfMonth}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.startDate.monthValue}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.startDate.year}" pattern="0000"/>
				                    </td>
				                    <td class="align-middle">
				                        <fmt:formatNumber value="${job.endDate.dayOfMonth}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.endDate.monthValue}" pattern="00"/>-
				                        <fmt:formatNumber value="${job.endDate.year}" pattern="0000"/>
				                    </td>
				                    <td class="align-middle">${job.company}</td>
				                    <td class="align-middle">${job.city}</td>
				            </c:forEach>
				        </tbody>
				    </table>
				</c:if>
				<br>
				<form action="${pageContext.request.contextPath}/workExpCtr/addWorkExpToCandidate" method="post">
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
                <input type="hidden" name="idCandidate" required class="form-control" value="${candidate.idCandidate}">
            	<input type="submit" value="Aggiungi un'altra esperienza lavorativa">
			
			</form>
			
		</div>
	</div>
</body>
</html>