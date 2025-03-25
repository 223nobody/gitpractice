package com.example.huawei.mapper;

import com.example.huawei.pojo.History;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyHistoryMapper extends HistoryMapper{
    List<History> queryHistory();
    int insertHistory(History history);
}


