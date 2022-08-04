<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
//String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
/******************/
sUserId = "test2";
String[] cart_item_noStr_array = {"22"};
/******************/
UserInfoService userInfoService = new UserInfoService();
UserInfo userInfo = userInfoService.findUser(sUserId);

OrderService orderService = new OrderService();

/* cart에서 선택주문 */
orderService.createOrderByCartSelect(sUserId, cart_item_noStr_array);
//response.sendRedirect("order_list.jsp");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>