<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<html>
<head>
    <title>Gestion Film</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container card mt-5">
    <div class="container mt-2 border-bottom">
        <h2 class="mb-3">Ajouter un nouveaux film:</h2>
    </div>
    <form class="card-body d-flex flex-column needs-validation" action="${pageContext.request.contextPath}/film/modifier/${m.id}" method="post">
        <div class="border-bottom">
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <input id="Title" value="${m.title}" name="title" type="text" placeholder="Title" aria-label="Title"
                           class="form-control"
                           required>
                    <label for="Title">Title</label>
                </div>
            </div>
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <textarea id="Description" name="description" placeholder="Description" aria-label="Description"
                           class="form-control"
                           required>
                        ${m.description}
                    </textarea>
                    <label for="Description">Description</label>
                </div>
            </div>
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <input id="ReleaseDate" value="<fmt:formatDate value="${m.releaseDate}" pattern="yyyy-MM-dd" />"
                           name="date" type="date"
                           placeholder="ReleaseDate"
                           aria-label="ReleaseDate"
                           class="form-control"
                           required>
                    <label for="ReleaseDate">ReleaseDate</label>
                </div>
            </div>
            <div class="mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <input id="Duration" value="${m.duration}" name="duration" type="number" placeholder="Duration" aria-label="Duration"
                           class="form-control"
                           required>
                    <label for="Duration">Duration</label>
                </div>
            </div>
            <div class="mb-3 mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <select name="author" class="form-select" aria-label="Default select example">
                        <c:forEach var="a" items="${authors}">
                            <c:if test="${a.nom == m.author.nom}">
                                <option selected value="${a.id}">${a.nom}</option>
                            </c:if>
                            <c:if test="${a.nom != m.author.nom}">
                                <option value="${a.id}">${a.nom}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="mb-3 mt-3 input-group flex-nowrap">
                <div class="form-floating">
                    <select name="genre" class="form-select" aria-label="Default select example">
                        <c:forEach var="c" items="${genres}">
                            <c:if test="${c.nom == m.genre.nom}">
                                <option selected value="${c.id}">${c.nom}</option>
                            </c:if>
                            <c:if test="${c.nom != m.genre.nom}">
                                <option value="${c.id}">${c.nom}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="d-flex container justify-content-end">
            <button class="mt-3 btn btn-outline-primary fa fa-save"
                    type="submit" data-bs-toggle="tooltip"
                    data-bs-placement="bottom" data-bs-title="Ajouter ce genre">sauvegarder
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
