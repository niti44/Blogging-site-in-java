package com.blog.servlets;


import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = new User();
        UserDao userDao = new UserDao();
        res.setContentType("text/html");
        user = userDao.getUserByEmailAndPassword(email,password);
        if(user==null){
            //login failed
            //res.getWriter().write("error");
            Message msg = new Message("Invalid login Details! Please try again","error","alert-danger");
            HttpSession session = req.getSession();
            session.setAttribute("msg",msg);
            //req.getRequestDispatcher("login-page.jsp").include(req,res);
            res.sendRedirect("login-page.jsp");
        }
        else{
            //login success
//            Cookie emailId= new Cookie("email",email);
//            Cookie psw = new Cookie("password",password);
//            res.addCookie(emailId);
//            res.addCookie(psw);
            HttpSession s = req.getSession();
            s.setAttribute("user",user);
            req.getRequestDispatcher("profile.jsp").include(req,res);
            res.sendRedirect("profile.jsp");
        }
    }
}
