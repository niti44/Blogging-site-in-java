package com.blog.entities;
import java.sql.*;
public class User {
    public User(String username, String email, String password, String gender, String about) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }
    public User(){

    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    private int id;
    private String username,email,password,gender,profile,about;
    private Timestamp regDateTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getRegDateTime() {
        return regDateTime;
    }

    public void setRegDateTime(Timestamp regDateTime) {
        this.regDateTime = regDateTime;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
}
