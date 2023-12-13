<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .text-3d {
            color: white;
            text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.7);
        }
    </style>
</head>
<body style="background-image: url('../images/background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
">
<%@include file="navbar.jsp" %>
<div class="container pt-3">
    <div class="d-flex justify-content-center align-items-center text-light" style="height: 80vh;">
        <div class="text-center">
            <h1 class="text-3d">Bienvenue à Gestion Films</h1>
            <p class="text-3d">Votre solution tout-en-un pour la gestion des films.</p>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>