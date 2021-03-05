package com.blog.servlets;


import com.blog.dao.BlogPostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.FileHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet (value = "/addPost")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String pTitle = req.getParameter("pTitle");
        String pContent = req.getParameter("pContent");
        String pCode = req.getParameter("pCode");
        int cid =Integer.parseInt(req.getParameter("cid")) ;

        Part part = req.getPart("pPic");
        String  imageName = part.getSubmittedFileName();
        //res.getWriter().println("image name : "+imageName+" ");
       // res.getWriter().println("cid : "+req.getParameter("cid")+" ");

        //get current user
        HttpSession s = req.getSession();
        User user =(User) s.getAttribute("user");
        int userId = user.getId();
       // res.getWriter().println("userId: "+userId+" ");

        Post post = new Post(pCode, userId , pTitle, imageName, pContent,cid);
        BlogPostDao blogPostDao = new BlogPostDao();
        boolean result = blogPostDao.savePost(post);
        FileHelper helper = new FileHelper();
        String path1 = req.getRealPath("/")+"blog_pics"+ File.separator+post.getpPic();
//        res.getWriter().println(path1);

        //res.getWriter().println(result);
        if(result){
            String path = req.getRealPath("/")+"blog_pics"+ File.separator+post.getpPic();
            helper.saveFile(part.getInputStream(),path);
            res.getWriter().println("done");
        }
        else{
            res.getWriter().println("error");
        }

    }
}
