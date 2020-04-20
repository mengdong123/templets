package com.lzx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.service.NewsService;
import com.lzx.service.ProductService;

@Controller
public class IndexPageController {
	
	@Autowired
	ProductService productService;
	@Autowired
	NewsService newsService;
	
	@RequestMapping("/index")
	public ModelAndView showIndexPage(ModelAndView modelAndView) {
		//新闻设置
		modelAndView.addObject("news", newsService.selectIndexPage());
		modelAndView.addObject("slideshow", newsService.selectTop());
		//System.out.println(newsService.selectTop());
		//商品设置
		modelAndView.addObject("popularProduct", productService.selectPopular());
		//
		//System.out.println(productService.selectPopular());
		modelAndView.addObject("popularPhone", productService.selectByCateId(2));
		modelAndView.addObject("popularPC", productService.selectByCateId(10,11,12));
		
		System.out.println( "=========================================="+productService.selectByCateId(10,12));
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
