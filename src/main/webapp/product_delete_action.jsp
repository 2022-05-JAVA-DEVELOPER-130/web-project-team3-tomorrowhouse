<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

String noStr = request.getParameter("p_no");

ProductService productService = new ProductService();
//productService.deleteProduct(new Product(Integer.parseInt(noStr)), null, 0, null, null, 0, new Category(0 ,null));



%>