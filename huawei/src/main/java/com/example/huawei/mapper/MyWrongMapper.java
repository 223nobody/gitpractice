package com.example.huawei.mapper;

import com.example.huawei.pojo.Remember;
import com.example.huawei.pojo.Wrong;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyWrongMapper extends WrongMapper{
    int insertWrong(String word, String yinbiao, String translation);

    Integer getMaxId();
    List<Wrong> queryWrongs();
    Wrong queryWrong(int id);
}
