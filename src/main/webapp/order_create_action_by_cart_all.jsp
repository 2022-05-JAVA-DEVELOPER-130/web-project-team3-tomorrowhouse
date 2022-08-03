<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
sUserId = "test3";

OrderService orderService = new OrderService();
int result = orderService.createOrderByCart(sUserId);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%=
result
%>


</body>
</html>