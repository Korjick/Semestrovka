<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="username" value="${pageContext.session.getAttribute('username')}" />
<c:set var="email" value="${pageContext.session.getAttribute('email')}" />
<c:set var="dateofbirth" value="${pageContext.session.getAttribute('dateofbirth')}" />
<html>
<head>
    <title>Ваш профиль</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
          integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <link rel="stylesheet" href="${contextPath}/css/profile.css">
</head>
<body>
<div class="container">
    <div class="main-body">

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${contextPath}/signIn" class="text-warning">Домашняя</a></li>
                <li class="breadcrumb-item active" aria-current="page">Профиль</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-sm-12 col-lg-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="${contextPath}/img/icons8-cat-profile-90.png" alt="" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4>${username}</h4>
                                <p class="text-secondary mb-1">${email}</p>
                                <p class="text-muted font-size-sm">${dateofbirth}</p>
                            </div>
                            <a href="${contextPath}/signOut" class="btn btn-outline-danger">Выйти</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-sm-12">
                <div class="row gutters-sm">
                    <div class="col-lg-6 col-sm-12 mb-3">
                        <div class="card h-100">
                            <div class="card-body">

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 mb-3">
                        <div class="card h-100">
                            <div class="card-body">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
        integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
        crossorigin="anonymous"></script>
</body>
</html>
