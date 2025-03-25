package com.example.huawei.service;

import com.example.huawei.mapper.MyWordsMapper;
import com.example.huawei.pojo.Words;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WordsService {
    @Autowired
    MyWordsMapper wordsMapper;
    public String queryWords(String word)
    {
        Words words = wordsMapper.queryWords(word);
        return words.getTranslation();
    }

    public List<Words> queryWords2()
    {
        return wordsMapper.queryWords2();
    }

}
