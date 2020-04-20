package com.lzx.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.entity.Category;
import com.lzx.entity.Product;
import com.lzx.entity.common.Page;
import com.lzx.service.CategoryService;
import com.lzx.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 	点击父菜单后，查找对应产品
	 * @param mav
	 * @param session
	 * @param id
	 * @return
	 */
	@GetMapping("/productList/ParentCategory/{id:\\d+}/{currentPage:\\d+}")
	public ModelAndView ParentCategoryProductList(ModelAndView mav,HttpSession session, @PathVariable int id,@PathVariable int currentPage) {
		//获取上下文
		ServletContext context = session.getServletContext();
		//获取菜单列表
		@SuppressWarnings("unchecked")
		List<Category> categories = (List<Category>) context.getAttribute("categoryList");
		//找id对应的父菜单
		//Category categoryParent = categoryService.selectByPrimaryKey(id);
		List<Category> childList = null;
		for (Category category : categories) {
			if (category.getId() == id) {
				childList = category.getChildElement();
			}
		}
		//将对应的子菜单id转为list
		List<Integer> ids = new ArrayList<>();
		for (Category category : childList) {
			ids.add(category.getId());
		}
		//转为数组
		Integer[] ids2 = ids.toArray(new Integer[ids.size()]);
		//查找
		List<Product> list = productService.selectByCateId(ids2);
		Page<Product> page = new Page<>(list, currentPage, 15);
		page.setLastPage("«上一页");
		page.setNextPage("下一页»");
		mav.addObject("page",page);
		//返回数据
		mav.addObject("currentCategory", categoryService.selectByPrimaryKey(id));
		mav.setViewName("cate_list");
		return mav;
		
	}
	
	/**
	 * 	点击子菜单后，显示产品列表
	 * @param mav
	 * @param id
	 * @return
	 */
	@GetMapping("/productList/{id:\\d+}/{currentPage:\\d+}")
	public ModelAndView productList(ModelAndView mav, @PathVariable int id,@PathVariable int currentPage) {
		//查找商品列表进行伪分页
		List<Product> list = productService.selectByCateId(id);
		Page<Product> page = new Page<>(list, currentPage, 15);
		page.setLastPage("«上一页");
		page.setNextPage("下一页»");
		mav.addObject("page",page);
		//当前菜单位置
		mav.addObject("currentCategory", categoryService.selectByPrimaryKey(id));
		mav.setViewName("cate_list");
		return mav;
	}
	
	/**
	 * 	全部商品列表
	 * @param mav
	 * @return
	 */
	@GetMapping("/productList/all/{currentPage:\\d+}")
	public ModelAndView listAll(ModelAndView mav, @PathVariable int currentPage) {
		//查找商品列表进行伪分页
		List<Product> list = productService.selectPopular();
		Page<Product> page = new Page<>(list, currentPage, 15);
		page.setLastPage("«上一页");
		page.setNextPage("下一页»");
		mav.addObject("page",page);
		//当前菜单位置
		Category c = new Category();
		c.setName("全部商品");
		c.setId(0);
		mav.addObject("currentCategory", c);
		
		mav.setViewName("cate_list");	
		return mav;
	}
	
	/**
	 * 	显示产品详情
	 * @param mav
	 * @param id
	 * @return
	 */
	@GetMapping("/prod_detail/{id:\\d+}")
	public ModelAndView productDetail(ModelAndView mav, @PathVariable int id) {
		//根据id查找商品对象
		Product product = productService.selectByPrimaryKey(id);
		mav.addObject("product", product);
		//查找分类对象
		Category category = categoryService.selectByPrimaryKey(product.getCate_id());
		//查找分类父元素
		Category categoryParent = categoryService.selectByPrimaryKey(category.getP_id());
		mav.addObject("category", categoryParent);
		//查找该父标签对应的全部子标签
		List<Category> childCategories = categoryService.selectByP_Id(categoryParent.getId());
		List<Integer> ids = new ArrayList<>();
		for (Category c : childCategories) {
			ids.add(c.getId());
		}
		Integer[] ids2 = ids.toArray(new Integer[ids.size()]);
		//查找该父标签下的子标签的全部热门产品
		List<Product> list = productService.selectByCateId(ids2);
		mav.addObject("otherProduct", list);
		mav.setViewName("prod_detail");
		return mav;
	}
}
