<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <h2 class="navbar-brand"></h2>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <c:if test="${not empty username}">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/film/list">Films</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/genre/list">Genres</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/author/list">Authors</a>
                    </li>
                </ul>
            </div>
            <span class="text-light">Welcome <span>${username}</span></span>
            <a class="ms-2 btn btn-primary" href="${pageContext.request.contextPath}/logout" data-bs-toggle="tooltip"
               data-bs-placement="bottom" data-bs-title="logout">Logout</a>
        </c:if>
        <c:if test="${empty username}">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/login" data-bs-toggle="tooltip"
               data-bs-placement="bottom" data-bs-title="Se connecter">Connexion</a>
        </c:if>
    </div>
</nav>