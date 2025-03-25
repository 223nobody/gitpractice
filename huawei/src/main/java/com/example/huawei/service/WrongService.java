package com.example.huawei.service;

import com.example.huawei.mapper.MyWrongMapper;
import com.example.huawei.pojo.Remember;
import com.example.huawei.pojo.Wrong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class WrongService {
    @Autowired
    MyWrongMapper wrongMapper;
    public Integer insertWrong(String word, String yinbiao, String translation) {
        return wrongMapper.insertWrong(word,yinbiao,translation) ;
    }
    public List<Wrong> queryWrongs() {
        return wrongMapper.queryWrongs();
    }
    public Integer getMaxId() {
        return wrongMapper.getMaxId();
    }
    public Wrong queryWrong( int id ){
        return wrongMapper.queryWrong(id);
    }

}
