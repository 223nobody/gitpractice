package com.example.huawei.mapper;

import com.example.huawei.pojo.Remember;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyRememberMapper extends RememberMapper{
    Remember queryRemember(Integer id);
}
