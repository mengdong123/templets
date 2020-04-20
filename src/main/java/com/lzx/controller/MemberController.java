package com.lzx.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.service.NewsService;
import com.lzx.service.ProductService;
import com.lzx.entity.Member;
import com.lzx.service.MemberService;
import com.lzx.service.impl.MemberServiceImpl;
/**
 * member 控制器
 * 用户未登录的操作
 * @author 51019
 *
 */
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	NewsService newsService;
	
	//用户登录
	@RequestMapping("/login")
	public ModelAndView login(String mobile,String pwd,HttpSession session,ModelAndView mav) {
		String msg = "";
		
		Member member= memberService.login(mobile, pwd);
		if(member!=null) {
			session.setAttribute("member", member);
			mav.setViewName("mng/index");
			return mav;
		}else {
			msg="用户名或密码不正确，请重新输入！";
			mav.addObject("msg", msg);
			mav.setViewName("member_login");
			return mav;
		}
	}
	
	
	//用户注册
	@RequestMapping("/register")
	public ModelAndView redirect(ModelAndView mav,Member member) {
		System.out.println("+++++++++++++++++++++++++++");
		memberService.insert(member);
		String msg = "恭喜你注册成功！";
		mav.addObject("msg", msg);
		mav.setViewName("member_login");
		return mav;
		
	}
	//会员登陆后主页
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
		modelAndView.addObject("popularPhone", productService.selectByCateId(5,8));
		modelAndView.addObject("popularPC", productService.selectByCateId(10,11,12));
		
		System.out.println( "=========================================="+productService.selectByCateId(10,12));
		modelAndView.setViewName("mng/index_mng");
		return modelAndView;
	}
	

}
