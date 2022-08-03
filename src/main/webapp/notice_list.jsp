
<%@page import="com.itwill.shop.dto.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	NoticeService noticeService = new NoticeService();
	List<Notice> notices = noticeService.selectAll();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<h1>[공지리스트]</h1><hr>
<div>
	<a href=''>[메인]</a>
	<a href=''>[주소록쓰기폼]</a>
</div>
<div>
	<ul>
		
		<%for(Notice notice : notices) { %>
		<li><a href='notice_view.jsp?n_no=1'>[1]공지1</a></li>
		<% } %>
	
	</ul>
</div>
</body>
</html>