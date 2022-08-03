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

<h3>[장바구니리스트]</h3>
<hr>

<div>
	<ul>
		<% for(CartItem cartItem : cartList) { %>
		<li>
			<img src="iamge/product/<%=cartItem.getProduct().getP_image()%>" width="40px" height="40px">
			[<%=cartItem.getProduct().getP_name()%>] 
			수량:<%=cartItem.getC_qty()%>개
			가격:<%=cartItem.getProduct().getP_price() * cartItem.getC_qty() %> 원
			</li>
		<% } %>
	</ul>
</div>

</body>
</html>