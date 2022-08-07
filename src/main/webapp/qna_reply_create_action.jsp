<%@page import="com.itwill.shop.service.QnaService"%>
<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Board객체를 생성하고 입력된데이타를 읽어서 객체에저장
	Qna qna=new Qna();
	/*
	원글boardno
	*/
	qna.setQ_no(
			Integer.parseInt(request.getParameter("q_no")));
	/*
	답글 데이타
	*/
	qna.setQ_title(request.getParameter("q_title"));
	qna.setU_id(request.getParameter("u_id"));
	qna.setQ_content(request.getParameter("q_content"));
	QnaService.getInstance().createReply(qna);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("qna_list.jsp?pageno=%s",pageno));
	
%>