package com.lzx.entity;

import java.util.Date;

import lombok.Data;
@Data
public class News {
    private Integer id;

    private String title;

    private String thumbnail;

    private Integer hits;

    private Boolean top;

    private Date pub_time;
    
    private int indexpage;

    private String content;

}