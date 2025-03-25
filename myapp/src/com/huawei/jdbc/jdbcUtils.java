package com.huawei.jdbc;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class jdbcUtils {
    private static String driver;
    private static String url;
    private static String username;
    private static String password;

    //静态语句块
    static {
        InputStream ins = jdbcUtils.class.getClassLoader().getResourceAsStream("db.properties");
    //创造Properties类型的对象
        Properties p = new Properties();
    //加载流文件
        try {
            p.load(ins);
            driver = p.getProperty("driver");
            url = p.getProperty("url");
            username = p.getProperty("username");
            password = p.getProperty("password");
            //加载mysql驱动
            Class.forName(driver);
            System.out.println("驱动加载成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获得对象的方法
    public static Connection getConnection(){
        try{
            System.out.println("数据库连接成功");
            return DriverManager.getConnection(url,username,password);
        }catch(SQLException e){
            e.printStackTrace();
            System.out.println("数据库连接失败");
            return null;
        }
    }
    public static void close(Connection conn, Statement sta, ResultSet rs){
            try{
                if(conn!=null) {
                    conn.close();
                }
                if(sta!=null) {
                    sta.close();
                }
                if(rs!=null) {
                    rs.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }
    }
}

