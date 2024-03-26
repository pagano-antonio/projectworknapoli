<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate commercial data</title>
</head>
<body>
	 <jsp:include page="../header.jsp" />
		<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		
			<h2>Add Commercial data</h2>
		
			<form action="${pageContext.request.contextPath}/CandidateCommercialCtr/addCandidateCommercial" >
    
			   
			    <div class="mb-2 input-50">
                    <label class="form-label" for="candidate.idCandidate">Select candidate:</label>
                    <select name="candidate.idCandidate" class="form-control multiselect">
	                    <option value="">Select Candidate</option>
					     <c:forEach var="candidate" items="${candidates}">
		                       <option value="${candidate.idCandidate}">${candidate.name} ${candidate.surname}</option>
		                  </c:forEach>
			    	</select>
			    	<br>
			    </div>
			    
			    <div class="mb-2 input-50">
			    <label class="form-label" for="currentRal">Current RAL:</label>
			    <input type="number" id="currentRal" name="currentRal" required class="form-control"><br>
			    </div>
			    
			    <div class="mb-2 input-50">
			    <label class="form-label" for="proposedRal">Proposed RAL:</label>
			    <input type="number" id="proposedRal" name="proposedRal" required class="form-control"><br>
			    </div>
			    
			    <div class="mb-2 input-50">
			    <label class="form-label" for="monthRefund">Monthly refund:</label>
			    <input type="number" id="monthRefund" name="monthRefund" required class="form-control"><br>
			    </div>
			    
			    <div class="mb-2 input-50">
			    <label class="form-label" for="businessCost">Business cost:</label>
			    <input type="number" id="businessCost" name="businessCost" required class="form-control"><br>
			    </div>
			    
			    <div class="mb-2 input-50">
			    <label class="form-label" for="subsidyFlag">Subsidy Flag:</label>
			    <input type="number" id="subsidyFlag" name="subsidyFlag" required class="form-control"><br>
			    </div>
			    
			    <div class="mb-2 input-100" >
			    <label class="form-label" for="notes">Notes:</label>
			     <textarea id="notes" name="notes" rows="4" cols="50" required class="form-control"></textarea ><br><br>
			    </div>
			    
			    <input type="submit" value="Invia"  class="btn form-btn">
		</form>

		</div>
	</div>
</body>
</html>