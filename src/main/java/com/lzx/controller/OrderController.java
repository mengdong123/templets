package com.lzx.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lzx.entity.Address;
import com.lzx.entity.Item;
import com.lzx.entity.Member;
import com.lzx.entity.Orders;
import com.lzx.entity.Product;
import com.lzx.service.AddressService;
import com.lzx.service.OrdersService;
import com.lzx.service.ProductService;

@Controller
@RequestMapping("/mng/order")
public class OrderController {

	@Autowired
	private OrdersService ordersService;
	@Autowired
	private ProductService productService;
	@Autowired
	private AddressService addressService;
	
	/**
	 * 查找当前用户对应类型的订单，类型为0查找全部
	 * @param session
	 * @param modelAndView
	 * @param orderType
	 * @return
	 */
	@RequestMapping("/list/{orderType:\\d+}")
	public ModelAndView orderList(HttpSession session, ModelAndView modelAndView, @PathVariable int orderType) {
		Member member = (Member) session.getAttribute("member");
		List<Orders> orders;
		if (orderType == 0) {
			orders = ordersService.selectByBuyer(member.getId());
		} else {
			orders = ordersService.selectByBuyerAndType(member.getId(),orderType);
		}
		modelAndView.addObject("orderType", orderType);
		modelAndView.addObject("orders", orders);
		modelAndView.setViewName("mng/index");
		return modelAndView;
	}
	
	/**
	 * 新增/更改订单备注信息
	 * @param id
	 * @param remark
	 * @param orderType
	 * @return
	 */
	@RequestMapping("/editRemark/{id:\\d+}")
	public String editRemark(@PathVariable int id, String remark, int orderType) {
		Orders order = ordersService.selectByPrimaryKey(id);
		order.setRemark(remark);
		ordersService.update(order);
		return "redirect:/mng/order/list/"+orderType;
	}
	
	/**
	 * 未付款前取消订单
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/delete/{id:\\d+}")
	public String deleteOrder(@PathVariable int id, HttpSession session) {
		ordersService.deleteByPrimaryKey(id);
		Member member = (Member) session.getAttribute("member");
		//更新个人中心左边栏信息
		Map<Integer, Integer> orderMap = ordersService.selectCountByBuyerAndType(member.getId());
		for (int i = 1; i <= 6; i++) {
			session.setAttribute("orderCount"+i, orderMap.get(i));
		}
		return "redirect:/mng/order/list/1";
	}
	
	/**
	 * 订单申请退款
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/drawback/{id:\\d+}")
	public String drawbackOrder(@PathVariable int id, HttpSession session, String reason, String reasonText) {
		Orders order = ordersService.selectByPrimaryKey(id);
		order.setStatus(5);
		order.setRemark("<h3>"+reason+"</h3>"+reasonText);
		ordersService.update(order);
		Member member = (Member) session.getAttribute("member");
		//更新个人中心左边栏信息
		Map<Integer, Integer> orderMap = ordersService.selectCountByBuyerAndType(member.getId());
		for (int i = 1; i <= 6; i++) {
			session.setAttribute("orderCount"+i, orderMap.get(i));
		}
		return "redirect:/mng/order/list/5";
	}
	
	/**
	 * 确认收货
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/receiving/{id:\\d+}")
	public String receiving(@PathVariable int id, HttpSession session) {
		Orders order = ordersService.selectByPrimaryKey(id);
		//存入订单完成时间、订单类型
		order.setStatus(4);
		//更新数据库中的数据
		ordersService.update(order);
		//更新个人中心左边栏信息
		Member member = (Member) session.getAttribute("member");
		Map<Integer, Integer> orderMap = ordersService.selectCountByBuyerAndType(member.getId());
		for (int i = 1; i <= 6; i++) {
			session.setAttribute("orderCount"+i, orderMap.get(i));
		}
		return "redirect:/mng/order/list/5";
	}
	
	/**
	 * 通过商品详情页购买
	 * @param id
	 * @param session
	 * @param count
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/buyNow/{id:\\d+}")
	public ModelAndView buyNow(@PathVariable int id, HttpSession session, int count, ModelAndView modelAndView) {
		Member member = (Member) session.getAttribute("member");
		List<Address> addresses = addressService.selectByUser(member.getId());
		modelAndView.addObject("address", addresses);
		
		Product product = productService.selectByPrimaryKey(id);
		Map<Product,Integer> map = new HashMap<Product,Integer>();
		map.put(product, count);
		modelAndView.addObject("map", map);
		modelAndView.setViewName("mng/order_confirm");
		return modelAndView;
	}
	
	@RequestMapping("/buyFormCart")
	public ModelAndView buyNow(HttpSession session, int[] check, int[] count, ModelAndView modelAndView) {
		System.out.println("check的长度是"+check);
		Member member = (Member) session.getAttribute("member");
		//
		List<Address> addresses = addressService.selectByUser(member.getId());
		System.out.println(addresses);
		modelAndView.addObject("address", addresses);
		//
		Map<Product,Integer> map = new HashMap<Product,Integer>();
		for (int i = 0; i < check.length; i++) {
			Product product = productService.selectByPrimaryKey(check[i]);
			map.put(product, count[i]);
		}
		
		modelAndView.addObject("map", map);
		modelAndView.setViewName("mng/order_confirm");
		return modelAndView;
	}
	
	/**
	 * 订单提交
	 * @param remark
	 * @param address_id
	 * @param check
	 * @param count
	 * @param session
	 * @return
	 */
	@RequestMapping("/orderSubmit")
	public String orderSubmit(String remark, int address_id, int[] check, int[] count, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		//生成item集合
		List<Item> items = new ArrayList<Item>();
		for (int i = 0; i < check.length; i++) {
			Item item = new Item();
			item.setProduct_id(check[i]);
			item.setAmount(count[i]);
			Product p = productService.selectByPrimaryKey(check[i]);
			item.setTotal_price(p.getPrice().multiply(new BigDecimal(count[i])));
			item.setPayment_price(p.getSale_price().multiply(new BigDecimal(count[i])));
			items.add(item);
		}
		
		//新建order对象
		Orders orders = new Orders();
		//生成订单号
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		String number = sdf.format(new Date())+member.getId();
		orders.setNumber(number);
		//存入用户信息
		orders.setBuyer_id(member.getId());
		//计算总数量、总价
		int orderAmount = 0;
		BigDecimal orderPrice = new BigDecimal(0);
		BigDecimal orderSalePrice = new BigDecimal(0);
		for (Item item : items) {
			orderAmount += item.getAmount();
			orderPrice = orderPrice.add(item.getTotal_price());
			orderSalePrice = orderSalePrice.add(item.getPayment_price());
		}
		//存入总数量、总价
		orders.setTotal_amount(orderAmount);
		orders.setTotal_price(orderPrice);
		orders.setPayment_price(orderSalePrice);
		orders.setStatus(1);
		//存入留言、地址id
		orders.setRemark(remark);
		orders.setAddress_id(address_id);
		
		//将order对象存入数据库
		ordersService.insert(orders);
		//查找order的id
		int orderId = ordersService.selectIdByNumber(number);
		//将id给到item并存入数据库
		for (Item item : items) {
			item.setOrder_id(orderId);
			ordersService.insertItem(item);
		}
		
		//更新个人中心左边栏信息
		Map<Integer, Integer> orderMap = ordersService.selectCountByBuyerAndType(member.getId());
		for (int i = 1; i <= 6; i++) {
			session.setAttribute("orderCount"+i, orderMap.get(i));
		}
		return "redirect:/mng/order/list/1";
	}
}
