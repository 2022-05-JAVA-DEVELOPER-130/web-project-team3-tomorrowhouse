<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

request.setCharacterEncoding("UTF-8");
/*
if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
*/
/*
해결할거:Integer.parseInt(p_noStr) 가 안먹는거 and GET방식으로 전송되는거
*/

	int cart_qty= 2;
	//String p_noStr=request.getParameter("p_no");
	int p_no = 9;
	//Integer.parseInt(p_noStr)
	
	CartService cartService=new CartService();
	CartItem cartItem = new CartItem(0,cart_qty,sUserId,new Product(p_no, "", 0, "","", 0,new Category(0,null)));
	cartService.addCart(cartItem);
	
	response.sendRedirect("cart_view.jsp");

%>

