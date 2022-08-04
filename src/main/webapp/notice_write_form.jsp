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
<form>
<h3>[공지사항 신규작성]</h3>
<hr>
<input type ='hidden'name='n_no' value='n_no'>
제목 <input type ='text'name='n_title' value=''><br>
내용 <input type ='text'name='n_content' value=''><br>
공지일<input type='date' name='today' value='' ><br>

	<a href='notice_list.jsp'>[공지사항리스트]</a>
	<a href='notice_write_action.jsp'>[공지사항등록]</a>
</form>
</body>
</html>