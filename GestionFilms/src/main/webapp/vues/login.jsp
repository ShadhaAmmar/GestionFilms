<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body style="background-image: url('../images/background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
">
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <h3 class="mb-5">Se connecter</h3>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger mb-4" role="alert">
                                    ${error} </div>
                        </c:if>

                        <form method="post" action="login">
                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <input name="email" id="Email" type="email" class="form-control form-control-lg"
                                           aria-label="email"
                                           aria-describedby="email"
                                           placeholder="name@example.com" required/>
                                    <label for="Email">Email</label>
                                </div>
                            </div>

                            <div class="input-group mb-5">
                                <div class="form-floating">
                                    <input name="password" id="Password" aria-label="password"
                                           aria-describedby="password" type="password"
                                           class="form-control form-control-lg" required/>
                                    <label for="Password">Password</label>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <a href="register" data-bs-toggle="tooltip"
                                   data-bs-placement="bottom" data-bs-title="S'inscrire">Je n'ai pas de
                                    compte</a>
                                <button class="btn btn-primary btn-lg btn-block" type="submit" data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" data-bs-title="Se connecter">Envoyer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>
