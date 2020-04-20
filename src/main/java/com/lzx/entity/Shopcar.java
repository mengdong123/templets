package com.lzx.entity;

import lombok.Data;
/*
 * 购物车实体类
 */
@Data
public class Shopcar {
    private Integer id;

    private Integer member_id;

    private Integer product_id;

    private Integer amount;

    private Product product;
}