<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

/* product_detail에서 직접주문 */
String p_noStr=
request.getParameter("p_no");
String p_qtyStr=
request.getParameter("p_qty");

/**********************/
sUserId = "test5";
p_noStr = "11";
p_qtyStr = "11";
/**********************/
/* 
Product product = new Product(Integer.parseInt(p_noStr), null, 0, null, null, Integer.parseInt(p_qtyStr), null);

Order order = new Order();
List<OrderItem> orderItemList = new ArrayList<OrderItem>();
orderItemList.add(new OrderItem(0,Integer.parseInt(p_qtyStr),0,product));
 */
OrderService orderService = new OrderService();
int result =orderService.create(sUserId,Integer.parseInt(p_noStr),Integer.parseInt(p_qtyStr));

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