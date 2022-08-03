<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	String sU_Id = "test6";
	String cart_qtyStr= "2";
	String p_noStr=request.getParameter("p_no");
	CartService cartService=new CartService();
	CartItem cartItem = new CartItem(0,Integer.parseInt(cart_qtyStr),sU_Id,new Product(Integer.parseInt(p_noStr), null, 0, null,null, 0,null));
	cartService.addCart(cartItem);
	
	response.sendRedirect("cart_view.jsp");
%>

