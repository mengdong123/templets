package com.lzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.News;
import com.lzx.mapper.NewsMapper;
import com.lzx.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsMapper newsMapper;
	
	@Override
	public List<News> selectIndexPage() {
		return newsMapper.selectIndexPage();
	}

	@Override
	public List<News> selectTop() {
		return newsMapper.selectTop();
	}

	@Override
	public List<News> selectAll() {
		return newsMapper.selectAll();
	}

	@Override
	public News selectById(int id) {
		return newsMapper.selectByPrimaryKey(id);
	}
	
}
