package com.example.huawei.mapper;

import com.example.huawei.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyAdminMapper extends AdminMapper{
    Admin queryUser(String uname, String upass);
    int insertUser(Admin admin);
    int updateUser(Admin admin, String newpass);
}
