<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*  if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	*/
	
	
	String cgNoStr= request.getParameter("cg_no");
	ProductService productService = new ProductService();
	List<Product> productTableList = productService.selectAllByCgNo(Integer.parseInt(cgNoStr));

	
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책상목록</title>
</head>
<body>
	<br>
		<li>상품/책상</li>
	<br>
	<br>
		<ul>
		<% for(Product product : productTableList) { %>
		<li><a href='product_detail.jsp?p_no=<%=product.getP_no()%>'>
										 <b>[<%=product.getP_name()%>] 
								          가격:<%=product.getP_price()%>원 
										  <img width="100px" height="85px" src="image/<%=product.getP_image()%>" border="0">
		</a></li>
		
		<% } %>
	</ul>
	
</body>
</html>