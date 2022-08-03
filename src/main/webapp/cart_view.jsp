<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String sU_Id = "test2";
CartService cartService = new CartService();
List<CartItem> cartList = cartService.getCartList(sU_Id);	
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