package com.lzx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.entity.News;
import com.lzx.entity.common.Page;
import com.lzx.service.NewsService;

@Controller
public class NewsController {
	
	@Autowired
	NewsService newsService;
	
	@RequestMapping("/news_list/{currentPage:\\d+}")
	public ModelAndView newList(ModelAndView modelAndView,@PathVariable int currentPage) {
		List<News> list = newsService.selectAll();
		Page<News> page = new Page<>(list, currentPage, 15);
		page.setLastPage("上一页");
		page.setNextPage("下一页");
		modelAndView.addObject("page",page);
		modelAndView.setViewName("news_list");
		return modelAndView;
	}
	
	@RequestMapping("/news_detail/{id:\\d+}")
	public ModelAndView newsDetail(ModelAndView modelAndView,@PathVariable int id) {
		News news = newsService.selectById(id);
		modelAndView.addObject("news", news);
		modelAndView.setViewName("news_detail");
		return modelAndView;
	}
}
