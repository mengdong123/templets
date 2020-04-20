package com.lzx.service;

import java.util.List;

import com.lzx.entity.Address;
/**
 * adress业务层接口
 * @author 51019
 *
 */
public interface AddressService {
	
	//查询全部
	public List<Address> findAll();
	
	//根据id查询
	public Address findById(int id);
	
	//根据id删除
	public void deleteById(int id);
	
	//修改地址
	public void update();
	
	//增加地址
	public void insert(String contact,String mobile,String street);
	
	//设置默认地址
	public void editValue(int id);
	
	public List<Address> selectByUser(Integer mbr_id);
	

}
