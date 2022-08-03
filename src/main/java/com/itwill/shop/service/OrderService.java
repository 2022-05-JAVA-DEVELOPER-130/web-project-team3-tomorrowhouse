package com.itwill.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dao.OrderDao;
import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Order;

public class OrderService {
	
	private OrderDao orderDao;
	private CartDao cartDao;
	private ProductDao productDao;
	
	public OrderService() throws Exception {
		orderDao = new OrderDao();
		cartDao = new CartDao();
		productDao = new ProductDao();
	}
	
	/* ------ order select------ */
	/*
	 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	public Order oneOfOrderProductdetailByUserId(Order order) throws Exception {
		return orderDao.oneOfOrderProductdetailByUserId(order);
	}
	
	/*
	 * 주문상세리스트(특정사용자) --- JSP에서 실행안됨...
	 */
	public List<Order> list_detail(Order order) throws Exception{
		return orderDao.list_detail(order);
	}
	
	public ArrayList<Order> orderNoListByUserId(Order order) throws Exception{
		return orderDao.orderNoListByUserId(order);
	}
	/*
	 * 2. 고객1명(특정사용자)의 주문 전체 목록
	 */
	public ArrayList<Order> orderListByUserId(Order order) throws Exception {
		return orderDao.orderListByUserId(order);
	}
	
	/* ------ order insert------ */
	
	public int create(Order order) throws Exception {
		return orderDao.create(order);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/************** 소진이 자리 ********************************************************/
	
	
	
}
