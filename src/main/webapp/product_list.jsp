<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

ProductService productService = new ProductService();
List<Product> productList = productService.productSelectAll();
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>[상품리스트]</h3>
<hr>

<div>
	<a href='product_insert_form.jsp'>[상품등록하기]</a>
</div>

<!-- include left<<카테고리>>Start -->
<div id="categoryList">
<jsp:include page="include_common_left.jsp"></jsp:include>
</div>
<!-- include left<<카테고리>>End -->

<div>
	<ul>
		<% for(Product product : productList) { %>
		<img src="iamge/product/<%=product%>" width="40px" height="40px">
		<li><a href='product_detail.jsp?p_no=<%=product.getP_no()%>'>[<%=product.getP_name()%>] 가격:<%=product.getP_price()%>원</a></li>
		<% } %>
	</ul>
</div>
</body>
</html>