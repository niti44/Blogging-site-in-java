<%@ page import="com.blog.dao.BlogPostDao" %>
<%@ page import="com.blog.entities.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nitika
  Date: 9/30/2020
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posts</title>
</head>
<body>

<div class="row ">
    <%
        int catId = Integer.parseInt(request.getParameter("cid"));
        BlogPostDao blogPostDao = new BlogPostDao();
        List<Post> posts;
        if(catId == 0){
           posts = blogPostDao.getAllPosts();
        }
        else{
            posts = blogPostDao.getPostByCatId(catId);
        }

        if(posts.size()==0){
            response.setContentType("text/html");
            response.getWriter().println("<h3 class = 'display-3 text-center'> No Posts in this category</h3>");
            return;
        }

        for(Post p : posts){
    %>
    <div class="col-md-6 mt-4">

        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <h3 class="card-title"><b>  <%=p.getpTitle()  %>   </b>   </h3>
                <p class="card-text"> <%= p.getpContent()%>  </p>

            </div>
            
            <div class="card-footer text-center">
                <a href="#" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i>  <span>10</span> </a>
                <a href="show_blog_details.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>
                <a href="#" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i>  <span>20</span> </a>

            </div>

        </div>

    </div>

    <%
        }
    %>

</div>

</body>
</html>
