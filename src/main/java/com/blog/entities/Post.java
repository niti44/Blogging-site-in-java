package com.blog.entities;

import java.sql.Timestamp;

public class Post {
    private int pid,userId;
    private String pCode,pTitle,pPic,pContent;
    private Timestamp pDate;
    private int catId;

    public Post(int pid, int userId,String pCode, String pTitle, String pPic, String pContent, int catId) {
        this.pid = pid;
        this.userId = userId;
        this.pCode = pCode;
        this.pTitle = pTitle;
        this.pPic = pPic;
        this.pContent = pContent;
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Post(String pCode, int userId , String pTitle, String pPic, String pContent, int catId) {
        this.pCode = pCode;
        this.userId = userId;
        this.pTitle = pTitle;
        this.pPic = pPic;
        this.pContent = pContent;
        this.catId = catId;
    }
    public Post(){

    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
}
