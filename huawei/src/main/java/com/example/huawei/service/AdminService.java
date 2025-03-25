package com.example.huawei.service;

import com.example.huawei.mapper.MyAdminMapper;
import com.example.huawei.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

@Service
public class AdminService {
    @Autowired
    MyAdminMapper userMapper;

    public Admin queryUser(String uname, String upass)
    {
        return userMapper.queryUser(uname,upass);
    }

    public Integer insertUser(Admin admin) {
        return userMapper.insertUser(admin) ;
    }

    public Integer updateUser(Admin admin,  String newpass) {
        return userMapper.updateUser(admin,newpass) ;
    }

}
