<%--
  Created by IntelliJ IDEA.
  User: nitika
  Date: 9/24/2020
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Error!!!</title>

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
<div class="container text-center">
    <img src="images/error.png" class="img-fluid">
    <h3 class="display-3"> Sorry! Something went wrong...</h3><br>
    <%=exception %>
    <a href="index.jsp" class="btn primary-background text-white btn-lg mt-3"> Go To HOME </a>
</div>
</body>
</html>
