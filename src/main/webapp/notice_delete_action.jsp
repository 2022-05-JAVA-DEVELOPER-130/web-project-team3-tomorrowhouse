<%@page import="com.itwill.shop.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	 if(request.getMethod().equalsIgnoreCase("Get")){
		response.sendRedirect("notice_list.jsp");
		return;
	} 

	 String noStr = request.getParameter("n_no");
	 if(noStr == null || noStr.equals("")){
		 response.sendRedirect("notice_list.jsp");
			return;
	 }
	 NoticeService noticeService = new NoticeService();
	 noticeService.deleteNotice(Integer.parseInt(noStr));
	 response.sendRedirect("notice_list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>