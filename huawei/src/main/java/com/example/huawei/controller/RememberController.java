package com.example.huawei.controller;

import com.example.huawei.pojo.Remember;
import com.example.huawei.pojo.Result;
import com.example.huawei.service.RememberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RememberController {
    @Autowired
    private RememberService rememberService;

    @GetMapping("/remember")
    public Result queryRemember(Integer id) {
        Remember remember = rememberService.queryRemember(id);
        if (remember != null) return Result.success(remember);
        else return Result.error("单词记录不存在");
    }
}
