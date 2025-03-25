package com.example.huawei.mapper;

import com.example.huawei.pojo.Wrong;

/**
* @author 付坤
* @description 针对表【wrong】的数据库操作Mapper
* @createDate 2024-11-18 00:44:09
* @Entity com.example.huawei.pojo.Wrong
*/
public interface WrongMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Wrong record);

    int insertSelective(Wrong record);

    Wrong selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Wrong record);

    int updateByPrimaryKey(Wrong record);

}
