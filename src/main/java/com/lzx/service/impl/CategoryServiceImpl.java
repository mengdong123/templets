package com.lzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Category;
import com.lzx.mapper.CategoryMapper;
import com.lzx.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> selectAll() {
		return categoryMapper.selectAll();
	}

	@Override
	public Category selectByPrimaryKey(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Category> selectByP_Id(Integer p_id) {
		return categoryMapper.selectByP_Id(p_id);
	}

	@Override
	public List<Category> selectForSearch(String words) {
		List<Category> list = categoryMapper.selectSonByName(words);
		if (list.size() == 0 || list == null) {
			list = categoryMapper.selectFatherByName(words);
			if (list.size() != 0 && list != null) {
				list = categoryMapper.selectByP_Id(list.get(0).getId());
			}
		}
		return list;
	}
	
}
