package com.lzx.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lzx.entity.Member;
/**
 * 登录过滤器
 * @author 51019
 *
 */
@WebFilter("/mng/*")
public class LoginFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1.判断用户是否登录，如果登录，就执行后面的逻辑，没登陆的话，返回到登陆页面
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession session = httpServletRequest.getSession();
	    Member member = (Member) session.getAttribute("member");
	    if(member!=null) {
	    	chain.doFilter(request, response);
	    }else {
	    	httpServletRequest.setAttribute("msg", "请先登录");
	    	httpServletRequest.getRequestDispatcher("/member_login.jsp").forward(request, response);
	    }
	    
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
