package com.huawei.bean;

public class User {
    private int id;
    private String uname,upass;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }
    public User(String uname,String upass){
        super();
        this.uname=uname;
        this.upass=upass;
    }

}
