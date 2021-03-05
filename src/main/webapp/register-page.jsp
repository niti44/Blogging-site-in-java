<%--
  Created by IntelliJ IDEA.
  User: nitika
  Date: 9/23/2020
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
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

<%@include file="normal_navbar.jsp" %>

<main class="d-flex align-items-center" style="height: 120vh">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header primary-background text-white text-center">
                        <span class="fa fa-user-plus fa-3x"></span><br>
                        <p>Register Here</p>
                    </div>
                    <div class="card-body">

                        <form   id="reg-form"   action="./register"  method="post">

                            <div class="form-group">
                                <label for="username">username</label>
                                <input type="text" class="form-control" name="uname" id="username" placeholder="Enter username">

                            </div>


                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input required type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input required type="password" class="form-control" name="password"  id="exampleInputPassword1" placeholder="Password">
                            </div>

                            <div  class="form-group">
                                <input required type="radio" id="male" name="gender" value="male">
                                <label for="male">Male</label>
                                <input type="radio" id="female" name="gender" value="female">
                                <label for="female">Female</label>
                                <input type="radio" id="other" name="gender" value="other">
                                <label for="other">Other</label>
                            </div>

                            <div class="form-group">
                                <label for="about">Tell us something about you...</label><br>
                                <textarea required rows="3" class="form-control" name="about" id="about" aria-describedby="emailHelp" placeholder="Hey! I am a programmer"></textarea>

                            </div>

                            <div class="form-check">
                                <input type="checkbox"  name ="check" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">I agree to terms and conditions</label>
                            </div>

                            <div class="container text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-3x"></span><br>
                                <p> Please wait....</p>

                            </div>
                            <button  id="submut-btn" type="submit" class="btn primary-background text-white">Submit</button>
                        </form>

                    </div>
                </div>

            </div>

        </div>

    </div>

</main>



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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
    $(document).ready(function (){

        $('#reg-form').on('submit',function (event){

            event.preventDefault();
            let form = new FormData(this);

            $("#submut-btn").hide();
            $("#loader").show();

            //send to register servlet
            $.ajax({
                url:"./register",
                type:'POST',
                data:form,
                success:function (data,texStatus,jqXHR){
                    console.log(data)
                    $("#submut-btn").show();
                    $("#loader").hide();

                    if(data.trim()==='done'){
                        swal("Registered successfully...redirecting you to login page")
                            .then((value) => {
                                window.location="login-page.jsp"
                            });
                    }else{
                        swal(data);
                    }

                },
                error : function(jqXHR, textStatus, errorThrown){
                    console.log(jqXHR)
                    $("#submut-btn").show();
                    $("#loader").hide();
                    swal("something went wrong....");
                },
                processData:false,
                contentType:false
            })

        })

    })


</script>

<%----%>


</body>
</html>
