<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

sUserId = "test5";

//OrderService orderService = new OrderService();
CartService cartService = new CartService();

ArrayList<CartItem> cartItemList = (ArrayList)cartService.getCartList(sUserId);

UserInfoService userInfoService = new UserInfoService();
UserInfo userInfo = userInfoService.findUser(sUserId);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>고객정보</h3>
 아이디<input type ='text' name='u_id' value='<%= userInfo.getU_id()%>'><br>
 이름<input type ='text' name='u_name' value='<%= userInfo.getU_name()%>'><br>
 이메일<input type ='text' name='u_email' value='<%= userInfo.getU_email()%>'><br>
 주소<input type ='text' name='u_address' value='<%= userInfo.getU_address()%>'><br>
 전화번호<input type ='text' name='u_phone' value='<%= userInfo.getU_phone()%>'><br>

<hr>
<h3>카트 상품 정보</h3>
<%

int total_cart_price =0;
for(CartItem cartItem: cartItemList){
	total_cart_price += cartItem.getProduct().getP_price() * cartItem.getC_qty();
%>
 카트번호<input type ='text' name='c_no' value='<%= cartItem.getC_no()%>'><br>

 상품번호<input type ='text' name='p_no' value='<%= cartItem.getProduct().getP_no()%>'><br>
 상품이름<input type ='text' name='p_name' value='<%= cartItem.getProduct().getP_name()%>'><br>
 상품 총 가격<input type ='text' name='o_price' value='<%= cartItem.getProduct().getP_price()* cartItem.getC_qty()%>'><br>
 상품이미지<img src="image/product/<%=cartItem.getProduct().getP_image()%>" width="40px" height="40px"><br>

<hr>
<%	} %>

total_cart_price = 
<%=new DecimalFormat("#,##0").format(total_cart_price) %>

</body>
</html>