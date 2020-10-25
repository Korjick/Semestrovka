<%--
  Created by IntelliJ IDEA.
  User: Bulat
  Date: 10/25/2020
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>What`s`film - главная страница</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
          integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<!-- Navigation Menu -->

<nav class="navbar sticky-top navbar-expand-lg navbar-dark" style="background-color: #000000">
    <div class="container">
        <a href="" class="navbar-brand">What`s`film</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav mr-auto mb-2">
                <li class="nav-item">
                    <a href="" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">About Us</a>
                </li>
            </ul>
            <form action="" class="d-flex">
                <input type="search" placeholder="Search" class="form-control mr-2">
                <button class="btn btn-outline-warning mr-3">Search</button>
            </form>
            <div class="d-flex justify-content-start">
                <button class="btn btn-outline-light my-3" data-toggle="modal" data-target="#signInModal">Sign In
                </button>
                <button class="btn btn-outline-light ml-3 my-3" data-toggle="modal" data-target="#signUpModal">Sign Up
                </button>
            </div>
        </div>
    </div>
</nav>

<!-- Modal Menu -->

<div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signInModalLabel">Sign In:</h5>
                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/signIn" method="post">
                <div class="modal-body">
                    <div class="row mb-3">
                        <label for="inputEmailSignIn" class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmailSignIn" name="email" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputPasswordSignIn" class="col-sm-4 col-form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPasswordSignIn" name="password"
                                   required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-warning my-3">Sign In</button>
                </div>
            </form>
            <div class="modal-footer d-flex justify-content-start">
                <h5>Sign In With:</h5>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signUpModalLabel">Sign Up:</h5>
                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/signUp" method="post">
                <div class="modal-body">
                    <div class="row mb-3">
                        <label for="inputUsernameSignUp" class="col-sm-4 col-form-label">Username</label>
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
                        <label for="inputPasswordSignUp" class="col-sm-4 col-form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPasswordSignUp" name="password"
                                   required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputPasswordRepeatSignUp" class="col-sm-4 col-form-label">Repeat Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPasswordRepeatSignUp" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputAgeSignUp" class="col-sm-4 col-form-label">Date of Birth</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="inputAgeSignUp" name="dateOfBirth" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <legend class="col-form-label col-sm-10">I agree to the <a href="">Terms of Service</a>
                        </legend>
                        <div class="col-sm-2">
                            <div class="form-check">
                                <input type="checkbox" id="termAcceptedSignUp" class="form-check-input mt-2"
                                       required>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-warning my-3">Sign Up</button>
                </div>
            </form>
            <div class="modal-footer d-flex justify-content-start">
                <h5>Sign Up With:</h5>
            </div>
        </div>
    </div>
</div>

<!-- Main -->

<main>
    <img id="mainPicture" class="d-block w-100" src="../img/sliderOnly.jpg" alt="">
    <div id="filmRecommendationMenu" class="row justify-content-center align-items-center">
        <svg id="filmRecommendationPrevious" viewBox="0 0 16 16" class="bi bi-arrow-left-circle-fill col-1"
             fill="#eeeeee" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
                  d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5.5a.5.5 0 0 0 0-1H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5z"/>
        </svg>
        <div id="filmRecommendationResult" class="row col-10 d-flex justify-content-between align-items-center">
            <div id="filmRecommendation1" class="text-center my-2 col-lg-2 col-sm-4">
                <a href=""><img src="../img/sliderOnly.jpg" class="rounded" alt=""></a>
            </div>
            <div id="filmRecommendation2" class="text-center my-2 col-lg-2 col-sm-4">
                <a href=""><img src="../img/sliderOnly.jpg" class="rounded" alt=""></a>
            </div>
            <div id="filmRecommendation3" class="text-center my-2 col-lg-2 col-sm-4">
                <a href=""><img src="../img/sliderOnly.jpg" class="rounded" alt=""></a>
            </div>
            <div id="filmRecommendation4" class="text-center my-2 col-lg-2 col-sm-4">
                <a href=""><img src="../img/sliderOnly.jpg" class="rounded" alt=""></a>
            </div>
            <div id="filmRecommendation5" class="text-center my-2 col-lg-2 col-sm-4">
                <a href=""><img src="../img/sliderOnly.jpg" class="rounded" alt=""></a>
            </div>
            <div id="filmRecommendation6" class="text-center my-2 col-lg-2 col-sm-4">
                <a href=""><img src="../img/sliderOnly.jpg" class="rounded" alt=""></a>
            </div>
        </div>
        <svg id="filmRecommendationNext" viewBox="0 0 16 16" class="bi bi-arrow-right-circle-fill col-1"
             fill="#eeeeee" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
                  d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-11.5.5a.5.5 0 0 1 0-1h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5z"/>
        </svg>
    </div>
</main>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
        integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
        crossorigin="anonymous"></script>
<script src="../js/confirmPassword.js"></script>
</body>
</html>
