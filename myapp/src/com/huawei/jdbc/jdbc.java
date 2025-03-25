package com.huawei.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
public class jdbc {
    public static void main(String[] args){
        //加载mysql驱动
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("驱动加载成功");
        //连接数据库,获得连接对象
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","123456");
            System.out.println("数据库连接成功");
        //创建执行环境
            Statement sta = conn.createStatement();
        //执行sql查询语句得到结果集
//            ResultSet rs = sta.executeQuery("select * from user");
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("驱动加载失败");
            System.out.println("数据库连接失败");
        }
    }
}
