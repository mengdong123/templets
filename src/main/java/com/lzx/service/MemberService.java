package com.lzx.service;

import java.util.List;

import com.lzx.entity.Member;
import com.lzx.entity.common.Page;

/**
 * 会员业务层接口
 * @author 51019
 *
 */
public interface MemberService {
	
	//添加会员
	public void insert(Member member);
	
	//根据id删除会员
	public void delete(Integer id);
	
	//更新会员
	public void update(int id,String nick_name,String real_name,String mobile,int gender,String email);
	
	//根据id进行会员查找
	public Member findById(Integer id);
	
	//查找所有会员列表
	public List<Member> findAll();
	
	
	
	//用户登录
	public Member login(String mobile,String pwd);
	
	//修改密码
	public void updatePwd(int id,String pwd);

}
