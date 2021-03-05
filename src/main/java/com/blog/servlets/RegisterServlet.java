package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
@WebServlet (value = "/register")
public class RegisterServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String check = req.getParameter("check");
        if(check == null){
            res.getWriter().write("please check the box");
        }
        else{
            String username = req.getParameter("uname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String gender = req.getParameter("gender");
            String about = req.getParameter("about");
            User user = new User(username,email,password,gender, about);
            UserDao userReg = new UserDao();
            boolean result = userReg.saveUser(user);
            if(result){
                res.getWriter().println("done");
               // req.getRequestDispatcher("login-page").include(req,res);
            }
            else{
                res.getWriter().write("Error");
               // req.getRequestDispatcher("register-page").include(req,res);
            }
        }
    }
}
