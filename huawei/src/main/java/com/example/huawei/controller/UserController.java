package com.example.huawei.controller;


import com.example.huawei.pojo.Admin;
import com.example.huawei.pojo.Result;
import com.example.huawei.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



@RestController
public class UserController {
    @Autowired
    AdminService adminService;

    @GetMapping("/user")
    public Result queryUser(String uname, String upass)
    {
        Admin admin = adminService.queryUser(uname,upass);
        if(admin!=null) return Result.success(admin);
        else return Result.error("用户不存在");
    }
    @PostMapping("/user")
    public Result insertUser(@RequestBody Admin admin) {
        Integer userId = adminService.insertUser(admin);
        if (userId != null) return Result.success(userId);
        else return Result.error("注册失败");
    }

    @PutMapping("/user")
    public Result updateUser(@RequestBody Admin admin,@RequestParam("newpass")String newpass) {
        Integer userId = adminService.updateUser(admin, newpass);
        if (userId != null) {
            return Result.success(userId);
        } else {
            return Result.error("修改失败");
        }
    }
}
