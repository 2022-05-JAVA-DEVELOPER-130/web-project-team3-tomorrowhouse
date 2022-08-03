package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dao.OrderDao;
import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Order;

public class OrderService {
	
	private OrderDao orderDao;
	private CartDao cartDao;
	private ProductDao productDao;

	/* ------ order select------ */
	/*
	 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	
	public Order oneOfOrderProductdetailByUserId(Order order) throws Exception {
		return orderDao.oneOfOrderProductdetailByUserId(order);
	}
	
	/*
	 * 주문상세리스트(특정사용자)
	 */
	public List<Order> list_detail(Order order) throws Exception{
		return orderDao.list_detail(order);
	}
	
	
	
	
	
	
	
	
	
	/************** 소진이 자리 ********************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
