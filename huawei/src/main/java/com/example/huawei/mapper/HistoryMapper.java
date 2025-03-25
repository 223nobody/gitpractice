package com.example.huawei.mapper;

import com.example.huawei.pojo.History;

/**
* @author 付坤
* @description 针对表【history】的数据库操作Mapper
* @createDate 2024-11-13 13:43:58
* @Entity com.example.huawei.pojo.History
*/
public interface HistoryMapper {

    int deleteByPrimaryKey(Long id);

    int insert(History record);

    int insertSelective(History record);

    History selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(History record);

    int updateByPrimaryKey(History record);

}
