package com.example.huawei.controller;

import com.example.huawei.pojo.History;
import com.example.huawei.pojo.Result;
import com.example.huawei.service.HistoryService;
import com.example.huawei.service.RememberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ansi.AnsiOutput;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLOutput;
import java.util.List;

@RestController
public class HistoryController {
    @Autowired
    HistoryService historyService;

    @GetMapping("/history")
    public Result queryHistory() {
        List<History> histories = historyService.queryHistory();
        if (histories != null && !histories.isEmpty()) return Result.success(histories);
        else return Result.error("查询历史不存在");
    }

    @PostMapping("/history")
    public Result insertHistory(@RequestBody History history) {
        Integer HistoryId = historyService.insertHistory(history.getWord(),history.getTranslation());
        if (HistoryId != null) return Result.success(HistoryId);
        else return Result.error("添加失败");
    }


}
