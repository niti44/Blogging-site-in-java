package com.blog.servlets;

import com.blog.entities.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/logout")
public class LogOutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        HttpSession s = req.getSession();
        s.removeAttribute("user");

//        Cookie ce=new Cookie("email","");//deleting value of cookie
//        ce.setMaxAge(0);//changing the maximum age to 0 seconds
//        res.addCookie(ce);
//
//        Cookie cp=new Cookie("password","");//deleting value of cookie
//        cp.setMaxAge(0);//changing the maximum age to 0 seconds
//        res.addCookie(cp);

        Message message = new Message("Log out success!","success","alert-success");
        s.setAttribute("msg",message);
        //req.getRequestDispatcher("login-page.jsp").include(req,res);
        res.sendRedirect("login-page.jsp");
    }

}
