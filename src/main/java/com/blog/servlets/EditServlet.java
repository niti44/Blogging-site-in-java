package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.FileHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet(value = "/editServlet")
public class EditServlet extends HttpServlet {
    FileHelper fileHelper = new FileHelper();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
        String email = req.getParameter("user_email");
        String password= req.getParameter("user_pass");
        String username = req.getParameter("user_name");
        String about = req.getParameter("user_about");
        // To get the selected image file
        Part part = req.getPart("profile_pic");
        String imageName = part.getSubmittedFileName();


        // To get the current session
        HttpSession s = req.getSession();
        User user = (User) s.getAttribute("user");
        String currentPath = req.getRealPath("/")+"pics"+ File.separator+user.getProfile();

        if(imageName.length()<=0){
            imageName=user.getProfile();
        }
        else {
            if(!user.getProfile().equals("default.png")){
                fileHelper.deleteFile(currentPath);
            }
        }
        PrintWriter out = res.getWriter();

        System.out.println("From part: "+imageName);
        System.out.println("From user : " + user.getProfile());
//        res.getWriter().write(imageName);
//        res.getWriter().write("/n"+user.getProfile());


        user.setEmail(email);
        user.setProfile(imageName);
        user.setAbout(about);
        user.setPassword(password);
        user.setUsername(username);

        res.setContentType("text/html");

        //update user
        UserDao userDao = new UserDao();
        boolean result = userDao.updateUser(user);

        if(result){
            String updatedPath = req.getRealPath("/")+"pics"+ File.separator+user.getProfile();
                if(fileHelper.saveFile(part.getInputStream(),updatedPath)){
                    res.getWriter().println("Profile updated");
                    Message msg = new Message("Profile Updated Successfully!","success","alert-success");
                    s.setAttribute("msg",msg);
                }
                else{
                    res.getWriter().println("Profile not updated");
                    Message msg = new Message("Something Went Wrong...Profile not updated","error","alert-danger");
                    s.setAttribute("msg",msg);
                }

        }
        else{
            res.getWriter().println("Error updating in database");
            Message msg = new Message("Something Went Wrong...","error","alert-danger");
            s.setAttribute("msg",msg);
        }
        res.sendRedirect("profile.jsp");

    }
}
