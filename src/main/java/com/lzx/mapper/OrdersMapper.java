package com.lzx.mapper;

import com.lzx.entity.Orders;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);
    
    /**
     * 根据主键查询返回一个对象
     * @param id
     * @return
     */
    Orders selectByPrimaryKey(Integer id);

    List<Orders> selectAll();

    /**
     * 根据对象内的id进行更新
     * @param record
     * @return
     */
    int updateByPrimaryKey(Orders record);
    
    /**
     * 根据用户id查询对应订单
     * @param buyer_id
     * @return
     */
    List<Orders> selectByBuyer(Integer buyer_id);
	
    /**
     * 根据用户id和订单类型查找
     * @param buyer_id
     * @param status
     * @return
     */
	List<Orders> selectByBuyerAndType(@Param("buyer_id")Integer buyer_id, @Param("status")Integer status);
	
	/**
	 * 查找对应用户和订单类型的数据总数
	 * @param buyer_id
	 * @param status
	 * @return
	 */
	Integer selectCountByBuyerAndType(@Param("buyer_id")Integer buyer_id, @Param("status")Integer status);
	
	/**
	 * 根据订单号查询id
	 * @param number
	 * @return
	 */
	Integer selectIdByNumber(String number);
}