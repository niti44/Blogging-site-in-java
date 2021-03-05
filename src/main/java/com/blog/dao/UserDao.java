package com.blog.dao;

import com.blog.entities.User;

import java.sql.*;

import static com.blog.helper.ConnectionProvider.getConnection;

public class UserDao {
    private Connection con;
    public UserDao(){
        con = getConnection();
    }

    //Save User
    public boolean saveUser(User user){
        int status = 0;
           try {
               PreparedStatement s = con.prepareStatement("insert into users(username,email,password,gender,about) values(?,?,?,?,?)");
               s.setString(1,user.getUsername());
               s.setString(2,user.getEmail());
               s.setString(3,user.getPassword());
               s.setString(4,user.getGender());
               s.setString(5,user.getAbout());
               status = s.executeUpdate();
           }
           catch (Exception e){
              e.printStackTrace();
           }
           if(status == 0){
               return false;
           }
           else {
               return true;
           }
    }

    //get user by email and password

    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try{
            PreparedStatement s = con.prepareStatement("select * from users where email=? and password=?");
            s.setString(1,email);
            s.setString(2,password);
            ResultSet resultSet = s.executeQuery();
//            System.out.println("hello");
            if(resultSet.next()){
                user = new User(resultSet.getString("username"),email,password,resultSet.getString("gender"), resultSet.getString("about"));
                user.setProfile(resultSet.getString("profile"));
                user.setRegDateTime(resultSet.getTimestamp("regDate"));
                user.setId(resultSet.getInt("id"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }


    //To update user
    public boolean updateUser(User user){
        int status =0;
        try{
            PreparedStatement s = con.prepareStatement("update users set username=?,email=?,password=?,profile=?,about=? where id=?");
            s.setString(1,user.getUsername());
            s.setString(2,user.getEmail());
            s.setString(3,user.getPassword());
            s.setString(4,user.getProfile());
            s.setString(5,user.getAbout());
            s.setInt(6,user.getId());
            status = s.executeUpdate();
//            System.out.println(user.getId());

        }
        catch (Exception e){
            e.printStackTrace();
        }
        if(status == 0){
            return  false;
        }
        else{
            return true;
        }
    }


//    public static void main(String[] args) {
//        User obj = new User();
//        UserDao  o = new UserDao();
//        obj = o.getUserByEmailAndPassword("nitikapoudel2@gmail.com","12345");
//        System.out.println(obj);
//    }


}
