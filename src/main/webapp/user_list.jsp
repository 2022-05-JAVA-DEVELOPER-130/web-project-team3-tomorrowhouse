<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    UserInfoService userInfoService = new UserInfoService();
    
    List<UserInfo> userInfoList = userInfoService.findUserInfoList(); 
    out.println(userInfoList);
    
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