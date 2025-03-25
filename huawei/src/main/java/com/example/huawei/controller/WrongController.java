package com.example.huawei.controller;


import com.example.huawei.pojo.Remember;
import com.example.huawei.pojo.Result;

import com.example.huawei.pojo.Wrong;
import com.example.huawei.service.WrongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLOutput;
import java.util.List;

@RestController
public class WrongController {
    @Autowired
    WrongService wrongService;
    @PostMapping("/wrong")
    public Result insertWrong(@RequestParam("word") String word, @RequestParam("yinbiao") String yinbiao, @RequestParam("translation") String translation) {
        Integer WrongId = wrongService.insertWrong(word,yinbiao,translation);
        if (WrongId != null) return Result.success(WrongId);
        else return Result.error("添加失败");
    }

    @GetMapping("/wrong")
    public Result queryWrongs() {
        List<Wrong> wrongs = wrongService.queryWrongs();
        if (wrongs != null) return Result.success(wrongs);
        else return Result.error("单词记录不存在");
    }
    @GetMapping("/wrong/MaxId")
    public Result getMaxId() {
        Integer maxid = wrongService.getMaxId();
        if (maxid != null) return Result.success(maxid);
        else return Result.error("表为空，没有最大 id");
    }

    @GetMapping("/wrong/awrong")
    public Result queryWrong(@RequestParam("id") int id) {
        Wrong wrong = wrongService.queryWrong(id);
        if (wrong != null) return Result.success(wrong);

        else return Result.error("单词记录不存在");
    }

}
