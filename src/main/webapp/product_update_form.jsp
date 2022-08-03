<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
 
request.setCharacterEncoding("UTF-8");

String noStr = request.getParameter("p_no");

if(noStr == null || noStr.equals("")) {
	 response.sendRedirect("address_main.jsp");
	 return;
}

ProductService productService = new ProductService();
Product product = productService.productSelectByNo(new Product(Integer.parseInt(noStr),null,0,null,null,0,null));

 %>    
<!DOCTYPE html>
<html>

<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>
<h3>[상품 수정하기]</h3><hr>

	<div>
	
	</div>
	<form method='post' action='product_update_action.jsp'>
		<input type='hidden' name='p_no' value='<%=product.getP_no()%>' >
		상품명<input type='text' name='p_name' value='<%=product.getP_name() %>' ><br>
		상품가격<input type='text' name='p_price' value='<%=product.getP_price()%>'><br>
		상품이미지<input type='text' name='p_image' value='<%=product.getP_image() %>'><br>
		상품설명<input type='text' name='p_desc' value='<%=product.getP_desc()%>'><br>
		상품카테고리<input type='text' name='category' value='<%=product.getCategory().getCg_no()%>'><br><br>  
		<input type='submit' value='상품수정'>
	</form>
</body>
</html>
