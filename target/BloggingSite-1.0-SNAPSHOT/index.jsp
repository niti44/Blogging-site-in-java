<%--
  Created by IntelliJ IDEA.
  User: nitika
  Date: 9/23/2020
  Time: 7:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="com.blog.helper.ConnectionProvider" %>
<html>
<head>
    <title>Title</title>
    <%--    css--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/myStyles.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 65% 100%, 33% 93%, 0 99%, 0 0);
        }
    </style>

</head>
<body>
<%--navbar--%>
    <%@include file="normal_navbar.jsp" %>
<%--    container--%>
    <div class="container-fluid p-0 m-0 banner-background">
        <div class="jumbotron secondary-background" >

            <div class="container">
                <h3 class="display-4"> Welcome to Himalaya Coders Forum</h3>
                <p>A programming language is a formal language comprising a set of instructions that produce various kinds of output</p>
                <button class="btn btn-outline-light btn-lg primary-background">  <span class="fa fa-external-link"></span> Get Started</button>
                <a class="btn btn-outline-light btn-lg primary-background" href="login-page.jsp"> <span class="fa fa-user-circle fa-spin"></span>   Login</a>
            </div>

        </div>

    </div>

<%--cards--%>
<div class="container">
    <div class="row">

        <div class="col-md-4">

            <div class="card">

                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <div class="card">

                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <div class="card">

                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>

        </div>

    </div>

    <div class="row">

        <div class="col-md-4">

            <div class="card">

                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <div class="card">

                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <div class="card">

                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>

        </div>

    </div>

</div>




<%--javascript--%>
<script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous">

</script>

<script src="js/myJs.js" type="text/javascript"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">

</script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">

</script>
<%----%>
</body>
</html>
