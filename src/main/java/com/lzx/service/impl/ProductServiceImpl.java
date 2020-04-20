package com.lzx.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Product;
import com.lzx.mapper.ProductMapper;
import com.lzx.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public Product selectByPrimaryKey(Integer id) {
		return productMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public List<Product> selectByCateId(Integer... cate_id) {
		if (cate_id.length != 0) {
			return productMapper.selectByCateId(cate_id);
		}
		return new ArrayList<>();
	}

	@Override
	public List<Product> selectPopular() {
		return productMapper.selectPopular();
	}

	@Override
	public List<Product> selectForSearch(String words) {
		return productMapper.selectForSearch(words);
	}

	

}
