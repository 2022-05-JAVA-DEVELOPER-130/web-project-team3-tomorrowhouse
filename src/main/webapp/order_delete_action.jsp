<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>       
<%
       	if(request.getMethod().equalsIgnoreCase("GET")){
       		response.sendRedirect("order_list.jsp");
       		return;
       	}
       	String delete_order_noStr=request.getParameter("delete_order_no");
       	OrderService orderService=new OrderService();
       	
       	Order order = new Order(Integer.parseInt(delete_order_noStr),null,null,0,null,null);
       	orderService.hideOrder(order);
       	response.sendRedirect("order_list.jsp");
%>