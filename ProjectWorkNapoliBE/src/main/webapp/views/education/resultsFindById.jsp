<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recruiter Gestional Tool</title>
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="wrapper">
        <jsp:include page="../sidebar.jsp" />
        <div id="content">
            <h2>Update Education</h2>
            <form action="${pageContext.request.contextPath}/EducationCtr/updateEducation" method="post">
                <div class="input-100 mb-2">
                    <label class="form-label">ID Education</label>
                    <input class="form-control" type="text" id="idEducation" name="idEducation" readOnly value="${idEducationFound.idEducation}">
                </div>
                
                     <!-- Candidates  -->
                <div class="mb-2 input-100">
                    <label class="form-label" for="candidate.idCandidate">Select candidate:</label>
                    <select name="candidate.idCandidate" class="multiselect multi-disabled">
                    <c:forEach var="candidate" items="${candidates}">
                            <c:choose>
                                <c:when test="${candidate.idCandidate == idEducationFound.candidate.idCandidate}">
                                    <option value="${candidate.idCandidate}" selected>${candidate.name} ${candidate.surname}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${candidate.idCandidate}">${candidate.name} ${candidate.surname}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
                
          

                <div class="mb-2 input-100">
                    <label class="form-label" for="educationDegreeType.idEducationDegreeType">Select education degree type:</label>
                    <select name="educationDegreeType.idEducationDegreeType" class="multiselect">
                        <c:forEach var="e" items="${educationsdegree}">
                        <c:choose>
                                <c:when test="${e.idEducationDegreeType == idEducationFound.educationDegreeType.idEducationDegreeType}">
                                    <option value="${e.idEducationDegreeType}" selected>${e.description}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${e.idEducationDegreeType}">${e.description}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-100 mb-2">
                    <label class="form-label">School name</label>
                    <input class="form-control" type="text" id="schoolName" name="schoolName" value="${idEducationFound.schoolName}">
                </div>
                <div class="input-100 mb-2">
                    <label class="form-label">Place</label>
                    <input class="form-control" type="text" id="place" name="place" value="${idEducationFound.place}">
                </div>
                <div class="input-100 mb-2">
                    <label class="form-label">Final Grade</label>
                    <input class="form-control" type="text" id="finalGrade" name="finalGrade" value="${idEducationFound.finalGrade}">
                </div>
                <div class="input-100 mb-2">
                    <label class="form-label">Date</label>
                    <input class="form-control" type="date" id="date" name="date" value="${idEducationFound.date}">
                </div>
                <input class="btn form-btn" type="submit" value="Update Education">
            </form>
        </div>
    </div>
    <div class="my-toast ${toastTitle}">
        <div class="my-toast-content">
            <svg class="my-toast-close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <title>close</title>
                <path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
            </svg>
            <svg class="my-toast-ok" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <title>check-circle-outline</title>
                <path d="M12 2C6.5 2 2 6.5 2 12S6.5 22 12 22 22 17.5 22 12 17.5 2 12 2M12 20C7.59 20 4 16.41 4 12S7.59 4 12 4 20 7.59 20 12 16.41 20 12 20M16.59 7.58L10 14.17L7.41 11.59L6 13L10 17L18 9L16.59 7.58Z" />
            </svg>
            <div class="message">
                <span class="text text-1">${toastTitle}!</span>
                <span class="text text-2">${toastMessage}</span>
            </div>
        </div>
        <div class="progress active"></div>
    </div>
    <input type="hidden" id="modelAttr" name="modelAttr" value="${showToast}" />
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var modelAttr = $("#modelAttr").val();
            if (modelAttr == "true") {
                showToast();
            }
        });

        function showToast() {
            const toast = document.querySelector(".my-toast");
            const progress = document.querySelector(".progress");
            let timer1, timer2;
            toast.classList.add("active");
            progress.classList.add("active");
            timer1 = setTimeout(() => {
                toast.classList.remove("active");
            }, 2500);
            timer2 = setTimeout(() => {
                progress.classList.remove("active");
            }, 2500);
        }
    const closeIcon = document.querySelector(".my-toast-close");
    console.log("closeIcon", closeIcon);

    closeIcon.addEventListener("click", () => {
        const toast = document.querySelector(".my-toast");
        const progress = document.querySelector(".progress");

        toast.classList.remove("active");

        setTimeout(() => {
            progress.classList.remove("active");
        }, 300);

        clearTimeout(timer1);
        clearTimeout(timer2);
    });
</script>
</body>
</html>