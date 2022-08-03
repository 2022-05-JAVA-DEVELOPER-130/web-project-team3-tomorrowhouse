<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	/*	<< select by u_id and o_id>>
	 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	sUserId = null;
	String o_no = null;
	/*
	private int o_no;
	private String o_desc;	// orderItemList.get(1).getProduct.getP_name();
	private Date o_date;
	private int o_price;
	
	private String u_id;	
	
	private List<OrderItem> orderItemList=new ArrayList<OrderItem>();
	*/
	Order order = new Order(Integer.parseInt(o_no),null,null,0,sUserId,null);
		
	OrderService orderService = new OrderService();
	orderService.detail(order);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>[<%=%> 상세보기]</h1>
<hr>
상품번호 <input type ='text'name='p_no' value='<%=%>'><br>
상품이름 <input type ='text'name='p_name' value='<%=%>'><br>
상품가격 <input type ='text'name='p_price' value='<%=%>'><br>
상품이미지 <input type ='text'name='p_image' value='<%=%>'><br>
상품설명 <input type ='text'name='p_desc' value='<%=%>'><br>
상품클릭수 <input type ='text'name='p_click_count' value='<%=%>'><br>
상품카테고리 <input type ='text'name='category' value='<%= %>'><br>


	<a href='product_update_form.jsp?p_no=<%=%>'>[상품수정]</a>
	<a href='product_delete_action.jsp?no=<%=%>'>[상품삭제]</a>

</body>
</html>