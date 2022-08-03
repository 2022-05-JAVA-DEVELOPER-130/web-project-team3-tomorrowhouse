package com.itwill.shop.service.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dao.OrderDao;
import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Order;
import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.service.OrderService;

public class OrderServiceTestMain {

	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDao();
		ProductDao productDao = new ProductDao();
		CartDao cartDao = new CartDao();
		OrderService orderService = new OrderService();
		
		
		/***** order_list *******/
		
		Order order = new Order(0, null, null, 0, "test1", null);

		// System.out.println(orderDao.list_detail(order));
		ArrayList<Order> orderNoList = orderService.orderNoListByUserId(order);
		ArrayList<Order> orderList = orderService.orderListByUserId(order);
		System.out.println(orderList);

		for (Order orderNo : orderNoList) {

			int o_no = orderNo.getO_no();
			for (Order newOrder : orderList) {
				if (o_no == newOrder.getO_no()) {

					System.out.println(newOrder.getO_no());
					//상품이름이 없음..
					//System.out.println(newOrder.getOrderItemList().get(0).getProduct().getP_name());

				}
			}
		}
		
		/* ------ order insert------ */
		//작성중
		/*
		 * cart에서 전체주문
		 */
		System.out.println(orderService.createOrderByCart("test5"));
		

	}

}
