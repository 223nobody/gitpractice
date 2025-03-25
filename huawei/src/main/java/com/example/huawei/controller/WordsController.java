package com.example.huawei.controller;

import com.example.huawei.pojo.History;
import com.example.huawei.pojo.Result;
import com.example.huawei.pojo.Words;
import com.example.huawei.service.WordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class WordsController {
    @Autowired
    WordsService wordsService;

    @GetMapping("/words")
    public Result queryWords(String word)
    {
        String s= wordsService.queryWords(word);
        if(s!=null) return Result.success(s);
        else return Result.error("单词不存在");
    }

    @GetMapping("/words2")
    public Result queryWords2() {
        List<Words> words = wordsService.queryWords2();
        if (words != null && !words.isEmpty()) return Result.success(words);
        else return Result.error("查询历史不存在");
    }
}
