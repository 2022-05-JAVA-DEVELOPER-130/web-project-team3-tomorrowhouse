<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
sUserId = "test2";
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
	
	
	/*
	 * checkbox에 선택된 cart_item을 Count
	 */
	function cart_item_select_count() {
		<!--cart_item 체크박스-->
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
	
		<!--cart_item 체크박스 선택된 갯수 count-->
		var cart_item_check_selected_count=0;
		
		<!-- cart_view_form(추가내용 전부 hidden)에 체크박스 선택된 갯수 hidden으로 HTML문장 삽입-->
		document.cart_view_form.innerHTML ='';
		document.cart_view_form.innerHTML +="<input type='hidden' name='buyType'>";
		
		var total_order_price=0;
		
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				<!-- 체크박스가 선택되어있다면-->
					if (cart_item_no_check_list.item(i).checked == true) {
						document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"+ cart_item_no_check_list.item(i).value + "'>";
						var updateFormId='cart_update_form_'+ cart_item_no_check_list.item(i).value;
						var cart_qty=document.getElementById(updateFormId).c_qty.value;
						var cart_product_unit_price=document.getElementById(updateFormId).cart_product_unit_price.value;
						total_order_price += cart_qty * cart_product_unit_price;
						cart_item_check_selected_count++;
					}
			}
		document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
		document.getElementById('total_order_price').innerHTML = total_order_price.toLocaleString();
	}
	/*
	 * 선택된 상품들 주문하기 
	 */
	function cart_view_form_select_submit() {
		
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
		
		var isChecked = false;
		
		for (var i = 0; i < cart_item_no_check_list.length; i++) {
			if (cart_item_no_check_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('제품을선택해주세요');
	
			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}

</script>


</head>
<body>
	<form name="cart_view_form" style="margin: 0">
				<input type="hidden" name="buyType">
	</form>
	
	<h3>[장바구니리스트]</h3>
	<hr>
	
		<div>

			

			<!-- cart Item 보여주기 (시작)-->
			<%
			int total_cart_price = 0;
			for (CartItem cartItem : cartList) {
				total_cart_price += cartItem.getProduct().getP_price() * cartItem.getC_qty();
			%>
			<input type='hidden' name='c_no' value='<%=cartItem.getC_no()%>'>

			<input type='checkbox' name='cart_item_no_check'
				onchange='cart_item_select_count();'
				value='<%=cartItem.getC_no()%>' checked="checked"> 상품이름<input
				type="text" readonly="readonly" name="c_qty"
				value="<%=cartItem.getProduct().getP_name()%>"><br>

			상품image<img
				src="image/product/<%=cartItem.getProduct().getP_image()%>"
				width="40px" height="40px"> <br> <br> 상품수량<input
				type="text" readonly="readonly" name="c_qty"
				value="<%=cartItem.getC_qty()%>"><br>

			<form  method="post"
				id="cart_update_form_<%=cartItem.getC_no()%>">
				<input type="hidden" name="cart_no" value="<%=cartItem.getC_no()%>">
				<input type="button" value="-"
					onclick="changeNumber('-','cart_update_form_<%=cartItem.getC_no()%>');" />

				<input type="text" readonly="readonly" size="2"
					style="text-align: center; width: 15%" name="cart_qty"
					value="<%=cartItem.getC_qty()%>"> <input type="button"
					value="+"
					onclick="changeNumber('+','cart_update_form_<%=cartItem.getC_no()%>');" />

				<input type="hidden" name="cart_product_unit_price"
					value="<%=cartItem.getProduct().getP_price()%>" />
			</form>

			<input type="hidden" name="cart_product_unit_price"
				value="<%=cartItem.getProduct().getP_price()%>"><br> <a
				href='cart_delete_item_action.jsp?c_no=<%=cartItem.getC_no()%>'>[상품삭제]</a><br>

			<br>

			<%
			}
			%>
			<!-- cart Item 보여주기 (끝) -->

			<br>
			<hr>
			총주문금액 : <span id="total_order_price"><%=new DecimalFormat("#,##0").format(total_cart_price)%></span>
			원 카트 총 가격: <input type='text' id='total_order_price'
				name='total_order_price'
				value='<%=new DecimalFormat("#,##0").format(total_cart_price)%>'>
			<br>
		</div>
	</form>
	<a href='cart_delete_action.jsp?u_id=<%=sUserId%>'>[상품전체삭제]</a>
	<br>

	<a href='javascript:cart_view_form_order_submit()'> 총 <span
		id="cart_item_select_count"></span> 개 주문하기[전체주문]
	</a>
	<br>


	<%
	if (cartList.size() >= 1) {
	%>
	<a href="javascript:cart_view_form_select_submit();"> 총 <span
		id="+"></span>개 주문하기[주문폼] <%
	}
	%>
</body>
</html>