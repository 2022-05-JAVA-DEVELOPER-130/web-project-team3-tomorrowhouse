<%@page import="com.itwill.shop.dto.qna.QnaException"%>
<%@page import="com.itwill.shop.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	Integer q_no = null;
	Integer pageno = null;
	try {
		q_no = Integer.valueOf(request.getParameter("q_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	if (q_no == null) {
		result = false;
		msg = "삭제실패";
	} else {
		try {
			QnaService.getInstance().removeQna(q_no);
			result = true;
			msg = "삭제성공";
		} catch (QnaException e) {
			result = false;
			msg = "삭제실패" + e.getMessage();
		}
	}
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='qna_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='qna_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>




