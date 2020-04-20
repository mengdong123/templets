package com.lzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Shopcar;
import com.lzx.mapper.ShopcarMapper;
import com.lzx.service.ShopcarService;

/**
 * 购物车service层实现类
 * @author 51019
 *
 */
@Service
public class ShopcarServiceImpl implements ShopcarService{

	@Autowired
	private ShopcarMapper shopcarMapper;
	
	@Override
	public List<Shopcar> selectByMember(Integer member_id) {
		return shopcarMapper.selectByMember(member_id);
	}

	@Override
	public int insert(Shopcar shopcar) {
		return shopcarMapper.insert(shopcar);
	}

	@Override
	public Shopcar selectOne(int member_id, int product_id) {
		return shopcarMapper.selectOne(member_id, product_id);
	}

	@Override
	public int update(Shopcar shopcar) {
		return shopcarMapper.updateByPrimaryKey(shopcar);
	}

	@Override
	public int deleteByInfo(int member_id, int product_id) {
		return shopcarMapper.deleteByInfo(member_id, product_id);
	}

}
