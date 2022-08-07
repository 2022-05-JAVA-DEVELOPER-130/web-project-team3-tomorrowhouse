<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>    
<%
	String oi_noStr = request.getParameter("oi_no");
	String o_noStr = request.getParameter("o_no");

	//sUserId로 고객정보 find
	UserInfoService userInfoService = new UserInfoService();
	UserInfo userInfo = userInfoService.findUser(sUserId);
	
	//oi_no로 해당 주문건 find
	OrderService orderService = new OrderService();
	Order order=new Order(Integer.parseInt(o_noStr), null, null, 0, sUserId, null);
	order=orderService.oneOfOrderProductdetailByUserId(order);
	Product product= orderService.findProductByOrderItemNo(Integer.parseInt(oi_noStr));
	
	ReviewService reviewService = new ReviewService();
	if(reviewService.selectByOrderitemNo(new Review(0, null, null, null, 0, null, 0, null, new OrderItem(Integer.parseInt(oi_noStr),0,0,null)))!=null){
		out.println("<script>");
		out.println("alert('이미 작성된 리뷰입니다♡');");
		out.println("location.href='review_list.jsp';");
		out.println("</script>");
	}
	/*
	if(reviewService.countReviewByOrderNo(Integer.parseInt(o_noStr))==0){
		orderService.confirmOrder(order);
		
		out.println("<script>");
		out.println("alert('해당주문의 리뷰를 작성하시면, 구매확정 됩니다♡');");
		out.println("location.href='review_write_form.jsp';");
		out.println("</script>");
	}
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
 
<script type="text/javascript">
	function reviewCreate() {
		if (f.r_title.value == "") {
			alert("제목을 입력하십시요.");
			f.title.focus();
			return false;
		}
		if (f.r_content.value == "") {
			alert("내용을 입력하십시요.");
			f.content.focus();
			return false;
		}

		f.action = "review_write_action.jsp";
		f.method="POST";
		f.submit();
	}

	function reviewList() {
		f.action = "review_list.jsp";
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
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=userInfo.getU_name() %> 님의 리뷰 작성</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
										<input type="hidden" name="oi_no" value='<%=oi_noStr %>'>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=userInfo.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="placeholder"  style="width: 150px" name="p_no" value='<%=product.getP_name() %>'></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품이미지</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<img width="60px" height="58px" src="image/product/<%=product.getP_image()%>" border="0">
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">구매일자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<%=order.getO_date() %>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150px" name="r_title"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<textarea name="r_content" class="textarea" style="width: 350px " rows="10"></textarea></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">별점</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150px" name="r_rating"></td>
									</tr>
								</table>
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="리뷰 쓰기" onClick="reviewCreate()"> &nbsp;
									<input type="button" value="<%=userInfo.getU_name() %>님의 리뷰 목록" onClick="reviewList()"></td>
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