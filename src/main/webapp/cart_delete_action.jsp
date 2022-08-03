<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String sU_Id = "test6";
if(sU_Id==null || sU_Id.equals("")) {
	 response.sendRedirect("cart_view.jsp");
	 return;
}

CartService cartService = new CartService();
cartService.deleteCartAll(sU_Id);
%>

