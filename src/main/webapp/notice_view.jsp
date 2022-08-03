<%@page import="com.itwill.shop.dto.Notice"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

NoticeService noticeService =new NoticeService();
Notice noticeDetail =new Notice();

/* 공지사항번호로 1개 출력 */
String noStr = request.getParameter("n_no");
if(noStr==null || noStr.equals("")){
	response.sendRedirect("notice_list.jsp");
	return;
}

noticeDetail = noticeService.selectByNoNotice(Integer.parseInt(noStr));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<h3>[<%=noticeDetail.getN_title()%> 상세보기(상품번호)]</h1>
<hr>
<input type ='hidden'name='p_no' value='<%=noticeDetail.getN_no()%>'>
공지사항 <input type ='text'name='p_name' value='<%=noticeDetail.getN_title()%>'><br>
공지사항 내용 <input type ='text'name='p_price' value='<%=noticeDetail.getN_content()%>'><br>
공지일 <input type ='text'name='p_image' value='<%=noticeDetail.getN_date()%>'><br>

	<a href='notice_list.jsp'>[공지사항리스트]</a>
	<a href='notice_modify_form?p_no=<%=noticeDetail.getN_no()%>'>[공지사항수정]</a>
	<a href='notice_delete_action.jsp?p_no=<%=noticeDetail.getN_no()%>'>[공지사항삭제]</a>
</form>
</body>
</html>