package com.lzx.mapper;

import com.lzx.entity.News;
import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    News selectByPrimaryKey(Integer id);

    List<News> selectAll();

    int updateByPrimaryKey(News record);
    
    List<News> selectIndexPage();
    
    List<News> selectTop();
}