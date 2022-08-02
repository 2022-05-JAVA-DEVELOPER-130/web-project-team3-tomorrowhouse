<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String noStr = request.getParameter("p_no");

ProductService productService = new ProductService();
Product detailProduct = new Product();
detailProduct = productService.selectByNo(Integer.parseInt(noStr));

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<h3>[<%=detailProduct.getP_name()%> 상세보기]</h1>
<hr>

상품번호 <input type ='text'name='상품번호' value='<%=detailProduct.getP_no()%>'><br>
상품이름 <input type ='text'name='상품이름' value='<%=detailProduct.getP_name()%>'><br>
상품가격 <input type ='text'name='상품가격' value='<%=detailProduct.getP_price()%>'><br>
상품이미지 <input type ='text'name='상품이미지' value='<%=detailProduct.getP_image()%>'><br>
상품설명 <input type ='text'name='상품번호' value='<%=detailProduct.getP_desc()%>'><br>
상품클릭수 <input type ='text'name='상품번호' value='<%=detailProduct.getP_click_count()%>'><br>
상품카테고리 <input type ='text'name='상품번호' value='<%=detailProduct.getCategory().getCg_no()%>'><br>

</form>
</body>
</html>