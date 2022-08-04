<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %> 

<%

/*
private String u_id;
private String u_pw;
private String u_name;
private String u_email;
private String u_address;
private String u_phone;
*/

/*
 * 회원 1명 보기
public UserInfo findUser(String u_id) throws Exception {
	UserInfo findUser = userInfoDao.findUser(u_id);
	return findUser;
}
 */
 


 
UserInfoService userInfoService = new UserInfoService();
UserInfo findUser = userInfoService.findUser(sUserId);

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">

</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->


		<div id="wrapper">

			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내정보 관리
											- 내정보보기</b></td>
								</tr>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">사용자
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=findUser.getU_id() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=findUser.getU_name() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일 주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=findUser.getU_email() %>
										</td>
									</tr>
										<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">집 주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=findUser.getU_address() %>
										</td>
									</tr>
										<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=findUser.getU_phone()%>
										</td>
									</tr>

								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<form action='user_modify_form.jsp' method='post' style='display:inline;'>
									<input type='hidden' name='u_id' value='<%=findUser.getU_id()%>'>
									<input type='submit' value="내정보수정">
									</form>
									<form action='user_remove_action.jsp' method='post' style='display:inline;'>
									<input type='hidden' name='u_id' value='<%=findUser.getU_id()%>'>
									<input type="submit" value="내정보삭제[탈퇴]">
									</form>
							</table>	
						</td>
					</tr>
				</table>
			</div>
			
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">

		</div>
	</div>
	<!--container end-->
</body>
</html>