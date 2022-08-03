<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>새상품 등록하기</h3>
<hr>
<br>

<form method='post' action='product_insert_action.jsp'>
<input type ='hidden'name='p_no'>
상품이름 <input type ='text'name='p_name'><br>
상품가격 <input type ='text'name='p_price'><br>
상품이미지 <input type ='text'name='p_image'><br>
상품설명 <input type ='text'name='p_desc'><br>
상품카테고리 <input type ='text'name='category'><br>
<br>
<input type='submit' value='상품등록하기'>
</form>

</body>
</html>