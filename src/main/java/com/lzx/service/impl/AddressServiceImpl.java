package com.lzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzx.entity.Address;
import com.lzx.mapper.AddressMapper;
import com.lzx.service.AddressService;
/**
 * address业务层实现类
 * @author 51019
 *
 */
@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public List<Address> findAll() {
		
		return addressMapper.selectAll();
	}

	@Override
	public Address findById(int id) {
		return addressMapper.selectByPrimaryKey(id);
	}

	@Override
	public void deleteById(int id) {
		addressMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public List<Address> selectByUser(Integer mbr_id) {
		return addressMapper.selectByUser(mbr_id);
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(String contact,String mobile,String street) {
		addressMapper.insert(contact,mobile,street);
		
	}

	//设置默认地址
	@Override
	public void editValue(int id) {
		addressMapper.editValue(id);
		addressMapper.exclueValue(id);
		
	}


}
