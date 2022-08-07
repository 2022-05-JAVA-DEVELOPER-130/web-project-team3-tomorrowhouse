<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@page import="com.itwill.shop.service.QnaService"%>
<%@page import="com.itwill.shop.dto.qna.QnaListPageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

%>

<%
	String pageno=request.getParameter("pageno");
	if(pageno==null||pageno.equals("")){
		pageno="1";
	}	
	
	QnaListPageMaker qnaListPage 
		= new QnaService().findQnaList(Integer.parseInt(pageno));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function qnaCreate() {
		location.href = "qna_write_form.jsp";
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->

			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>문의사항-리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">♠
										총 <font color="#FF0000"><%=qnaListPage.totRecordCount%></font>
										건 | 현재페이지( <font color="#FF0000"><%=qnaListPage.pageMaker.getCurPage()%></font>
										/ <font color="#0000FF"><%=qnaListPage.pageMaker.getTotPage()%></font>
										)
									</td>
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제  목</td>
										<td width=80 align=center bgcolor="E6ECDE">작성자</td>
										<td width=80 align=center bgcolor="E6ECDE">작성일</td>
										<td width=30 align=center bgcolor="E6ECDE">조회수</td>
										
									</tr>
									
									<%
										for (Qna qna : qnaListPage.itemList ){
									%>
									<tr>
										<td width=280 align=center bgcolor="ffffff">
										<a href='qna_view.jsp?q_no=<%=qna.getQ_no() %>&pageno=<%=qnaListPage.pageMaker.getCurPage()%>'>
										<%=qna.getQ_title() %>	
										</a>
										</td>
										<td width=80 align=center bgcolor="ffffff"><%=qna.getU_id()%>
										</td>
										<td width=80 align=center bgcolor="ffffff">
											<%=qna.getQ_date()%>
										</td>
										<td width=30 align=center bgcolor="ffffff">
											<%=qna.getQ_readcount()%>
										</td>
									</tr>
									<!-- 
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10"><a
											href='board_view.jsp?boardno=532&pageno=6'>게시판타이틀514</a></td>
										<td width=120 align=center bgcolor="ffffff">김경호514</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10">2014-12-23
										</td>
										<td width=70 align=center bgcolor="ffffff">0</td>
									</tr>
									 -->
									<%
										}
									%>
								</table>
								<!-- /list -->
							</form> <br>
			<!-- 			board 참고 필요! -->
							 <table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     			
							     			<%if(qnaListPage.pageMaker.getPrevGroupStartPage()>0) {%>  
										    <a href="./qna_list.jsp?pageno=1">◀◀</a>&nbsp;
										     <%}%>
										 	 <%if(qnaListPage.pageMaker.getPrevPage()>0) {%> 
											<a href="./qna_list.jsp?pageno=<%=qnaListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										<%}%>
										
										<%
											for (int i = qnaListPage.pageMaker.getBlockBegin(); i <= qnaListPage.pageMaker.getBlockEnd(); i++) {
										 	if (qnaListPage.pageMaker.getCurPage() == i) {
										%>
										 <font color='blue'><strong><%=i %></strong></font>&nbsp;
										 <%} else {%>
										<a href="./qna_list.jsp?pageno=<%=i %>"><strong><%=i %></strong></a>&nbsp;
										  <%
										   }
										  }%>
										  
										   <%if(qnaListPage.pageMaker.getNextGroupStartPage()< qnaListPage.pageMaker.getTotPage()){%>
										  <a href="./qna_list.jsp?pageno=<%=qnaListPage.pageMaker.getNextPage()%>">▶&nbsp;</a>
										  <%}%>
										 <%if(qnaListPage.pageMaker.getNextGroupStartPage()< qnaListPage.pageMaker.getTotPage()){%>
										  <a href="./qna_list.jsp?pageno=<%=qnaListPage.pageMaker.getNextGroupStartPage()%>">▶▶</a>&nbsp;
										  <%}%>
									</td>
								</tr> 
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right">
									<!--관리자만 작성가능. 기능추가필요-->
									
									<!--  <% //if(sUserId.equals("admin")) {%>	--> 						
									<input type="button" value="게시물 생성" onclick="noticeCreate();" /></td>
									<!-- <%//}else{%>
									<input type="hidden" value="게시물 생성" onclick="noticeCreate();" /></td>
									<%//} %> -->
								</tr>
							</table></td>
							</tr>
							</table>
					
				
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>