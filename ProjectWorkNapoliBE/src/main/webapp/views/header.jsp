<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Gestional Tool</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<!-- Font Awesome JS v5 -->
<script defer
    src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
    integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
    crossorigin="anonymous" type="text/javascript"></script>
<script defer
    src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
    integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
    crossorigin="anonymous" type="text/javascript"></script>
    
    <link rel="stylesheet" type="text/css" href="/css/globalStyle.css">
    
</head>
<body>

    <nav id="header">
        <div class="header-collapse" class="flex">
            <h3>
                <button id="sidebarCollapse">
                    <i class="fas fa-align-justify"></i>
                </button>

                <a class="header-collapse-title"
                    href="${pageContext.request.contextPath}/gestionaleCandidati">Recruiter Gestional Tool</a>
            </h3>
        </div>
       <div class="avatarAndLogoutContainer">
       
     <a href="${pageContext.request.contextPath}/EmployeeCtr/goToUserProfile?idEmployee=${sessionScope.idUser}" class="${sessionScope.idUser > 0 ? 'activeLink' : 'inactiveLink'}">
    <div class="avatar">
        <span>${sessionScope.username.substring(0,1)}</span>
    </div>
</a>
     
      
       
       
        
        <a class="logout" href="${pageContext.request.contextPath}/logout">
        <svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>logout</title><path d="M17 7L15.59 8.41L18.17 11H8V13H18.17L15.59 15.58L17 17L22 12M4 5H12V3H4C2.9 3 2 3.9 2 5V19C2 20.1 2.9 21 4 21H12V19H4V5Z" /></svg>
        </a>
        </div>
    </nav>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous" type="text/javascript"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous" type="text/javascript"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous" type="text/javascript"></script>


    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script type="text/javascript"
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">


    <script type="text/javascript">
        $(document).ready(function() {
            $('.multiselect').multiselect({
                includeSelectAllOption : true,
                enableFiltering : true,
                enableCaseInsensitiveFiltering : true,
                buttonWidth : '100%',
                numberDisplayed : 3,
                maxHeight: 200
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#sidebarCollapse').on('click', function() {
                $('#sidebar').toggleClass('active');
                $('#overlay').toggleClass('active');
            });

            $('#dismiss, #overlay').on('click', function() {
                $('#overlay').removeClass('active');
                $('#sidebar').removeClass('active');
            });
        });
    </script>

</body>
</html>
