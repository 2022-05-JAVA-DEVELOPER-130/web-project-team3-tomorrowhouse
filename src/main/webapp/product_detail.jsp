<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

ProductService productService = new ProductService();
Product detailProduct = new Product();

/* 상품번호로 1개 출력 */
String noStr = request.getParameter("p_no");
detailProduct = productService.selectByNo(new Product(Integer.parseInt(noStr),null,0,null,null,0,null));


/* 이름으로 1개 출력 */
Product stringProduct = new Product();

String nameStr = request.getParameter("p_name");
stringProduct = productService.selectByName(new Product(0,nameStr,0,null,null,0,null));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<h3>[<%=detailProduct.getP_no()%> 상세보기(상품번호)]</h1>
<hr>
상품번호 <input type ='text'name='p_no' value='<%=detailProduct.getP_no()%>'><br>
상품이름 <input type ='text'name='p_name' value='<%=detailProduct.getP_name()%>'><br>
상품가격 <input type ='text'name='p_price' value='<%=detailProduct.getP_price()%>'><br>
상품이미지 <input type ='text'name='p_image' value='<%=detailProduct.getP_image()%>'><br>
상품설명 <input type ='text'name='p_desc' value='<%=detailProduct.getP_desc()%>'><br>
상품클릭수 <input type ='text'name='p_click_count' value='<%=detailProduct.getP_click_count()%>'><br>
상품카테고리 <input type ='text'name='category' value='<%=detailProduct.getCategory().getCg_no()%>'><br>
<br>
<br>
<h3>[<%=detailProduct.getP_name()%> 상세보기(상품이름)]</h1>
<hr>
번호: <%=detailProduct.getP_no()%><br>
이름: <%=detailProduct.getP_name()%><br>
가격: <%=detailProduct.getP_price()%><br>
이미지: <%=detailProduct.getP_image()%><br>
설명: <%=detailProduct.getP_desc()%><br>
클릭수: <%=detailProduct.getP_click_count()%><br>
카테고리: <%=detailProduct.getCategory().getCg_no()%><br>

</form>
</body>
</html>