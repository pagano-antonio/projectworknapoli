<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/globalStyle.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

 <!-- Sidebar  -->
        <nav id="sidebar">
            <ul class="list-unstyled components">
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Candidati</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li><a href="${pageContext.request.contextPath}/CandidateCtr/preAddCandidate">Aggiungi candidato</a></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li>
                    </ul>
                </li>
                <li><a href="#">Sub menu</a></li>
                <li><a href="#">Sub menu</a></li>
            </ul>
        </nav>

        <!-- Overlay  -->
        <div id="overlay" class="d-md-none">
            <div id="dismiss">
                <i class="fas fa-arrow-left"></i>
            </div>
	</div>
</body>
</html>