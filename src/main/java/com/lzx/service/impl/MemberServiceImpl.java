package com.lzx.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Member;
import com.lzx.entity.common.Page;
import com.lzx.mapper.MemberMapper;
import com.lzx.service.MemberService;

/**
 * 会员业务层实现类
 * @author 51019
 *
 */
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	@Override
	public void insert(Member member) {
		System.out.println(member);
		memberMapper.insert(member);
	}

	@Override
	public void delete(Integer id) {
		memberMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void update(int id,String nick_name,String real_name,String mobile,int gender,String email) {
		memberMapper.updateByPrimaryKey(id,nick_name,real_name,mobile,gender,email);
		
	}

	@Override
	public Member findById(Integer id) {
		Member member = memberMapper.selectByPrimaryKey(id);
		return member;
	}

	@Override
	public List<Member> findAll() {
		List list =memberMapper.selectAll();
		return list;
	}

	//用户登录
    @Override
	public Member login(String mobile, String pwd) {
		return memberMapper.login(mobile, pwd);
	}

    //修改密码
	@Override
	public void updatePwd(int id, String pwd) {
		memberMapper.updatePwd(id, pwd);
		
	}
	

}
