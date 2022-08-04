<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg=(String)request.getAttribute("msg");
if(msg==null)msg="";
UserInfo fuser=(UserInfo)request.getAttribute("fuser");
if(fuser==null)fuser=new UserInfo("","","","","","");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function userCreate() {
		if (document.f.u_id.value == "") {
			alert("사용자 아이디를 입력하십시요.");
			document.f.u_id.focus();
			return;
		}
		if (document.f.u_pw.value == "") {
			alert("비밀번호를 입력하십시요.");
			document.f.u_pw.focus();
			return;
		}
		if (document.f.u_pw2.value == "") {
			alert("비밀번호 확인을 입력하십시요.");
			f.u_pw2.focus();
			return;
		}
		if (document.f.u_name.value == "") {
			alert("이름을 입력하십시요.");
			f.u_name.focus();
			return;
		}
		if (document.f.u_email.value == "") {
			alert("이메일 주소를 입력하십시요.");
			f.u_email.focus();
			return;
		}
		if (document.f.u_address.value == "") {
			alert("주소를 입력하십시요.");
			f.u_address.focus();
			return;
		}
		if (document.f.u_phone.value == "") {
			alert("전화번호를 입력하십시요.");
			f.u_phone.focus();
			return;
		}
		if (document.f.u_pw.value != f.u_pw2.value) {
			alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
			f.u_pw.focus();
			f.u_pw.select();
			return;
		}
		document.f.action = "user_write_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}

	function userList() {
		f.action = "user_list.jsp";
		f.submit();
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
	
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			



			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table width=0 border=0 cellpadding=0 cellspacing=0>
				<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리
											- 회원 가입</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">사용자
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="u_id"
											 value="<%=fuser.getU_id()%>" >&nbsp;&nbsp;<font color="red"><%=msg%></font>
											<font color="red"></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px" name="u_pw"
											value="<%=fuser.getU_pw()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호
											확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px" name="u_pw2"
											value="<%=fuser.getU_pw()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="u_name"
											value="<%=fuser.getU_name()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일
											주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="u_email"
											value="<%=fuser.getU_email()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">주소
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="u_address"
											value="<%=fuser.getU_address()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">연락처
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="u_phone"
											value="<%=fuser.getU_phone()%>">
										</td>
									</tr>
								</table>
							</form> <br />
							
	
							<table border=0 cellpadding=0 cellspacing=1>
								<tr>
									<td align=center>
									<input type="button" value="회원 가입" onclick="userCreate();"> &nbsp; 
									<input type="button" value="목록" onClick="userList()">
									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
			<!-- include_common_bottom.jsp start-->

			<!-- include_common_bottom.jsp end-->
		</div>
	<!--container end-->
</body>
</html>
