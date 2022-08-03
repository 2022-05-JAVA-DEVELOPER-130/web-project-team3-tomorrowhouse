package com.itwill.shop.service;

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
	public Order detail(Order order) throws Exception{
		return orderDao.oneOfOrderProductdetailByUserId(order);
	}
	
	
}
