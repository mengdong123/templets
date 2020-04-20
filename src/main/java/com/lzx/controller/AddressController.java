package com.lzx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.entity.Address;
import com.lzx.service.AddressService;

/**
 * address控制器
 * @author 51019
 *
 */
@Controller
@RequestMapping("/mng/address")
public class AddressController {

	@Autowired
	private AddressService addressService;
	//查询所有的地址，将其展现在jsp页面
	@RequestMapping("/list")
	public ModelAndView findAll(ModelAndView mav) {
		List<Address> list = addressService.findAll();
		System.out.println(list);
		mav.addObject("list", list);
		mav.setViewName("mng/address/list");
		return mav;
		
	}
	//编辑address
	@RequestMapping("/edit/{id:\\d+}")
	public ModelAndView editAddress(ModelAndView mav,@PathVariable int id) {
		Address editAddress = addressService.findById(id);
		System.out.println(editAddress);
		mav.addObject("editAddress", editAddress);
		mav.setViewName("mng/address/edit");
		return mav;
	}
	
	//增加地址
	@RequestMapping("/insert")
	public String addAddress(String contact,String mobile,String street) {
		addressService.insert(contact,mobile,street);
		return "redirect:/mng/address/list";
	}
	//删除地址
	@RequestMapping("/delete/{id:\\d+}")
	public String delete(@PathVariable int id) {
		addressService.deleteById(id);
		return "redirect:/mng/address/list";
	}
	//设置默认地址
	@RequestMapping("/editvalue/{id:\\d+}")
	public String editValue(@PathVariable int id) {
		addressService.editValue(id);
		return "redirect:/mng/address/list";
	}
}
