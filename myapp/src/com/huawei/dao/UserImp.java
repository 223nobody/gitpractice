package com.huawei.dao;

import com.huawei.bean.User;
import com.huawei.jdbc.jdbcUtils;

import java.sql.*;

public class UserImp {
    Connection conn= jdbcUtils.getConnection();
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

//    public int login(User user){
//        //创建执行环境statement
//        //创建连接对象conn
//        //执行sql语句Query,得到结果集对象ResultSet
//
//    try{
//        //创建执行预环境preparedStatement
//        preparedStatement= conn.prepareStatement("select type from user where uname=? and upass=?");
//        preparedStatement.setString(1, user.getUname());
//        preparedStatement.setString(2, user.getUpass());
//        //执行sql语句
//        rs = preparedStatement.executeQuery();
//        while (rs.next()){
//            int type=rs.getInt("type");
//            return type;
//        }
//    }catch (SQLException e){
//        e.printStackTrace();
//    }finally {
//        jdbcUtils.close(conn, preparedStatement ,rs);
//    }
//        return -1;//查询失败
//    }
//    public boolean insert1(User user) {
//        try {
//            //创建执行预环境preparedStatement
//
//            preparedStatement = conn.prepareStatement("insert into user values (?,?,3)");
//            preparedStatement.setString(1, user.getUname());
//            preparedStatement.setString(2, user.getUpass());
//            //执行sql语句
//            int line = preparedStatement.executeUpdate();
//            if (line > 0) {
//                return true;
//            } else {
//                return false;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            jdbcUtils.close(conn, preparedStatement, rs);
//        }
//        return false;
//    }
//    public boolean insert2(User user) {
//        try{
//            //创建执行预环境preparedStatement
//
//            preparedStatement = conn.prepareStatement("insert into user values (?,?,2)");
//            preparedStatement.setString(1, user.getUname());
//            preparedStatement.setString(2, user.getUpass());
//            //执行sql语句
//            int line = preparedStatement.executeUpdate();
//            if(line>0){
//                return true;
//            }else {
//                return false;
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return false;
//    }
//    public boolean update(String oldupass, String newupass) {
//        try{
//            //创建执行预环境preparedStatement
//            preparedStatement = conn.prepareStatement("update user set upass=? where uname=? and upass=?");
//            preparedStatement.setString(1, newupass);
//            preparedStatement.setString(2, uname);
//            preparedStatement.setString(3, oldupass);
//            //执行sql语句
//            int line = preparedStatement.executeUpdate();
//            if(line>0){
//                return true;
//            }else {
//                return false;
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return false;
//    }
}
