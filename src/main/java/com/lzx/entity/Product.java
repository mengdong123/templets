package com.lzx.entity;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;
@Data
public class Product {
    private Integer id;

    private String name;

    private String thumbnail;

    private Integer inventory;

    private Integer sales_volume;

    private BigDecimal price;

    private BigDecimal sale_price;

    private Date create_time;

    private Date sale_time;

    private Integer cate_id;

    private String detail_description;

    private String selling_description;


}