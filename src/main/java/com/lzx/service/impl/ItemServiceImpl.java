package com.lzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Item;
import com.lzx.mapper.ItemMapper;
import com.lzx.service.ItemService;
/**
 * 订单详情表service实现
 * @author 51019
 *
 */
@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemMapper itemMapper;
	@Override
	public List<Item> findAll() {
		return itemMapper.selectAll();
	}

	@Override
	public Item findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

}
