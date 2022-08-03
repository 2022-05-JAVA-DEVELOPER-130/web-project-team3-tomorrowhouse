<%@page import="com.itwill.shop.service.CartService"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String sUserId = null;

//OrderService orderService = new OrderService();
CartService cartService = new CartService();


cartService.getCartList(sUserId);


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