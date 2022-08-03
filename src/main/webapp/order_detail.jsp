
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.dao.OrderDao"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*	<< select by u_id and o_id>>
	 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	//Order newOrder = new Order(o_no,null,null,0,sUserId,null);
	
	//OrderDao orderDao = new OrderDao();
	//Order order = orderDao.oneOfOrderProductdetailByUserId(new Order(7, null, null, 0, "test4", null));	

	//OrderService orderService = new OrderService();
	//Order order = orderService.oneOfOrderProductdetailByUserId(new Order(7, null, null, 0, "test4", null));
	Order newOrder = new Order(7, null, null, 0, "test4", null);
	
	OrderService orderService = new OrderService();
	
	Order order= new Order(); 
			order = orderService.oneOfOrderProductdetailByUserId(newOrder);
	
		/*********************** 500 오류 나는 중...........***********/	
			
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>[<%= order.getU_id() %>님의 주문번호 <%=order.getO_no() %> 상세보기]</h3>
<hr>

o_no <input type ='text'name='o_no' value='<%=order.getO_no()%>'><br>
o_desc <input type ='text'name='o_desc' value='<%=order.getO_desc()%>'><br>
o_date <input type ='text'name='o_date' value='<%=order.getO_date()%>'><br>
o_price <input type ='text'name='o_price' value='<%=order.getO_price()%>'><br>
u_id <input type ='text'name='u_id' value='<%=order.getU_id()%>'><br>





</body>
</html>