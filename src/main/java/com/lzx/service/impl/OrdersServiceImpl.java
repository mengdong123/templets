package com.lzx.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Item;
import com.lzx.entity.Orders;
import com.lzx.mapper.ItemMapper;
import com.lzx.mapper.OrdersMapper;
import com.lzx.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private ItemMapper itemMapper;
	
	
	@Override
	public List<Orders> selectByBuyer(Integer buyer_id) {
		return ordersMapper.selectByBuyer(buyer_id);
	}

	@Override
	public List<Orders> selectByBuyerAndType(Integer buyer_id, Integer status) {
		return ordersMapper.selectByBuyerAndType(buyer_id, status);
	}

	@Override
	public Map<Integer, Integer> selectCountByBuyerAndType(Integer member_id) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for (int i = 1; i <= 6; i++) {
			map.put(i, ordersMapper.selectCountByBuyerAndType(member_id, i));
		}
		return map;
	}

	@Override
	public Orders selectByPrimaryKey(Integer id) {
		return ordersMapper.selectByPrimaryKey(id);
	}

	@Override
	public int update(Orders record) {
		return ordersMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		itemMapper.deleteByOrder(id);
		return ordersMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int selectIdByNumber(String number) {
		return ordersMapper.selectIdByNumber(number);
	}

	@Override
	public int insert(Orders orders) {
		return ordersMapper.insert(orders);
	}

	@Override
	public int insertItem(Item item) {
		return itemMapper.insert(item);
	}

}
