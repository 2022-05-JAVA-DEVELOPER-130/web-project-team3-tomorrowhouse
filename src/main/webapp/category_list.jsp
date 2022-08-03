<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.service.CategoryService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cgNoStr= request.getParameter("cg_no");
	if(cgNoStr==null || cgNoStr.equals("")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	ProductService productService = new ProductService();
	List<Product> productTableList = productService.selectAllByCgNo(Integer.parseInt(cgNoStr));
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리목록</title>
</head>
<body>
	<br>
		<li>상품/책상</li>
		<b><a href = 'product_list.jsp'>돌아가기</a></b>
	<br>
	<br>
		<ul>
		<% for(Product product : productTableList) { %>
		 
		<img src="image/product/<%=product.getP_image()%>" width="40px" height="40px">
		<li><a href='product_detail.jsp?p_no=<%=product.getP_no()%>'>[<%=product.getP_name()%>] 가격:<%=product.getP_price()%>원</a></li>
		<% } %>
		
		
		
	</ul>
	
</body>
</html>