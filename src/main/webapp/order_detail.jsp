<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	/*	<< select by u_id and o_id>>
	 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	sUserId = "test5";
	String o_no = "17";
	Order order = new Order(Integer.parseInt(o_no),null,null,0,sUserId,null);
		
	OrderService orderService = new OrderService();
	//orderService.detail(order);
	order = orderService.oneOfOrderProductdetailByUserId(order);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function order_detail_form_submit() {
		document.order_detail_form.method = 'POST';
		document.order_detail_form.action = 'order_cancel_action.jsp';
		document.order_detail_form.submit();
	}
</script>

</head>
<body>

<h3>[ <%=order.getU_id() %>님의 주문번호<%=order.getO_no()%> 주문상세]</h1>
<hr>
<form name="order_detail_form" method="post">
	주문번호 <input type ='text'name='o_no' value='<%=order.getO_no()%>'><br>
	주문일자 <input type ='text'name='o_date' value='<%=order.getO_date()%>'><br>
	<hr>
	주문설명 <input type ='text'name='o_desc' value='<%=order.getO_desc() %>'><br>
	
	<% for(OrderItem orderItem : order.getOrderItemList()) { %>
	상품이름 <input type ='text' name='p_name' value='<%=orderItem.getProduct().getP_name() %>'><br>
	상품수량 <input type ='text' name='oi_qty' value='<%=orderItem.getOi_qty() %>'><br>
	상품 단일가격 <input type ='text' name='p_name' value='<%=new DecimalFormat("#,##0").format(orderItem.getProduct().getP_price()) %>'><br>
	상품이미지<img src="image/product/<%=orderItem.getProduct().getP_image()%>" width="40px" height="40px"><br>
	<br>
	상품 총 주문가격 <input type =' text'name='p_total_price' value='<%=new DecimalFormat("#,##0").format(orderItem.getProduct().getP_price()*orderItem.getOi_qty()) %>'><br>
	<hr>
	<% }%>
	최종 주문가격 <input type ='text'name='o_price' value='<%=new DecimalFormat("#,##0").format(order.getO_price())%>'><br>
</form>
<a href='javascript:order_detail_form_submit();'>해당주문 전체 환불요청</a>

</body>
</html>