<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
private String u_id;
private String u_pw;
private String u_name;
private String u_email;
private String u_address;
private String u_phone;
 */






%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<h3>[<%=%> 상세보기]</h1>
<hr>

아이디 <input type ='text'name='u_id' value='<%=%>'><br>
비밀번호 <input type ='text'name='u_pw' value='<%=%>'><br>
이름 <input type ='text'name='u_name' value='<%=%>'><br>
이메일주소 <input type ='text'name='u_email' value='<%=%>'><br>
집주소 <input type ='text'name='u_address' value='<%=%>'><br>
폰번호 <input type ='text'name='u_phone' value='<%=%>'><br>

	<a href='user_modify_form.jsp'>[상품수정]</a>
	<a href=''>[상품삭제]</a>
</form>
</body>
</html>