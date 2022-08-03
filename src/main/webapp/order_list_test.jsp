<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
	sUserId="test1";

	UserInfoService userInfoService = new UserInfoService();
	UserInfo userInfo = userInfoService.findUser(sUserId);
	
	/*
	 * 주문상세리스트(특정사용자)
	 */
	OrderService orderService = new OrderService();
	Order findOrder = new Order(0, null, null, 0, "test1",null);
	//(ArrayList)orderService.list_detail(new Order(0,null,null,0,sUserId,null));
	ArrayList<Order> orderNoList = orderService.orderNoListByUserId(findOrder);
	ArrayList<Order> orderList = orderService.orderListByUserId(findOrder);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>주문 내역</h3>
<%
for(Order orderNo : orderNoList){

	int o_no = orderNo.getO_no();
	for(Order order: orderList){
		if(o_no==order.getO_no()){
	


%>

 주문번호<input type ='text' name='o_no' value='<%= order.getO_no()%>'><br>
 상품 데이터가 없음....

<hr>
<%
		}
	}
} %>




</body>
</html>