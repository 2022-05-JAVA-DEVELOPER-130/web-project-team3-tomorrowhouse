<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

ProductService productService = new ProductService();
List<Product> productList = productService.selectAll();
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>

<h3>[상품리스트]</h3>
<hr>

<%--
<% for(Product product : productList) { %>
상품번호 <input type ='text'name='상품번호' value='<%=product.getP_no()%>'><br>
상품이름 <input type ='text'name='상품이름' value='<%=product.getP_name()%>'><br>
상품가격 <input type ='text'name='상품가격' value='<%=product.getP_price()%>'><br>
상품이미지 <input type ='text'name='상품이미지' value='<%=product.getP_image()%>'><br>
상품설명 <input type ='text'name='상품번호' value='<%=product.getP_desc()%>'><br>
상품클릭수 <input type ='text'name='상품번호' value='<%=product.getP_click_count()%>'><br>
상품카테고리 <input type ='text'name='상품번호' value='<%=product.getCategory().getCg_no()%>'><br>
<hr>
<%}%>
 --%>

<div>
	<ul>
		<% for(Product product : productList) { %>
		<li><a href='product_detail.jsp?p_no=<%=product.getP_no()%>'>[<%=product.getP_name()%>] 가격:<%=product.getP_price()%>원</a></li>
		<% } %>
	</ul>
</div>
</body>
</html>