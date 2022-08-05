<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%

%>



<ul>
	<li><a href="product_list.jsp">전체 상품</a></li>
	<li><a href="category_list.jsp?cg_no=1">선반 제품</a></li>
	<li><a href="category_list.jsp?cg_no=2">가구 제품</a></li>
	<li><a href="category_list.jsp?cg_no=3">가전 제품</a></li>
	<li><a href="category_list.jsp?cg_no=4">조명 제품</a></li>
	<li><a href="category_list.jsp?cg_no=5">주방 용품</a></li>
	<li><a href=""></a></li>
	<li><a href=""></a></li>
	
	<li><a href="notice_list.jsp">공지 게시판</a></li>
	<li><a href="qna_list.jsp">문의 게시판</a></li>
	<li><a href="review_list.jsp">리뷰 게시판</a></li>

</ul>