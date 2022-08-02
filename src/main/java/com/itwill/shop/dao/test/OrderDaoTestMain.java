package com.itwill.shop.dao.test;

import java.sql.Date;
import java.util.ArrayList;

import com.itwill.shop.dao.OrderDao;
import com.itwill.shop.dto.Order;
import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;



public class OrderDaoTestMain {

	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDao();

		/*
		 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
		 */
		Order findOrder = orderDao.oneOfOrderProductdetailByUserId(new Order(6, null, null, 0, "test1", null));
		System.out.println(findOrder);
		for (OrderItem orderItem : findOrder.getOrderItemList()) {
			System.out.println(orderItem);
		}
		
		/*
		 * 2. 고객1명(특정사용자)의 주문 전체 목록
		 */
		ArrayList<Order> orderList = orderDao.orderListByUserId(new Order(0, null, null, 0, "test1", null));
		for (Order order : orderList) {
			System.out.println(order);
		}
		
		/* <<미완성>>
		 * 3. test3 고객 주문 & 주문 상세 전체 목록 -> [어디에 필요하지?]
		 */
		
		/*
		 * 4.멤버1명(로그인상태)의 주문번호 4번의 주문 정보 -> [order_list.jsp]
		 */
		findOrder = orderDao.orderByOrderNo(new Order(4, null, null, 0, null, null));
		System.out.println(findOrder);
		
		/*
		 * 5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개) -> [order_detail.jsp]
		 */

		System.out.println("\n5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개) -> [order_detail.jsp]");
		ArrayList<OrderItem> orderItemList = orderDao.orderItemByOrderNo(new Order(3, null, null,0,"test3",null));
		for (OrderItem orderItem : orderItemList) {
			System.out.println(orderItem);
		}
		/* <<미완성>>
		 * 6.주문 & 주문 상세 전체 목록 (관리자)
		//select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;
		public final static String SELECT_ALL_ORDER_ORDERITEM_PRODUCT
			="select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no";
		
		 */
		
		//카트 -> 주문으로 옮겨올때에 관해서는 service에서 작성한다.
		/*<<단일주문건 생성에 해당 - 상품detail에서 주문시 사용>>
		7-1. 주문 생성(insert - orders) -> [order_create_action]
		insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');
		7-2. 주문 생성(insert - orderitem)
		insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
		 */
		
		System.out.println("\n7.상품detail에서 단일상품 주문");
		Order newOrder = new Order(0, null, null, 345000, "test6", new ArrayList<OrderItem>());
		newOrder.getOrderItemList().add(new OrderItem(0,7,0,new Product(11, null, 0, null, null, 0, null)));
		
		System.out.println(orderDao.create(newOrder));
		


	}

}
