<%@page import="com.itwill.shop.dto.Notice"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	NoticeService noticeService = new NoticeService();
	List<Notice> notices =  noticeService.selectAll();
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<a href='product_insert_form.jsp'>[상품등록하기]</a>
</div>

<!-- include left<<카테고리>>Start -->
<div id="categoryList">
<jsp:include page="include_common_left.jsp"></jsp:include>
</div>
<!-- include left<<카테고리>>End -->
<div>
	<ul>
		
		
		<li><a href='product_detail.jsp?p_no=3'>[프라이팬1] 가격:5000원</a></li>
		
	</ul>
</div>
</body>
</html>