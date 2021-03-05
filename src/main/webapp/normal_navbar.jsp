<%--
  Created by IntelliJ IDEA.
  User: nitika
  Date: 9/23/2020
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/myStyles.css" type="text/css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span> Blogs</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="fa fa-group"></span> Himalaya Coders Forum <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <span class="fa fa-caret-square-o-down"></span>   Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Projects</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structures</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">  <span class="fa fa-address-book-o"></span> Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login-page.jsp">  <span class="fa fa-user-circle"></span> Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register-page.jsp">  <span class="fa fa-user-plus"></span> Sign Up</a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
</body>
</html>
