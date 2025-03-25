package com.example.huawei.service;

import com.example.huawei.mapper.MyRememberMapper;
import com.example.huawei.pojo.Remember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RememberService {
    @Autowired
    private MyRememberMapper rememberMapper;

    public Remember queryRemember(Integer id) {
        return rememberMapper.queryRemember(id);
    }
}
