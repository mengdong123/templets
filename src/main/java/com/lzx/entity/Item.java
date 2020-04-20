package com.lzx.entity;

import java.math.BigDecimal;

import com.lzx.entity.Product;

import lombok.Data;

@Data
public class Item {
    private Integer id;

    private Integer order_id;

    private Integer product_id;

    private Integer amount;

    private BigDecimal total_price;

    private BigDecimal payment_price;
    
    private Product product;

    
}