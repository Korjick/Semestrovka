<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Orange.TV - главная</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
          integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <link rel="stylesheet" href="${contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&display=swap" rel="stylesheet">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
</head>
<body>
<!-- Navigation Menu -->

<nav class="navbar sticky-top navbar-expand-lg navbar-dark" style="background-color: #0D0D0D">
    <div class="container-fluid">

        <a id="logo" href="" class="navbar-brand">
            <img src="${contextPath}/img/orange.png" width="30" height="30" alt="" class="d-inline-block align-top mr-3"
                 loading="lazy">Orange.TV</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" style="color: azure; border-color: azure;">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="${contextPath}/about" class="nav-link">О нас</a>
                </li>
            </ul>
            <c:if test="${pageContext.session.getAttribute('id') == null}">
                <div class="d-flex justify-content-start">
                    <button class="btn btn-outline-light my-3" data-toggle="modal" data-target="#signInModal">Вход
                    </button>
                    <button class="btn btn-outline-light ml-3 my-3" data-toggle="modal" data-target="#signUpModal">
                        Регистрация
                    </button>
                </div>
            </c:if>
            <c:if test="${pageContext.session.getAttribute('id') != null}">
                <a class="navbar-brand" href="${contextPath}/profile">
                    <img src="${contextPath}/img/icons8-cat-profile-45.png" alt="" class="mr-3">Профиль
                </a>
            </c:if>
        </div>
    </div>
</nav>

<!-- Modal Menu -->

<div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signInModalLabel">Войти:</h5>
                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
            </div>
            <form action="${contextPath}/signIn" method="post">
                <div class="modal-body">
                    <div class="row mb-3">
                        <label for="inputEmailSignIn" class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmailSignIn" name="email" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputPasswordSignIn" class="col-sm-4 col-form-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPasswordSignIn" name="password"
                                   required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline my-3" style="border-color: #fe6637; color: #fe6637;">
                        Авторизация
                    </button>
                </div>
            </form>
            <div class="modal-footer d-flex justify-content-start">
                <h5>Войти с помощью:</h5>
                <button id="vkauthsignin" class="btn btn-outline my-3" style="border-color: #fe6637; color: #fe6637;">VK</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signUpModalLabel">Регистрация:</h5>
                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
            </div>
            <form action="${contextPath}/signUp" method="post">
                <div class="modal-body">
                    <div class="row mb-3">
                        <label for="inputUsernameSignUp" class="col-sm-4 col-form-label">Имя пользователя</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputUsernameSignUp" name="username" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputEmailSignUp" class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmailSignUp" name="email" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputPasswordSignUp" class="col-sm-4 col-form-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPasswordSignUp" name="password"
                                   required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputPasswordRepeatSignUp" class="col-sm-4 col-form-label">Повторите пароль</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPasswordRepeatSignUp" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputAgeSignUp" class="col-sm-4 col-form-label">Дата рождения</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="inputAgeSignUp" name="dateOfBirth" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <legend class="col-form-label col-sm-10">Я согласен с <a href="${contextPath}/about">Правилами сервиса</a>
                        </legend>
                        <div class="col-sm-2">
                            <div class="form-check">
                                <input type="checkbox" id="termAcceptedSignUp" class="form-check-input mt-2"
                                       required>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline my-3" style="border-color: #fe6637; color: #fe6637;">
                        Регистрация
                    </button>
                </div>
            </form>
            <div class="modal-footer d-flex justify-content-start">
                <h5>Зарегестрироваться с помощью:</h5>
                <button id="vkauthsignup" class="btn btn-outline my-3" style="border-color: #fe6637; color: #fe6637;">VK</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="filmModal" tabindex="-1" aria-hidden="true">
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
            <div class="modal-footer d-flex justify-content-between align-items-center">
                <c:if test="${pageContext.session.getAttribute('id') != null}">

                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- Main -->

<main>
    <img id="mainPicture" class="d-block container-fluid" src="${contextPath}/img/background.jpg" alt="">
    <span class="text-light-custom">
        <h3>Здесь выбирают фильмы!</h3>
        <h4>Не знаете, что посмотреть?</h4>
        <h4>У нас вы быстро найдете хорошие фильмы, которые вам понравятся!</h4>
    </span>

    <p class="text-light-custom text-center my-3">Оцените фильмы и сериалы и получите рекомендации</p>
    <p class="text-light-custom text-center my-3">Войдите в систему и начните оцену фильмов.
        Чем больше оценок вы ставите, тем точнее ваши рекомендации!</p>

    <div id="filmRecommendationMenu" class="row justify-content-center align-items-center container-fluid">

        <!-- Section: Filters -->
        <section id="filmRecommendationFilter" class="col-12 my-3 mx-3">
            <section class="row justify-content-center align-items-center">
                <h3 style="color: #fe6637;">Фильтр</h3>

                <!-- Section: Category -->
                <section class="row col-6 my-3" id="filmRecommendationFilterCategory">
                    <div class="dropright">
                        <a class="modal-header link-light dropdown-toggle text-decoration-none" href="#"
                           id="categoryDropdownMenuLinkCategory" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            <h5>Категория</h5>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-light col-8 overflow-auto"
                            aria-labelledby="categoryDropdownMenuLinkCategory" style="max-height: 300px;">
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="аниме" value="1750">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="аниме">аниме</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="биография" value="22">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="биография">биография</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="боевик" value="3">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="боевик">боевик</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="вестерн" value="13">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="вестерн">вестерн</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="военный" value="19">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="военный">военный</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="детектив" value="17">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="детектив">детектив</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="детский" value="456">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="детский">детский</label>
                            </li>
                            <c:if test="${pageContext.session.getAttribute('id') != null}">
                                <li class="dropdown-item">
                                    <input type="checkbox" class="form-check-input filled-in" id="для-взрослых"
                                           value="20">
                                    <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                           for="для-взрослых">для взрослых</label>
                                </li>
                            </c:if>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="документальный"
                                       value="12">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="документальный">документальный</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="драма" value="8">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="драма">драма</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="игра" value="27">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="игра">игра</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="история" value="23">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="история">история</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="комедия" value="6">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="комедия">комедия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="концерт" value="1747">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="концерт">концерт</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="короткометражка"
                                       value="15">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="короткометражка">короткометражка</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="криминал" value="16">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="криминал">криминал</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="мелодрама" value="7">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="мелодрама">мелодрама</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="музыка" value="21">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="музыка">музыка</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="мультфильм" value="14">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="мультфильм">мультфильм</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="мюзикл" value="9">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="мюзикл">мюзикл</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="новости" value="28">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="новости">новости</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="приключения" value="10">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="приключения">приключения</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="реальное-ТВ" value="25">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="реальное-ТВ">реальное ТВ</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="семейный" value="11">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="семейный">семейный</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="спорт" value="24">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="спорт">спорт</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="ток-шоу" value="26">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="ток-шоу">ток-шоу</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="триллер" value="4">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="триллер">триллер</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="ужасы" value="1">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="ужасы">ужасы</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="фантастика" value="2">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="фантастика">фантастика</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="фильм-нуар" value="18">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="фильм-нуар">фильм-нуар</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="фэнтези" value="5">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="фэнтези">фэнтези</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="церемония" value="1751">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="церемония">церемония</label>
                            </li>
                        </ul>
                    </div>
                </section>
                <!-- Section: Category -->

                <!-- Section: Country -->
                <section class="row col-6 my-3" id="filmRecommendationFilterCountry">
                    <div class="dropright">
                        <a class="modal-header link-light dropdown-toggle text-decoration-none" href="#"
                           id="categoryDropdownMenuLinkCountry" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            <h5>Страна</h5>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-light col-8 overflow-auto"
                            aria-labelledby="categoryDropdownMenuLinkCountry" style="max-height: 300px;">
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сан-Томе-и-Принсипи"
                                       value="1072">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сан-Томе-и-Принсипи">Сан-Томе и Принсипи</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Уоллис-и-Футуна"
                                       value="1073">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Уоллис-и-Футуна">Уоллис и Футуна</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Кот-д’Ивуар" value="1074">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Кот-д’Ивуар">Кот-д’Ивуар</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Фолклендские-острова"
                                       value="1075">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Фолклендские-острова">Фолклендские острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ватикан" value="1076">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ватикан">Ватикан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in"
                                       id="Виргинские-Острова-(Великобритания)" value="1077">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Виргинские-Острова-(Великобритания)">Виргинские Острова
                                    (Великобритания)</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Северная-Македония"
                                       value="1078">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Северная-Македония">Северная Македония</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сент-Китс-и-Невис"
                                       value="1071">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сент-Китс-и-Невис">Сент-Китс и Невис</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Австралия" value="25">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Австралия">Австралия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Австрия" value="57">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Австрия">Австрия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Азербайджан" value="136">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Азербайджан">Азербайджан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Албания" value="120">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Албания">Албания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Алжир" value="20">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Алжир">Алжир</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Виргинские-Острова-(США)"
                                       value="1026">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Виргинские-Острова-(США)">Виргинские Острова (США)</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Американское-Самоа"
                                       value="1062">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Американское-Самоа">Американское Самоа</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ангола" value="139">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ангола">Ангола</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Андорра" value="159">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Андорра">Андорра</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Антарктида" value="1044">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Антарктида">Антарктида</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Антигуа-и-Барбуда"
                                       value="1030">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Антигуа-и-Барбуда">Антигуа и Барбуда</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Антильские-Острова"
                                       value="1009">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Антильские-Острова">Антильские Острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Аргентина" value="24">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Аргентина">Аргентина</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Армения" value="89">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Армения">Армения</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Аруба" value="175">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Аруба">Аруба</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Афганистан" value="113">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Афганистан">Афганистан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Багамы" value="124">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Багамы">Багамы</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бангладеш" value="75">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бангладеш">Бангладеш</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Барбадос" value="105">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Барбадос">Барбадос</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бахрейн" value="164">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бахрейн">Бахрейн</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Беларусь" value="69">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Беларусь">Беларусь</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Белиз" value="173">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Белиз">Белиз</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бельгия" value="41">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бельгия">Бельгия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бенин" value="140">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бенин">Бенин</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Берег-Слоновой-кости"
                                       value="109">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Берег-Слоновой-кости">Берег Слоновой кости</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бермуды" value="1004">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бермуды">Бермуды</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бирма" value="148">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бирма">Бирма</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Болгария" value="63">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Болгария">Болгария</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Боливия" value="118">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Боливия">Боливия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Босния" value="178">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Босния">Босния</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Босния-и-Герцеговина"
                                       value="39">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Босния-и-Герцеговина">Босния и Герцеговина</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ботсвана" value="145">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ботсвана">Ботсвана</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бразилия" value="10">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бразилия">Бразилия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бруней-Даруссалам"
                                       value="1066">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бруней-Даруссалам">Бруней-Даруссалам</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Буркина-Фасо" value="92">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Буркина-Фасо">Буркина-Фасо</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бурунди" value="162">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бурунди">Бурунди</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Бутан" value="114">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Бутан">Бутан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Вануату" value="1059">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Вануату">Вануату</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Великобритания"
                                       value="11">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Великобритания">Великобритания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Венгрия" value="49">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Венгрия">Венгрия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Венесуэла" value="72">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Венесуэла">Венесуэла</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Внешние-малые-острова-США"
                                       value="1064">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Внешние-малые-острова-США">Внешние малые острова США</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Западная-Сахара"
                                       value="1043">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Западная-Сахара">Западная Сахара</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Вьетнам" value="52">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Вьетнам">Вьетнам</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Вьетнам-Северный"
                                       value="170">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Вьетнам-Северный">Вьетнам Северный</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Габон" value="127">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Габон">Габон</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гаити" value="99">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гаити">Гаити</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гайана" value="165">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гайана">Гайана</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гамбия" value="1040">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гамбия">Гамбия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гана" value="144">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гана">Гана</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гваделупа" value="142">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гваделупа">Гваделупа</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гватемала" value="135">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гватемала">Гватемала</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гвинея" value="129">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гвинея">Гвинея</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гвинея-Бисау" value="116">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гвинея-Бисау">Гвинея-Бисау</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Германия" value="3">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Германия">Германия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Германия-(ГДР)"
                                       value="60">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Германия-(ГДР)">Германия (ГДР)</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Германия-(ФРГ)"
                                       value="18">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Германия-(ФРГ)">Германия (ФРГ)</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гибралтар" value="1022">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гибралтар">Гибралтар</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гондурас" value="112">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гондурас">Гондурас</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гонконг" value="28">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гонконг">Гонконг</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гренада" value="1060">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гренада">Гренада</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гренландия" value="117">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гренландия">Гренландия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Греция" value="55">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Греция">Греция</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Грузия" value="61">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Грузия">Грузия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Гуам" value="1045">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Гуам">Гуам</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Дания" value="4">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Дания">Дания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Джибути" value="1028">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Джибути">Джибути</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Доминика" value="1031">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Доминика">Доминика</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Доминикана" value="128">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Доминикана">Доминикана</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Египет" value="101">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Египет">Египет</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Заир" value="155">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Заир">Заир</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Замбия" value="133">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Замбия">Замбия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Зимбабве" value="104">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Зимбабве">Зимбабве</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Израиль" value="42">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Израиль">Израиль</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Индия" value="29">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Индия">Индия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Индонезия" value="73">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Индонезия">Индонезия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Иордания" value="154">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Иордания">Иордания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ирак" value="90">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ирак">Ирак</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Иран" value="48">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Иран">Иран</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ирландия" value="38">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ирландия">Ирландия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Исландия" value="37">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Исландия">Исландия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Испания" value="15">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Испания">Испания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Италия" value="14">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Италия">Италия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Йемен" value="169">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Йемен">Йемен</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Кабо-Верде" value="146">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Кабо-Верде">Кабо-Верде</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Казахстан" value="122">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Казахстан">Казахстан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Каймановы-острова"
                                       value="1051">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Каймановы-острова">Каймановы острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Камбоджа" value="84">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Камбоджа">Камбоджа</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Камерун" value="95">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Камерун">Камерун</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Канада" value="6">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Канада">Канада</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Катар" value="1002">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Катар">Катар</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Кения" value="100">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Кения">Кения</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Кипр" value="64">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Кипр">Кипр</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Кирибати" value="1024">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Кирибати">Кирибати</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Китай" value="31">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Китай">Китай</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Колумбия" value="56">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Колумбия">Колумбия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Коморы" value="1058">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Коморы">Коморы</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Конго" value="134">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Конго">Конго</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Конго-(ДРК)" value="1014">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Конго-(ДРК)">Конго (ДРК)</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Корея" value="156">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Корея">Корея</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Корея-Северная"
                                       value="137">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Корея-Северная">Корея Северная</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Корея-Южная" value="26">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Корея-Южная">Корея Южная</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Косово" value="1013">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Косово">Косово</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Коста-Рика" value="131">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Коста-Рика">Коста-Рика</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Куба" value="76">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Куба">Куба</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Кувейт" value="147">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Кувейт">Кувейт</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Киргизия" value="86">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Киргизия">Киргизия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Лаос" value="149">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Лаос">Лаос</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Латвия" value="54">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Латвия">Латвия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Лесото" value="1015">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Лесото">Лесото</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Либерия" value="176">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Либерия">Либерия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ливан" value="97">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ливан">Ливан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ливия" value="126">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ливия">Ливия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Литва" value="123">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Литва">Литва</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Лихтенштейн" value="125">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Лихтенштейн">Лихтенштейн</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Люксембург" value="59">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Люксембург">Люксембург</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Маврикий" value="115">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Маврикий">Маврикий</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мавритания" value="67">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мавритания">Мавритания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мадагаскар" value="150">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мадагаскар">Мадагаскар</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Макао" value="153">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Макао">Макао</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Македония" value="80">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Македония">Македония</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Малави" value="1025">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Малави">Малави</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Малайзия" value="83">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Малайзия">Малайзия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мали" value="151">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мали">Мали</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мальдивы" value="1050">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мальдивы">Мальдивы</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мальта" value="111">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мальта">Мальта</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Марокко" value="43">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Марокко">Марокко</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мартиника" value="102">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мартиника">Мартиника</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Маршалловы-острова"
                                       value="1067">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Маршалловы-острова">Маршалловы острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Масаи" value="1042">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Масаи">Масаи</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мексика" value="17">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мексика">Мексика</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in"
                                       id="Мелкие-отдаленные-острова-США" value="1041">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мелкие-отдаленные-острова-США">Мелкие отдаленные острова США</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мозамбик" value="81">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мозамбик">Мозамбик</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Молдова" value="58">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Молдова">Молдова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Монако" value="22">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Монако">Монако</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Монголия" value="132">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Монголия">Монголия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Монтсеррат" value="1065">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Монтсеррат">Монтсеррат</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Мьянма" value="1034">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Мьянма">Мьянма</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Намибия" value="91">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Намибия">Намибия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Непал" value="106">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Непал">Непал</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Нигер" value="157">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Нигер">Нигер</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Нигерия" value="110">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Нигерия">Нигерия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Нидерланды" value="12">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Нидерланды">Нидерланды</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Никарагуа" value="138">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Никарагуа">Никарагуа</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Новая-Зеландия"
                                       value="35">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Новая-Зеландия">Новая Зеландия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Новая-Каледония"
                                       value="1006">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Новая-Каледония">Новая Каледония</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Норвегия" value="33">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Норвегия">Норвегия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="ОАЭ" value="119">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="ОАЭ">ОАЭ</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in"
                                       id="Оккупированная-Палестинская-территория" value="1019">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Оккупированная-Палестинская-территория">Оккупированная Палестинская
                                    территория</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Оман" value="1003">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Оман">Оман</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Остров-Мэн" value="1052">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Остров-Мэн">Остров Мэн</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Остров-Святой-Елены"
                                       value="1047">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Остров-Святой-Елены">Остров Святой Елены</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Острова-Кука"
                                       value="1063">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Острова-Кука">Острова Кука</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="острова-Теркс-и-Кайкос"
                                       value="1007">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="острова-Теркс-и-Кайкос">острова Теркс и Кайкос</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Пакистан" value="74">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Пакистан">Пакистан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Палау" value="1057">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Палау">Палау</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Палестина" value="78">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Палестина">Палестина</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Панама" value="107">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Панама">Панама</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Папуа---Новая-Гвинея"
                                       value="163">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Папуа---Новая-Гвинея">Папуа - Новая Гвинея</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Парагвай" value="143">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Парагвай">Парагвай</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Перу" value="23">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Перу">Перу</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Польша" value="32">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Польша">Польша</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Португалия" value="36">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Португалия">Португалия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Пуэрто-Рико" value="82">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Пуэрто-Рико">Пуэрто Рико</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Реюньон" value="1036">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Реюньон">Реюньон</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Российская-империя"
                                       value="1033">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Российская-империя">Российская империя</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Россия" value="2">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Россия">Россия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Руанда" value="103">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Руанда">Руанда</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Румыния" value="46">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Румыния">Румыния</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сальвадор" value="121">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сальвадор">Сальвадор</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Самоа" value="1039">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Самоа">Самоа</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сан-Марино" value="1011">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сан-Марино">Сан-Марино</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Саудовская-Аравия"
                                       value="158">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Саудовская-Аравия">Саудовская Аравия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Свазиленд" value="1029">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Свазиленд">Свазиленд</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сейшельские-острова"
                                       value="1010">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сейшельские-острова">Сейшельские острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сенегал" value="65">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сенегал">Сенегал</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сент-Винсент-и-Гренадины"
                                       value="1055">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сент-Винсент-и-Гренадины">Сент-Винсент и Гренадины</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сент-Люсия-" value="1049">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сент-Люсия-">Сент-Люсия </label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сербия" value="177">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сербия">Сербия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сербия-и-Черногория"
                                       value="174">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сербия-и-Черногория">Сербия и Черногория</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сиам" value="1021">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сиам">Сиам</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сингапур" value="45">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сингапур">Сингапур</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сирия" value="98">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сирия">Сирия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Словакия" value="94">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Словакия">Словакия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Словения" value="40">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Словения">Словения</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Соломоновы-Острова"
                                       value="1069">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Соломоновы-Острова">Соломоновы Острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сомали" value="160">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сомали">Сомали</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="СССР" value="13">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="СССР">СССР</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Судан" value="167">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Судан">Судан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Суринам" value="171">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Суринам">Суринам</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="США" value="1">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="США">США</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Сьерра-Леоне"
                                       value="1023">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Сьерра-Леоне">Сьерра-Леоне</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Таджикистан" value="70">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Таджикистан">Таджикистан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Таиланд" value="44">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Таиланд">Таиланд</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Тайвань" value="27">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Тайвань">Тайвань</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Танзания" value="130">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Танзания">Танзания</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Тимор-Лесте" value="1068">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Тимор-Лесте">Тимор-Лесте</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Того" value="161">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Того">Того</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Тонга" value="1012">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Тонга">Тонга</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Тринидад-и-Тобаго"
                                       value="88">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Тринидад-и-Тобаго">Тринидад и Тобаго</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Тувалу" value="1053">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Тувалу">Тувалу</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Тунис" value="50">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Тунис">Тунис</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Туркменистан" value="152">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Туркменистан">Туркменистан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Турция" value="68">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Турция">Турция</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Уганда" value="172">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Уганда">Уганда</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Узбекистан" value="71">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Узбекистан">Узбекистан</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Украина" value="62">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Украина">Украина</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Уругвай" value="79">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Уругвай">Уругвай</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Фарерские-острова"
                                       value="1008">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Фарерские-острова">Фарерские острова</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in"
                                       id="Федеративные-Штаты-Микронезии" value="1038">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Федеративные-Штаты-Микронезии">Федеративные Штаты Микронезии</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Фиджи" value="166">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Фиджи">Фиджи</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Филиппины" value="47">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Филиппины">Филиппины</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Финляндия" value="7">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Финляндия">Финляндия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Франция" value="8">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Франция">Франция</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Французская-Гвиана"
                                       value="1032">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Французская-Гвиана">Французская Гвиана</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Французская-Полинезия"
                                       value="1046">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Французская-Полинезия">Французская Полинезия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Хорватия" value="85">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Хорватия">Хорватия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="ЦАР" value="141">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="ЦАР">ЦАР</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Чад" value="77">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Чад">Чад</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Черногория" value="1020">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Черногория">Черногория</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Чехия" value="34">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Чехия">Чехия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Чехословакия" value="16">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Чехословакия">Чехословакия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Чили" value="51">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Чили">Чили</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Швейцария" value="21">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Швейцария">Швейцария</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Швеция" value="5">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Швеция">Швеция</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Шпицберген-и-Ян-Майен"
                                       value="1070">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Шпицберген-и-Ян-Майен">Шпицберген и Ян-Майен</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Шри-Ланка" value="108">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Шри-Ланка">Шри-Ланка</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Эквадор" value="96">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Эквадор">Эквадор</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Экваториальная-Гвинея"
                                       value="1061">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Экваториальная-Гвинея">Экваториальная Гвинея</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Эритрея" value="87">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Эритрея">Эритрея</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Эстония" value="53">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Эстония">Эстония</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Эфиопия" value="168">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Эфиопия">Эфиопия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="ЮАР" value="30">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="ЮАР">ЮАР</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Югославия" value="19">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Югославия">Югославия</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Югославия-(ФР)"
                                       value="66">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Югославия-(ФР)">Югославия (ФР)</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Ямайка" value="93">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Ямайка">Ямайка</label>
                            </li>
                            <li class="dropdown-item">
                                <input type="checkbox" class="form-check-input filled-in" id="Япония" value="9">
                                <label class="form-check-label small text-uppercase card-link-secondary text-body"
                                       for="Япония">Япония</label>
                            </li>
                        </ul>
                    </div>
                </section>
                <!-- Section: Country -->

                <!-- Section: Year -->
                <section class="my-3 col-4" id="filmRecommendationFilterYear">
                    <h5 class="font-weight-bold mb-3 text-light-custom">Год</h5>
                    <form>
                        <div class="d-flex align-items-center mt-4 pb-1">
                            <div class="md-form md-outline my-0">
                                <input id="minAge" type="text" class="form-control mb-0" name="yearFrom" value="1880">
                                <label for="minAge" class="text-light-custom">Мин</label>
                            </div>
                            <p class="px-2 mb-0 text-muted"> - </p>
                            <div class="md-form md-outline my-0">
                                <input id="maxAge" type="text" class="form-control mb-0" name="yearTo" value="2020">
                                <label for="maxAge" class="text-light-custom">Макс</label>
                            </div>
                        </div>
                    </form>

                </section>
                <!-- Section: Year -->

                <!-- Section: Rating -->
                <section class="my-3 col-4" id="filmRecommendationFilterRating">
                    <h5 class="font-weight-bold mb-3 text-light-custom">Рейтинг</h5>
                    <form>
                        <div class="d-flex align-items-center mt-4 pb-1">
                            <div class="md-form md-outline my-0">
                                <input id="minRating" type="text" class="form-control mb-0" name="ratingFrom" value="0">
                                <label for="minRating" class="text-light-custom">Мин</label>
                            </div>
                            <p class="px-2 mb-0 text-muted"> - </p>
                            <div class="md-form md-outline my-0">
                                <input id="maxRating" type="text" class="form-control mb-0" name="ratingTo" value="10">
                                <label for="maxRating" class="text-light-custom">Макс</label>
                            </div>
                        </div>
                    </form>

                </section>
                <!-- Section: Rating -->

                <!-- Search Button -->
                <button type="button" id="filmRecommendationFilterSearch" class="btn col-2 my-3"
                        style="border-color: #fe6637; color: #fe6637;">
                    Поиск
                </button>
                <!-- Search Button -->

            </section>
        </section>
        <!-- Section: Filters -->

        <!-- Section: Films -->
        <section id="filmRecommendationResult"
                 class="d-flex overflow-auto col-12 justify-content-start align-items-center">
        </section>
        <!-- Section: Films -->

        <!-- Section: Personal -->
        <c:if test="${pageContext.session.getAttribute('id') != null}">
            <div class="d-flex justify-content-start align-items-center">
                <img src="${contextPath}/img/star.png" class="my-3 mr-3" style="width: 30px; height: 30px;" alt="">
                <h5 class="mt-1" style="color: #fe6637;">Рекомендации</h5>
            </div>
            <section id="filmRecommendationResultPersonal"
                     class="d-flex overflow-auto col-12 justify-content-start align-items-center">
            </section>
        </c:if>
        <!-- Section: Personal -->
    </div>
</main>
<c:if test="${pageContext.request.getParameter('error') != null}">
    <c:choose>
        <c:when test="${pageContext.request.getParameter('error') == '-1'}">
            <script>
                window.addEventListener("DOMContentLoaded", function () {
                    alert("Неправильный логин и/или пароль");
                    window.history.replaceState({}, document.title, window.location.href.split("?")[0]);
                });
            </script>
        </c:when>
        <c:when test="${pageContext.request.getParameter('error') == '-2'}">
            <script>
                window.addEventListener("DOMContentLoaded", function () {
                    alert("Пользователь с таким email не найден");
                    window.history.replaceState({}, document.title, window.location.href.split("?")[0]);
                });
            </script>
        </c:when>
        <c:when test="${pageContext.request.getParameter('error') == '-3'}">
            <script>
                window.addEventListener("DOMContentLoaded", function () {
                    alert("Неккоректный формат даты");
                    window.history.replaceState({}, document.title, window.location.href.split("?")[0]);
                });
            </script>
        </c:when>
        <c:when test="${pageContext.request.getParameter('error') == '-4'}">
            <script>
                window.addEventListener("DOMContentLoaded", function () {
                    alert("Ошибка авторизации через OAuth");
                    window.history.replaceState({}, document.title, window.location.href.split("?")[0]);
                });
            </script>
        </c:when>
    </c:choose>
</c:if>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
        integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
        crossorigin="anonymous"></script>
<script src="${contextPath}/js/index.js"></script>
</body>
</html>
