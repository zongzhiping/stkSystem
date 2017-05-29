package com.model;

public class Admin implements java.io.Serializable {

    private int id;
    private String userName;
    private String password;
    private String admName;
    private String admPass;

    public Admin() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdmName() {
        return admName;
    }

    public void setAdmName(String admName) {
        this.admName = admName;
    }

    public String getAdmPass() {
        return admPass;
    }

    public void setAdmPass(String admPass) {
        this.admPass = admPass;
    }
}
