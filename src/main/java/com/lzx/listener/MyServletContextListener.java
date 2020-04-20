package com.lzx.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.lzx.entity.Category;
import com.lzx.service.CategoryService;

@WebListener
public class MyServletContextListener implements ServletContextListener {

	private CategoryService categoryService;

	@Override
	public void contextInitialized(ServletContextEvent sce) {

		// path
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("path", sc.getContextPath());
		//System.out.println("============"+sc.getContextPath()+"===========================");
		// img_path===

		// 获取categoryService对象
		ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(sc);
		this.categoryService = (CategoryService) application.getBean(CategoryService.class);
		// icd_title中的categoryList
		List<Category> list = categoryService.selectAll();
		sc.setAttribute("categoryList", list);
		System.out.println("============"+list+"===========================");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
