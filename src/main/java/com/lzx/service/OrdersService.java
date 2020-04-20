package com.lzx.service;

import java.util.List;
import java.util.Map;

import com.lzx.entity.Item;
import com.lzx.entity.Orders;

public interface OrdersService {
	List<Orders> selectByBuyer(Integer buyer_id);
	
	List<Orders> selectByBuyerAndType(Integer buyer_id, Integer status);
	
	/**
	 * 根据用户id返回各类型订单数量
	 * @return
	 */
	Map<Integer, Integer> selectCountByBuyerAndType(Integer member_id);
	
	Orders selectByPrimaryKey(Integer id);

    int update(Orders record);
    
    /**
     * 删除对应id的order和对应的item
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);
    
    /**
     * 根据订单号查id
     */
    int selectIdByNumber(String number);
    
    int insert(Orders orders);
    
    /**
     * 插入一条item数据
     */
    int insertItem(Item item);
}
