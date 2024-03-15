<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Gestional Tool</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
	<div class="wrapper">
		<jsp:include page="../sidebar.jsp" />
		<div id="content">
		<h2>Search Skill</h2>
			<form action="${pageContext.request.contextPath}/skillCtr/searchSkill" method="post">
			   <div class="input-50 mb-2">
			  <label class="form-label" for="id">Id:</label>
			  <input class="form-control" type="text" id="id" name="id">
			  </div>
			  
			  <div class="input-50 mb-2">
			  <label class="form-label" for="title">Title:</label>
			  <input class="form-control" type="text" id="title" name="title">
			  </div>
			  
			  <div class="input-100 mb-2">
			  <label class="form-label" for="description">Description:</label>
			  <textarea rows="4" maxlength="50" class="form-control"  id="description" name="description"></textarea>
			  </div>
			  <input class="btn form-btn" type="submit" value="Search Skill">
			</form>
	</div>
	</div>
</body>
</html>