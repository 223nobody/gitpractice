package com.example.huawei.service;

import com.example.huawei.mapper.MyHistoryMapper;
import com.example.huawei.pojo.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.util.List;

@Service
public class HistoryService {
    @Autowired
    MyHistoryMapper historyMapper;

    public List<History> queryHistory() {
        return  historyMapper.queryHistory();
    }
    public Integer insertHistory(String word, String translation) {
        History history=new History();
        history.setWord(word);
        history.setTranslation(translation);
        return historyMapper.insertHistory(history) ;
    }
}
