package com.blog.entities;

public class Category {
    private int cid;
    private String title,description;

    public Category( String title, String description) {
        this.title = title;
        this.description = description;
    }

    public Category(int cid, String title, String description) {
        this.cid = cid;
        this.title = title;
        this.description = description;
    }

    public Category(){

    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
