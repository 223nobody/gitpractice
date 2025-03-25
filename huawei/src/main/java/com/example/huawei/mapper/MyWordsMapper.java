package com.example.huawei.mapper;

import com.example.huawei.pojo.Words;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyWordsMapper {
    Words queryWords(String word);
    List<Words> queryWords2();
}
