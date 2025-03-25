package com.example.huawei.mapper;

import com.example.huawei.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;

/**
* @author 付坤
* @description 针对表【admin】的数据库操作Mapper
* @createDate 2024-11-12 20:03:43
* @Entity com.example.huawei.pojo.Admin
*/
@Mapper
public interface AdminMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

}
