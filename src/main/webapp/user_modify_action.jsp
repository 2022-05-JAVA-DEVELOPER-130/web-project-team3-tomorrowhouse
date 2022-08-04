<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	sUserId="test2";
	
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_view.jsp");
		return;
	}
try{
	//request.setCharacterEncoding("UTF-8");
	String u_name=request.getParameter("u_name");
	String u_pw=request.getParameter("u_pw");
	String u_email=request.getParameter("u_email");
	String u_address=request.getParameter("u_address");
	String u_phone=request.getParameter("u_phone");
	UserInfo userInfo = new UserInfo(sUserId,u_name,u_pw,u_email,u_address,u_phone);
	UserInfoService userInfoService=new UserInfoService();
	
		
	int updateRowCont=userInfoService.update(userInfo);
	
	response.sendRedirect("user_view.jsp");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("product_list.jsp");
}
%>