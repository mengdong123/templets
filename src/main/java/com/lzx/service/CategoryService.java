package com.lzx.service;

import java.util.List;

import com.lzx.entity.Category;

public interface CategoryService {
	/**
	 * 	查找菜单及其子菜单
	 * @return
	 */
	List<Category> selectAll();
	
	Category selectByPrimaryKey(Integer id);
	
	List<Category> selectByP_Id(Integer p_id);
	
	List<Category> selectForSearch(String words);
}
