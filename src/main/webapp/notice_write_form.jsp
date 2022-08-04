<%@page import="com.itwill.shop.dto.Notice"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%




%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>[공지사항 신규작성]</h3>
<hr>
<br>

<form method='post' action='notice_write_action.jsp'>
<input type ='hidden'name='n_no'>
제목 <input type ='text'name='n_title'><br>
내용 <input type ='text'name='n_content'><br>
공지일 <input type ="date" name='n_date'><br>
<br>
<input type='submit' value='공지사항 등록하기'>
</form>

</body>
</html>