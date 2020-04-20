package com.lzx.mapper;

import com.lzx.entity.Category;
import java.util.List;

public interface CategoryMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Category record);

    Category selectByPrimaryKey(Integer id);

    List<Category> selectAll();

    int updateByPrimaryKey(Category record);
    
    List<Category> selectByP_Id(Integer p_id);
    
    List<Category> selectFatherByName(String name);
    
    List<Category> selectSonByName(String name);
}