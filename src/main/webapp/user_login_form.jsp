<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="user_login_action.jsp" method="post">
   <table border="0" cellpadding="0" cellspacing="1"
         bgcolor="BBBBBB">
   <tr>
      <td width=120 align=center bgcolor="E6ECDE" height="22">사용자
         아이디</td>
      <td width=490 align="left" bgcolor="ffffff"
         style="padding-left: 10px"><input type="text"
         style="width: 150" name="u_id" value="<%=""%>">&nbsp;&nbsp;<font color="red"><%=""%></font>
      </td></tr>                              
   <tr>
      <td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
      <td width=490 align="left" bgcolor="ffffff"
         style="padding-left: 10px"><input type="text"
         style="width: 150" name="u_pw" value="<%=""%>">&nbsp;&nbsp;<font color="red"><%=""%></font>
      </td></tr>
      </table>
   </form> <br />
      <table border="0" cellpadding="0" cellspacing="1">
      <tr>
      <td align=center>
      <input type="button" value="로그인"   onClick="login();"> &nbsp; 
      <input type="button" value="회원가입" onClick="userCreateForm()"></td>
      </tr>
      </table></td>

</body>
</html>