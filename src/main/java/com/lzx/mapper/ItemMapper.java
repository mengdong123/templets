package com.lzx.mapper;

import com.lzx.entity.Item;
import java.util.List;

public interface ItemMapper {
    int deleteByOrder(Integer id);

    int insert(Item record);

    Item selectByPrimaryKey(Integer id);

    List<Item> selectAll();

    int updateByPrimaryKey(Item record);
    
    List<Item> selectByOrderId(Integer order_id);
}