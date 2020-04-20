package com.lzx.mapper;

import com.lzx.entity.Member;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * member持久层接口
 * 
 * @author 51019
 *
 */
public interface MemberMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Member record);

	Member selectByPrimaryKey(Integer id);

	List<Member> selectAll();

	//用户资料修改
	public void updateByPrimaryKey(@Param("id") int id,@Param("nick_name")String nick_name,@Param("real_name")String real_name,@Param("mobile")String mobile,@Param("gender")int gender,@Param("email")String email);

	// 查询总条数
	public Integer findCount();

	// 分页查找
	public List<Member> findByPaper(@Param("num") int num, @Param("size") int size);

	// 用户登录
	public Member login(@Param("mobile") String mobile, @Param("pwd") String pwd);

	// 修改密码
	public void updatePwd(@Param("id") int id,@Param("pwd") String pwd);

}