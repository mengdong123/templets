package com.lzx.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 用户登陆后的操作
 * @author 51019
 *
 */
import org.springframework.web.servlet.ModelAndView;

import com.lzx.entity.Member;
import com.lzx.mapper.MemberMapper;
import com.lzx.service.MemberService;
import com.lzx.service.impl.MemberServiceImpl;
@Controller
@RequestMapping("/mng/member")
public class MngMemberController {
	@Autowired
	private MemberService memberService;
	/**
	 * 用户退出
	 * 1.从session中移除当前登录用户member
	 * 2.跳转到登陆页面
	 * @param mav
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit")
	public ModelAndView exit(ModelAndView mav,HttpSession session) {
		session.removeAttribute("member");
		mav.setViewName("member_login");
		return mav;
	}
	/**
	 * 用户修改个人信息
	 */
	@RequestMapping("/update/{id:\\d+}")
	public ModelAndView update(ModelAndView mav,@PathVariable int id,String nick_name,String real_name,String mobile,int gender,String email) {
		memberService.update(id,nick_name,real_name,mobile,gender,email);
		mav.setViewName("mng/index");
		return mav;
	}
	/**
	 * 修改密码
	 * 1.判断输入原密码是否正确
	 *  正确则进行修改密码，否则输入提示信息
	 *  2.修改密码后返回登录页面
	 */
	@RequestMapping("/updatepwd/{id:\\d+}")
	public ModelAndView updatePwd(ModelAndView mav,@PathVariable int id,String pwd,String newpwd,HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		System.out.println(member.getPwd());
		System.out.println(pwd+"==="+pwd.getClass().toString());
		if(pwd.equals(member.getPwd())) {
			memberService.updatePwd(id, newpwd);
			mav.addObject("msg", "密码修改成功，请重新登陆!");
			mav.setViewName("member_login");
		}else {
			mav.addObject("msg", "原密码输入错误!");
			mav.setViewName("mng/updatepwd");
		}
		return mav;
		
	}
	/**
	 * 查看及修改个人信息
	 * 
	 */
	@RequestMapping("/info/{id:\\d+}")
	public ModelAndView getInfo(ModelAndView mav,@PathVariable int id) {
		Member member = memberService.findById(id);
		mav.addObject("member", member);
		mav.setViewName("mng/profile");
		return mav;
	}

}
