<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%

UserInfoService userInfoService = new UserInfoService();

ArrayList<UserInfo> userInfoList = userInfoService.findUserInfoList();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<form name="order_delete_all_form" style="margin: 0">
</form>	
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>전체 회원 정보</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>ID</font></td>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>비밀번호</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>이름</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>이메일 주소</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>주소</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>전화번호</font></td>
									</tr>

									<%
									for (UserInfo userInfo : userInfoList) {
									%>
									<tr>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_id()%></td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_pw()%></td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_name()%></td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_email()%></td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_address()%></td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_phone()%></td>
									</tr>
									<%
									}
									%>

								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=shop_main.jsp class=m1>메인으로</a>
									</td>
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