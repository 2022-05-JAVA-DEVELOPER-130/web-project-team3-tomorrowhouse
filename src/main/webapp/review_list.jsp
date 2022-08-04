<%@page import="com.itwill.shop.dto.ReviewListPageMakerDto"%>
<%@page import="com.itwill.shop.common.PageInputDto"%>
<%@page import="com.itwill.shop.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="login_check.jspf"%>  
<%!
/* 댓글이 없어서 필요없음
public String getTitleString(Review review) {
		StringBuilder title = new StringBuilder(128);
		String t = review.getR_title()();
		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입
		
		for (int i = 0; i < review.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		if (review.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
}
*/
%>

<%
//1.요청페이지번호	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}	

//게시물조회

//ReviewListPageMakerDto boardListPage 
//	=new Service().findBoardList(Integer.parseInt(pageno));
%>
