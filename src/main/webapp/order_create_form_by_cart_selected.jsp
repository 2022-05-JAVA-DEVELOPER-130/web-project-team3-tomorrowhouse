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
//String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
/******************/
sUserId = "test5";
String[] cart_item_noStr_array = {"",""};
/******************/

//OrderService orderService = new OrderService();
CartService cartService = new CartService();

/* cart에서 선택주문 */


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


</body>
</html>