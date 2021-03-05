package com.blog.dao;
import com.blog.entities.Category;
import com.blog.entities.Post;
import com.blog.helper.ConnectionProvider;
import javafx.geometry.Pos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogPostDao {
    Connection con;
    public BlogPostDao(){
        con = ConnectionProvider.getConnection();
    }
    //get categories
    public ArrayList<Category> getCategories(){
        ArrayList<Category> list = new ArrayList<>();
        try{
            Statement s = con.createStatement();
            ResultSet result = s.executeQuery("select * from categories");
            while(result.next()){
                Category c = new Category();
                c.setCid(result.getInt("cid"));
                c.setTitle(result.getString("name"));
                c.setDescription(result.getString("description"));
                list.add(c);
            }

        }catch(Exception e){
            e.printStackTrace();
        }


        return list;
    }

    //save post
    public boolean savePost(Post post){
        int status =0;
        try{
            PreparedStatement p = con.prepareStatement("insert into posts(pTitle,pContent,pPic,pCode,catId,userId) values (?,?,?,?,?,?)");
            p.setString(1,post.getpTitle());
            p.setString(2,post.getpContent());
            p.setString(3,post.getpPic());
            p.setString(4,post.getpCode());
            p.setInt(5,post.getCatId());
            p.setInt(6,post.getUserId());

            status = p.executeUpdate();

        }catch(Exception e){
            System.out.println(".....................error updating in db...................");
            e.printStackTrace();
        }

        if(status == 0){
            return false;
        }
        else {
            return  true;
        }
    }

    //get all posts
    public List<Post> getAllPosts(){
        List<Post> posts = new ArrayList<>();

        try{
            Statement s = con.createStatement();
            ResultSet resultSet = s.executeQuery("select * from posts order by pid desc");
            while(resultSet.next()){
                Post post = new Post();
                post.setCatId(resultSet.getInt("catId"));
                post.setPid(resultSet.getInt("pid"));
                post.setpCode(resultSet.getString("pCode"));
                post.setpContent(resultSet.getString("pContent"));
                post.setpPic(resultSet.getString("pPic"));
                post.setpDate(resultSet.getTimestamp("pDate"));
                post.setpTitle(resultSet.getString("pTitle"));
                posts.add(post);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return posts;
    }

    //get post by cat id

    public List<Post> getPostByCatId(int catId){
        List<Post> posts = new ArrayList<>();

        try{
            PreparedStatement p = con.prepareStatement("select * from posts where catId=? order by pid desc");
            p.setInt(1,catId);
            ResultSet resultSet = p.executeQuery();
            while(resultSet.next()){
                Post post = new Post();
                post.setCatId(resultSet.getInt("catId"));
                post.setPid(resultSet.getInt("pid"));
                post.setpCode(resultSet.getString("pCode"));
                post.setpContent(resultSet.getString("pContent"));
                post.setpPic(resultSet.getString("pPic"));
                post.setpDate(resultSet.getTimestamp("pDate"));
                post.setpTitle(resultSet.getString("pTitle"));
                posts.add(post);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return posts;
    }

    public Post getPostByPid(int pid){
       Post post = new Post();

        try{
            PreparedStatement p = con.prepareStatement("select * from posts where pid=?");
            p.setInt(1,pid);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                post.setCatId(resultSet.getInt("catId"));
                post.setPid(resultSet.getInt("pid"));
                post.setpCode(resultSet.getString("pCode"));
                post.setpContent(resultSet.getString("pContent"));
                post.setpPic(resultSet.getString("pPic"));
                post.setpDate(resultSet.getTimestamp("pDate"));
                post.setpTitle(resultSet.getString("pTitle"));

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return post;
    }

//    public static void main(String[] args) {
//        BlogPostDao b = new BlogPostDao();
//        Post p = b.getPostByPid(7);
//        System.out.println(p.getCatId());
//    }


}
