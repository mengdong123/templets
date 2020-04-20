package com.lzx.service;

import java.util.List;

import com.lzx.entity.Item;


/**
 * 订单详情表service层接口
 * @author 51019
 *
 */
public interface ItemService {
	    //查询全部
		public List<Item> findAll();
		
		//根据id查询
		public Item findById(int id);
		
		//根据id删除
		public void deleteById(int id);
		
		//修改地址
		public void update();
		
		//查询我的订单


}
