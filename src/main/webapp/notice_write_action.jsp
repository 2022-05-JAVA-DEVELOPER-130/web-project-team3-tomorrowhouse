<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="com.itwill.shop.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
    
<%
	/*  if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("notice_list.jsp");
		return;
	} */

	String title= request.getParameter("n_title");
	String content= request.getParameter("n_content");
		
	Notice newnotice = new Notice(0,title,content,null);
	NoticeService noticeService = new NoticeService();
	noticeService.insertNotice(newnotice);
	response.sendRedirect("notice_list.jsp");
%>
