<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 

  
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
		상품명<input type='text' name='p_name' value='' ><br>
		상품가격<input type='text' name='p_price' value=''><br>
		상품이미지<input type='text' name='p_image' value=''><br>
		상품설명<input type='text' name='p_desc' value=''><br>
		상품카테고리<input type='text' name='category' value=''><br><br>  
		<input type='submit' value='상품수정'>
	</form>
</body>
</html>
