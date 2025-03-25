package com.example.huawei.mapper;

import com.example.huawei.pojo.Words;

/**
* @author 付坤
* @description 针对表【words】的数据库操作Mapper
* @createDate 2024-11-13 13:11:48
* @Entity com.example.huawei.pojo.Words
*/
public interface WordsMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Words record);

    int insertSelective(Words record);

    Words selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Words record);

    int updateByPrimaryKey(Words record);

}
