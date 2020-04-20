package com.lzx.entity;

import java.util.List;

import com.lzx.entity.Category;

import lombok.Data;
@Data
public class Category {
    private Integer id;

    private String name;

    private String alias;

    private Integer p_id;

    private String order_weight;


    private List<Category> childElement;
}