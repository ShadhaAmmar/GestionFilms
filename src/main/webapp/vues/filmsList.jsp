<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<html>
<head>
    <title>Gestion Films</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<%@include file="navbar.jsp" %>
<table class="table container">
    <div>
        <div>
            <div class="d-flex flex-row mx-3 mt-3">
                <div class="d-flex flex-row container">
                    <form method="get" action="rechercher">
                        <div class="input-group mb-3 me-3">
                            <div class="form-floating">
                                <input id="mc" value="${mc}" name="mc" type="text" class="form-control"
                                       placeholder="Mot Clé"
                                       aria-label="Nom film" aria-describedby="nom film">
                                <label for="mc">Mot Clé</label>
                            </div>
                            <button class="btn btn-outline-primary fa fa-search"
                                    type="submit" data-bs-toggle="tooltip"
                                    data-bs-placement="top" data-bs-title="Recherche des films">
                            </button>
                        </div>
                    </form>

                    <a href="ajouter"
                       class="p-3 mb-3 align-self-center btn btn-outline-primary fa fa-add" data-bs-toggle="tooltip"
                       data-bs-placement="top" data-bs-title="Ajout un nouveaux film"></a>
                </div>
            </div>
        </div>
    </div>
    <div class="card-body">
        <thead>
        <tr>
            <td class="text-center fw-bold">#</td>
            <td class="text-center fw-bold">Title</td>
            <td class="text-center fw-bold">Description</td>
            <td class="text-center fw-bold">Release Date</td>
            <td class="text-center fw-bold">Duration</td>
            <td class="text-center fw-bold">Genre</td>
            <td class="text-center fw-bold">Author</td>
            <td class="text-center fw-bold">Actions</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${films}" var="m">
            <tr>
                <td class="text-center">${m.id}</td>
                <td class="text-center">${m.title}</td>
                <td class="text-center">${m.description}</td>
                <td class="text-center">${m.releaseDate}</td>
                <td class="text-center">${m.duration}</td>
                <td class="text-center">${m.genre.nom}</td>
                <td class="text-center">${m.author.nom}</td>
                <td class="d-flex justify-content-center text-center">
                    <div class="grid gap-3">
                        <a href="supprimer/${m.id}"
                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce film ?');"
                           class="btn btn-danger fa fa-trash" data-bs-toggle="tooltip"
                           data-bs-placement="bottom" data-bs-title="Supprimer un film"></a>
                        <a href="modifier/${m.id}" class="btn btn-warning fa fa-edit text-light"
                           data-bs-toggle="tooltip"
                           data-bs-placement="bottom" data-bs-title="Modifier un film"></a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </div>
</table>
<%@include file="footer.jsp" %>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>
