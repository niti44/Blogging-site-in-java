<%--
  Created by IntelliJ IDEA.
  User: nitika
  Date: 9/27/2020
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>

<%--user validation--%>
<%

    User user = new User();
    user = (User) session.getAttribute("user");
    if (user != null) {
%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import=" java.io.*" %>
<%@ page import="com.blog.entities.Message" %>
<%@ page import="com.blog.entities.User" %>
<%@ page import="com.blog.dao.BlogPostDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.blog.entities.Category" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/myStyles.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 65% 100%, 33% 93%, 0 99%, 0 0);
        }
    </style>
</head>
<body>
<%--navbar--%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span> Blogs</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="fa fa-group"></span> Himalaya Coders Forum <span
                        class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-caret-square-o-down"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Projects</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structures</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"> <span class="fa fa-address-book-o"></span> Contact Us</a>
            </li>

            <li class="nav-item active primary-background">
                <a class="nav-link btn " href="#" data-toggle="modal" data-target="#addPostModal" > <span class="fa fa-asterisk" ></span> <b>Create Post</b></a>
            </li>

        </ul>

        <%--        <form class="form-inline my-2 my-lg-0">--%>
        <%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
        <%--            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>--%>
        <%--        </form>--%>

        <ul class="navbar-nav mr-right">

            <li class="nav-item active primary-background">
                <a class="nav-link " data-toggle="modal" data-target="#profile-Modal"> <span
                        class="fa fa-user-circle"></span><%=user.getUsername()%>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="logout"> Log out</a>
            </li>

        </ul>
    </div>
</nav>
<%-- end of nav bar --%>
<%
    Message m =(Message)session.getAttribute("msg");
    if(m!=null){
%>
<div class=<%= m.getCssClass()%> role="alert">
    <%=m.getContent()%>
</div>
<%
        session.removeAttribute("msg");
    }
%>

<%-- profile modal --%>

<%--main body of the page--%>
<main>
    <div class="container">
        <div class="row mt-4">
            <%-- first column--%>
            <div class="col-md-4">

                <div class="list-group ">
                    <a href="#"  onclick="getPost(0,this)"  class="c-link list-group-item list-group-item-action active primary-background ">
                        All Posts
                    </a>
                    <%
                        BlogPostDao blogPostDao = new BlogPostDao();
                        ArrayList<Category> list =blogPostDao.getCategories();
                        for(Category c: list){
                    %>

                    <a href="#"  onclick="getPost(<%= c.getCid()%>,this)"  class="c-link list-group-item list-group-item-action"><%= c.getTitle()%></a>

                    <%
                        }
                    %>
                </div>

            </div>
                <%-- second column--%>
                <div class="col-md-8" >
                    <%--Posts--%>
                    <div class="container" id="loader">

                         <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2"> Loading...</h3>

                    </div>

                    <div class="container-fluid" id="post-container">

                    </div>


                </div>

        </div>

    </div>

</main>


<%--end of main  body--%>


<%--Profile modal--%>
<!-- Modal -->
<div class="modal fade" id="profile-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title" id="exampleModalLabel">Himalaya Coders Forum</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <%--<% String src = user.getProfile();--%>
                    <%--System.out.println(src);--%>
                    <%--%>--%>
                    <img src="pics/<%=user.getProfile()%>" class="img-fluid"
                         style="border-radius: 40%; max-width: 150px">
                    <h5 class="modal-title mt-3" id="user-name-label"><%=user.getUsername()%>
                    </h5>
                    <br>
                    <%--details--%>
                        <div id="profile-table">

                            <table class="table table-striped">
                                <tbody>
                                <tr>
                                    <th scope="row">Email: </th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Registration Date: </th>
                                    <td><%= user.getRegDateTime()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">About: </th>
                                    <td><%= user.getAbout()%></td>
                                </tr>
                                </tbody>
                            </table>


                        </div>
<%--                    profile edit--%>
                    <div id="profile-edit" style="display: none">
                        <h3 class="mt-2">Please Edit Carefully </h3>
                        <form action="./editServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <th>Change Profile Photo </th>
                                    <td><input type="file" class="form-control" name="profile_pic"> </td>
                                </tr>
                                <tr>
                                    <th>Email: </th>
                                    <td><input type="email" value="<%=user.getEmail() %>" class ="form-control" name="user_email"> </td>
                                </tr>
                                <tr>
                                    <th>Password: </th>
                                    <td><input type="password" value="<%=user.getPassword() %>" class ="form-control" name="user_pass"> </td>
                                </tr>
                                <tr>
                                    <th>UserName: </th>
                                    <td><input type="text" value="<%=user.getUsername() %>" class ="form-control" name="user_name"> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Registration Date: </th>
                                    <td><%= user.getRegDateTime()%></td>
                                </tr>
                                <tr>
                                    <th>About: </th>
                                    <td><textarea class ="form-control" name="user_about"><%=user.getAbout() %></textarea> </td>
                                </tr>

                            </table>

                            <div class="container">
                                <button type="submit" class="btn-outline-primary">Save</button>
                            </div>

                        </form>

                    </div>


                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="profile_edit_button">Edit</button>
            </div>
        </div>
    </div>
</div>

<%
    } else {
        response.sendRedirect("login-page.jsp");
    }
%>

<%-- end of profile modal--%>

<%--add post modal--%>


<!-- Modal -->
<div class="modal fade" id="addPostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPostModalLabel"> Please Provide The Post Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="./addPost" method="post" id="addBlogPostForm">

                    <div class="form-group">
                        <select  id="category" name="cid">
                            <option value="" selected disabled>-----Select Category Of Your Blog-----</option>
                            <%
                                BlogPostDao postDao = new BlogPostDao();
                                ArrayList<Category> category = postDao.getCategories();
                                for(Category c: category){
                            %>
                            <option value="<%= c.getCid()%>"> <%= c.getTitle()%> </option>

                            <%
                                }
                            %>

                        </select>

                    </div>

                    <div class="form-group">
                        <input  name="pTitle"  type="text" placeholder="Enter the title of your post" class="form-control">
                    </div>
                    <div class="form-group">
                        <textarea name="pContent"  style="height:200px"   placeholder="Please write your content here..." class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <textarea  name="pCode"  style="height:200px"   placeholder="Please write your code (if any) here..." class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="postPhoto">Upload a photo: </label>
                        <br>
                        <input type="file" name="pPic"    id="postPhoto">
                    </div>

                    <div class="container ">
<%--                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>

<%--end of add post modal--%>


<%--javascript--%>
<script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous">

</script>

<%--script sweet alert--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%----%>

<script src="js/myJs.js" type="text/javascript"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">

</script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">

</script>

<script>
    $(document).ready(function () {
        let edit_status = false;
        $("#profile_edit_button").click(function (){
            if(!edit_status){
                $("#profile-edit").show();
                $("#profile-table").hide();
                edit_status = true;
                $(this).text("Back");
            }
            else{
                $("#profile-edit").hide();
                $("#profile-table").show();
                edit_status = false;
                $(this).text("Edit");
            }

        });

    });

</script>
<%----%>

<%--add post Js--%>
<script>

    $(document).ready(function (e){
       $("#addBlogPostForm").on("submit",function (event) {
           event.preventDefault();
           let form = new FormData(this);
           console.log("submit is clicked.......");

           //now requesting to server
           $.ajax({
               url : "./addPost",
               type : "POST",
               data : form,
               success : function (data, textStatus, jqXHR){
                    console.log(data);
                    if(data.trim()=='done'){
                        swal("Good job!", "Post Saved Successfully!", "success");
                    }
                    else {
                        swal("Error!", "Something went wrong...", "success");
                    }
               },
               error : function (data, textStatus, jqXHR){
                   swal("Error!", "Something went wrong...try again!", "success");
               },
               processData: false,
               contentType :false

           })

       })

    });

</script>

<%-- Loading posts using Ajax --%>
<script>

    function getPost(catId, referenceLink){

        $(".c-link").removeClass("active");
        $(".c-link").removeClass("primary-background");

        $.ajax({
            url:"load_posts.jsp",
            data: {"cid":catId},
            success : function (data, textStatus, jqXHR){
                console.log(data);
                $("#loader").hide();
                $("#post-container").html(data);
                $(referenceLink).addClass('active');
                $(referenceLink).addClass('primary-background');
            }

        })
    }


    $(document).ready(function(e){
        let allPostRef = $(".c-link")[0];
        getPost(0,allPostRef);

    });

</script>



</body>
</html>
