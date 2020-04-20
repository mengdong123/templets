package com.lzx.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lzx.entity.Member;
import com.lzx.entity.Shopcar;
import com.lzx.service.ShopcarService;
import com.lzx.service.ShopcarService;
/**
 * 购物车控制器
 * @author 51019
 *
 */
@Controller
public class ShopcarController {
	
	@Autowired
	private ShopcarService shopcarService;
	
	/**
	 * 添加商品到购物车
	 * @param session
	 * @param id
	 * @param count
	 * @return
	 */
	@RequestMapping("/mng/addToShopCar/{id:\\d+}")
	public String addTo(HttpSession session, @PathVariable int id, int count) {
		Member member = (Member) session.getAttribute("member");
		//查找是否有对应商品
		System.out.println(member);
		Shopcar shopcar = shopcarService.selectOne(member.getId(), id);
		if(shopcar == null) {
			shopcar = new Shopcar();
			shopcar.setMember_id(member.getId());
			shopcar.setProduct_id(id);
			shopcar.setAmount(count);
			shopcarService.insert(shopcar);
		}else {
			int amount = shopcar.getAmount();
			shopcar.setAmount(amount+count);
			shopcarService.update(shopcar);
		}
		
		session.setAttribute("shopcar", shopcarService.selectByMember(member.getId()));
		//提示添加成功标记
		session.setAttribute("addMark", "fun();");
		return "redirect:/prod_detail/"+id;
	}
	
	/**
	 * 删除购物车中一件商品
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/mng/cart_delete/{id:\\d+}")
	public String deleteFormShopcar(HttpSession session, @PathVariable int id) {
		Member member = (Member) session.getAttribute("member");
		shopcarService.deleteByInfo(member.getId(), id);
		session.setAttribute("shopcar", shopcarService.selectByMember(member.getId()));
		return "redirect:/mng/cart_browse.jsp";
	}
	
	@RequestMapping("/mng/cart_plus/{id:\\d+}")
	public String shoppingcartPlus(HttpSession session, @PathVariable int id) {
		Member member = (Member) session.getAttribute("member");
		Shopcar shopcar = shopcarService.selectOne(member.getId(), id);
		shopcar.setAmount(shopcar.getAmount()+1);
		shopcarService.update(shopcar);
		session.setAttribute("shoppingcart", shopcarService.selectByMember(member.getId()));
		return "redirect:/mng/cart_browse.jsp";
	}
	
	@RequestMapping("/mng/cart_minus/{id:\\d+}")
	public String shopcarMinus(HttpSession session, @PathVariable int id) {
		Member member = (Member) session.getAttribute("member");
		Shopcar shopcar = shopcarService.selectOne(member.getId(), id);
		shopcar.setAmount(shopcar.getAmount()-1);
		shopcarService.update(shopcar);
		session.setAttribute("shopcar", shopcarService.selectByMember(member.getId()));
		return "redirect:/mng/cart_browse.jsp";
	}
}
