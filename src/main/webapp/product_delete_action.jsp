<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String noStr = request.getParameter("p_no");

if(noStr==null || noStr.equals("")) {
	 response.sendRedirect("product_list.jsp");
	 return;
}

ProductService productService = new ProductService();
productService.deleteProduct(Integer.parseInt(noStr));

/*
p_no, String p_name, int p_price, String p_image, String p_desc, int p_click_count,
			Category category)
*/
response.sendRedirect("product_list.jsp");
%>