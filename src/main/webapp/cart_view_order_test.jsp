<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

CartService cartService = new CartService();
List<CartItem> cartList = cartService.getCartList(sUserId);	

/*
	private int c_no;
	private int c_qty;
	private String u_id;// FK
	private Product product;
*/

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	/*
	 * cart에서 전체주문
	 */
	
	function cart_view_form_order_submit(){
		document.cart_view_form.method='POST';
		//document.cart_view_form.buyType.value='cart';
		document.cart_view_form.action='order_create_form.jsp';
		document.cart_view_form.submit();
	}

</script>


</head>
<body>

<h3>[장바구니리스트]</h3>
<hr>
<form>
<div>

	<form name="cart_view_form" style="margin:0">
		<input type="hidden" name="buyType">
	</form>

			<!-- cart Item 보여주기 (시작)-->
			<%
			int total_cart_price=0;
			for(CartItem cartItem : cartList) { 
			total_cart_price += cartItem.getProduct().getP_price() * cartItem.getC_qty();
			
			%>
			<input type ='hidden' name='c_no' value='<%= cartItem.getC_no()%>'>
			
			<input type='checkbox' name='cart_item_no_check' onchange='cart_item_select_count();'
					value='<%= cartItem.getC_no()%>' checked="checked">
			
			상품이름<input type="text" readonly="readonly"  name="c_qty" value="<%=cartItem.getProduct().getP_name()%>"><br>
			
			상품image<img src="image/product/<%=cartItem.getProduct().getP_image()%>" width="40px" height="40px">
				
				
			<br>	
			<br>
			상품수량<input type="text" readonly="readonly"  name="c_qty" value="<%=cartItem.getC_qty()%>"><br>
			
				<form action="cart_update_item_action.jsp" method="post" id="cart_update_form_<%=cartItem.getC_no()%>">
													<input type="hidden" name="cart_no" value="<%=cartItem.getC_no()%>">
														<input type="button" value="-" onclick="changeNumber('-','cart_update_form_<%=cartItem.getC_no()%>');"/>
														
													<input type="text" readonly="readonly" size="2"
														style="text-align: center; width: 15%" name="cart_qty"
														value="<%=cartItem.getC_qty()%>">
														<input type="button" value="+" onclick="changeNumber('+','cart_update_form_<%=cartItem.getC_no()%>');"/>
														
													<input type="hidden" name="cart_product_unit_price" value="<%=cartItem.getProduct().getP_price()%>"/>
				</form>
				
			<input type="hidden" name="cart_product_unit_price" value="<%=cartItem.getProduct().getP_price()%>"><br>	
			
			<a href='cart_delete_item_action.jsp?c_no=<%=cartItem.getC_no()%>'>[상품삭제]</a><br>
			
			<br>	
				
			<% } %>
			<!-- cart Item 보여주기 (끝) -->
	
	<br><hr>
	총주문금액 : <span id="total_order_price"><%=new DecimalFormat("#,##0").format(total_cart_price)%></span> 원
	
	카트 총 가격: <input type='text' id='total_order_price' name='total_order_price' value='<%=new DecimalFormat("#,##0").format(total_cart_price)%>'> 
	<br>
</div>
</form>
<a href= 'cart_delete_action.jsp?u_id=<%=sUserId%>'>[상품전체삭제]</a>
<br>

<a href= 'javascript:cart_view_form_order_submit()'> 총 <span id="cart_item_select_count"></span> 개 주문하기[전체주문]</a> <br>


<% if (cartList.size() >= 1) { %>
	<a href="javascript:cart_view_form_select_submit();" > 총 <span id="+"></span>개 주문하기[주문폼]
<% } %>


							
</body>
</html>