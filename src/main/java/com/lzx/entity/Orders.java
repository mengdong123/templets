package com.lzx.entity;

import java.math.BigDecimal;
import java.util.List;

import com.lzx.entity.Address;
import com.lzx.entity.Item;

import lombok.Data;
/**
 * 订单表实体类
 * @author 51019
 *
 */
@Data
public class Orders {
    private Integer id;

    private String number;

    private Integer buyer_id;

    private Integer total_amount;

    private BigDecimal total_price;

    private BigDecimal payment_price;

    private String remark;

    private Integer address_id;
    
    private Integer status;

    
    private List<Item> items;
    
    private Address address;
}