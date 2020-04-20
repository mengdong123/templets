package com.lzx.service;

import java.util.List;

import com.lzx.entity.Product;

public interface ProductService {
	Product selectByPrimaryKey(Integer id);
	
	List<Product> selectByCateId(Integer... cate_id);
	
	List<Product> selectPopular();
	
	List<Product> selectForSearch(String words);
}
