<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
/* ------ order cancel------ */

String o_noStr=
request.getParameter("o_no");

/**********************/
sUserId = "test5";
//o_noStr = "3";
/**********************/

Order order = new Order(Integer.parseInt(o_noStr), null, null, 0,null , null);
OrderService orderService = new OrderService();
orderService.cancelOrder(order);


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>