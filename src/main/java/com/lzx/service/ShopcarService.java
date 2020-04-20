package com.lzx.service;

import java.util.List;

import com.lzx.entity.Shopcar;
/**
 * 购物车service层接口
 * @author 51019
 *
 */
public interface ShopcarService {
	List<Shopcar> selectByMember(Integer member_id);
	
	int insert(Shopcar shopcar);
	
	Shopcar selectOne(int member_id, int product_id);
	
	int update(Shopcar shopcar);
	
	int deleteByInfo(int member_id, int product_id);
}
