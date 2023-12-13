<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<html>
<head>
    <title>Gestion Author</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container card mt-5">
    <div class="container mt-2 border-bottom">
        <h2 class="mb-3">Ajouter un nouveaux author:</h2>
    </div>
    <form class="card-body d-flex flex-column needs-validation" action="${pageContext.request.contextPath}/author/modifier/${a.id}" method="post">
        <div class="border-bottom">
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <input id="Nom" value="${a.nom}" name="nom" type="text" placeholder="Nom" aria-label="Nom"
                           class="form-control"
                           required>
                    <label for="Nom">Nom</label>
                </div>
            </div>
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <input id="BirthDate" value="<fmt:formatDate value="${a.birthDate}" pattern="yyyy-MM-dd" />"
                           name="date" type="date"
                           placeholder="Birth Date"
                           aria-label="Birth Date"
                           class="form-control"
                           required>
                    <label for="BirthDate">Birth Date</label>
                </div>
            </div>
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <textarea id="Bio" name="bio" placeholder="Bio" aria-label="Bio" class="form-control" required>
                        ${a.bio}
                    </textarea>
                    <label for="Bio">Bio</label>
                </div>
            </div>
        </div>
        <div class="d-flex container justify-content-end">
            <button class="mt-3 btn btn-outline-primary fa fa-save"
                    type="submit" data-bs-toggle="tooltip"
                    data-bs-placement="bottom" data-bs-title="Ajouter ce author">sauvegarder
            </button>
        </div>
    </form>
</div>
<%@include file="footer.jsp" %>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>
