<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
 

 %>    
<!DOCTYPE html>
<html>

<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>
<h3>[상품 검색하기]</h3><hr>

	<div>
	
	</div>
	<form method='get' action='product_serch_action.jsp'>
			검색 <input type='text' name='keyword'  placeholder="검색어를입력하세요"' > <input type='submit' value='검색'>
	</form>
</body>
</html>
