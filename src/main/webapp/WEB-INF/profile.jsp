<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="username" value="${pageContext.session.getAttribute('username')}"/>
<c:set var="email" value="${pageContext.session.getAttribute('email')}"/>
<c:set var="dateofbirth" value="${pageContext.session.getAttribute('dateofbirth')}"/>
<html>
<head>
    <title>Ваш профиль</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
          integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <link rel="stylesheet" href="${contextPath}/css/profile.css">
    <link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&display=swap" rel="stylesheet">
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="filmModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div>
                    <h3 class="modal-title" id="#filmModal"></h3>
                    <h4></h4>
                </div>
                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body row">
                <div class="col-5">
                    <img src="" alt="">
                </div>
                <div class="col-7">
                    <h5></h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"></li>
                        <li class="list-group-item"></li>
                        <li class="list-group-item"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePasswordModalLabel">Смена пароля:</h5>
                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <label for="inputPassword" class="col-sm-4 col-form-label">Пароль</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword" name="password"
                               required>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPasswordRepeat" class="col-sm-4 col-form-label">Повторите пароль</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPasswordRepeat" required>
                    </div>
                </div>
                <button id="changePassword" type="submit" class="btn btn-outline my-3"
                        style="border-color: #fe6637; color: #fe6637;">
                    Подтвердить
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->

<div class="container">
    <div class="main-body">

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${contextPath}/signIn" style="color: #fe6637;">Домашняя</a></li>
                <li class="breadcrumb-item active" aria-current="page">Профиль</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-sm-12 col-lg-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="${contextPath}/img/icons8-cat-profile-90.png" alt="" class="rounded-circle"
                                 width="150">
                            <div class="mt-3">
                                <h4>${username}</h4>
                                <p class="text-secondary mb-1">${email}</p>
                                <p class="text-muted font-size-sm">${dateofbirth}</p>
                            </div>
                            <c:if test="${pageContext.session.getAttribute('oauth') == null}">
                                <button class="btn btn-outline-warning my-1" data-toggle="modal"
                                        data-target="#changePasswordModal">Сменить пароль
                                </button>
                            </c:if>
                            <button id="clearUser" class="btn btn-outline-danger my-1">Удалить пользователя</button>
                            <a href="${contextPath}/signOut" class="btn btn-outline-danger my-1">Выйти</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-sm-12">
                <div class="row gutters-sm">
                    <div class="col-lg-6 col-sm-12 mb-3">
                        <div class="card vh-100">
                            <button id="clearWatchedFilms" class="btn btn-outline-danger">Стереть просмотренные</button>
                            <div id="watchedFilms" class="card-body">
                                <ul class="list-group list-group-flush">

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 mb-3">
                        <div class="card vh-100">
                            <button id="clearLikedFilms" class="btn btn-outline-danger">Стереть понравившиеся</button>
                            <div id="likedFilms" class="card-body">
                                <ul class="list-group list-group-flush">

                                </ul>
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
<script src="${contextPath}/js/profile.js"></script>
</body>
</html>
