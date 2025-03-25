package com.example.huawei.mapper;

import com.example.huawei.pojo.Remember;

/**
* @author 付坤
* @description 针对表【remember】的数据库操作Mapper
* @createDate 2024-11-17 23:18:52
* @Entity com.example.huawei.pojo.Remember
*/
public interface RememberMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Remember record);

    int insertSelective(Remember record);

    Remember selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Remember record);

    int updateByPrimaryKey(Remember record);

}
