package com.lzx.controller;

import java.util.LinkedHashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.entity.Category;
import com.lzx.entity.Product;
import com.lzx.entity.common.Page;
import com.lzx.service.CategoryService;
import com.lzx.service.ProductService;

@Controller
public class SearchController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 搜索商品
	 * @param words
	 * @param currentPage
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/search")
	public ModelAndView search(String words,@RequestParam(defaultValue = "1",required = false)int currentPage,
			ModelAndView modelAndView, HttpSession session) {
		//模糊查询商品
		List<Product> plist1 = productService.selectForSearch(words);
		//精确匹配分类
		List<Category> cList = categoryService.selectForSearch(words);
		Integer[] ids = new Integer[cList.size()];
		for (int i = 0; i < cList.size(); i++) {
			ids[i] = cList.get(i).getId();
		}
		List<Product> pList2 = productService.selectByCateId(ids);
		
		LinkedHashSet<Product> set = new LinkedHashSet<Product>();
		set.addAll(pList2);
		set.addAll(plist1);
		//分页
		Page<Product> page = new Page<>(set, currentPage, 15);
		page.setLastPage("«上一页");
		page.setNextPage("下一页»");
		modelAndView.addObject("page",page);
		//面包屑显示
		Category c = new Category();
		c.setName("商品搜索："+words);
		c.setId(0);
		modelAndView.addObject("currentCategory", c);
		
		//搜索标记
		session.setAttribute("search", words);
		
		modelAndView.setViewName("cate_list");
		return modelAndView;
	}
	
	

}
