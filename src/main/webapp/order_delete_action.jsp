<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>       
<%
       /*
       1.주문번호받기
       2.주문삭제
         	- 주문상세테이블 delete
         	- 주문테이블 delete
       */
       	if(request.getMethod().equalsIgnoreCase("GET")){
       		response.sendRedirect("order_list.jsp");
       		return;
       	}
       	String cancel_order_noStr=request.getParameter("cancel_order_no");
       	OrderService orderService=new OrderService();
       	/*
       		private int o_no;
		private String o_desc;	// orderItemList.get(1).getProduct.getP_name();
		private Date o_date;
		private int o_price;
		
		private String u_id;	
		
		private List<OrderItem> orderItemList=new ArrayList<OrderItem>();
       	*/
       	
       	Order order = new Order(Integer.parseInt(cancel_order_noStr),null,null,0,null,null);
       	orderService.cancelOrder(order);
       	response.sendRedirect("order_list.jsp");
%>