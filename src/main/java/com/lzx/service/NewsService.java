package com.lzx.service;

import java.util.List;

import com.lzx.entity.News;

public interface NewsService {
	
	List<News> selectIndexPage();
	
	List<News> selectTop();
	
	List<News> selectAll();
	
	News selectById(int id);
}
