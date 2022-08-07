<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%

String o_noStr=request.getParameter("o_no");
	if(o_noStr==null|| o_noStr.equals("")){
		response.sendRedirect("order_list.jsp");
		return;
	}

	Order newOrder = new Order(Integer.parseInt(o_noStr),null,null,0,sUserId,null);
	OrderService orderService=new OrderService();
	Order order = orderService.oneOfOrderProductdetailByUserId(newOrder);
	
	ReviewService reviewService = new ReviewService();
	//해당 주문건으로 작성된 후기가 있는지 확인
	int reviewCount= reviewService.countReviewByOrderNo(Integer.parseInt(o_noStr));
	
	//review보기 후, '리스트'선택시, 돌아갈경로(해당고객의 리뷰게시판)으로 지정
	session.setAttribute("review_access_route", "review_list");
	
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
/*
form > table tr td{
	border: 0.1px solid black;
}
*/
</style>
<script type="text/javascript">
	
	function review_select_write_action(formId) {
		if(window.confirm('리뷰를 작성하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'review_write_form.jsp';
			form.submit();
		}
	}
	
	function review_write() {
		/*
		if(f.r_count==0){
			alert("해당주문의 리뷰를 작성하시면, 구매확정 됩니다♡");
		}
		*/
		document.f.method = "POST";
		document.f.action = "review_write_form.jsp";
		document.f.submit();
	}

	function review_select_view_action(formId) {
		if(window.confirm('리뷰를 보시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'review_view.jsp';
			form.submit();
		}
	}
	/*
	function review_view() {
		document.f.method = "POST";
		document.f.action = "review_view.jsp";
		document.f.submit();
	}
	*/
	function order_cancel() {
		if(window.confirm('주문을 취소하시겠습니까?')){
			document.f.method = "POST";
			document.f.action = "order_cancel_action.jsp";
			document.f.submit();
		}
	}

	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
		    <jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=order.getU_id() %>님의 주문상세조회</b></td>
								</tr>
							</table>
							
							<!--form start-->
							<!-- <form name="f" method="post" action="order_cancel_action.jsp"> -->
							<form name="f" >
								<input type="hidden" name="cancel_order_no" value="<%=order.getO_no()%>">
								<input type="hidden" name="r_count" value="<%=reviewCount%>">
								<table align="center" width="80%"  border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문상세정보</caption>
									<tr>
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문번호</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문일자</font></td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문자</font></td>
										<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문상태</font></td>
									</tr>
									
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_date()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=order.getU_id()%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
										<% if(reviewCount==0) {%>
										<% //if(!order.getO_desc().substring(0, 6).equals("[주문취소]")) { %>
											 <input type="hidden" name="o_no" value="<%=order.getO_no()%>">
											<a href="javascript:order_cancel();"><font color=red>주문취소</font></a> 
										<% } else if(order.getO_desc().substring(0, 6).equals("[주문취소]")){%>
											<font color=blue>구매확정</font>
										<% } else {%>
											<font color=blue>구매확정</font>
										<% } %>
										</td>
									</tr>
								</table>
								</form>
								
								<br/>
								<div id='f'>	
								<table align=center  width=80% border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문제품목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 align=center bgcolor="E6ECDE" class=t1>상품 이름</td>
										<td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>수 량</td>
										<td width=166 height=25  align=center bgcolor="E6ECDE" class=t1>가 격</td>
										<td width=50 height=25  align=center bgcolor="E6ECDE" class=t1>리 뷰</td>
									</tr>
									<!-- order item start -->
									<%
									int tot_price=0;
											//for(OrderItem orderItem:order.getOrderItemList()) {
											for(int i=0 ; i<order.getOrderItemList().size();i++) {
												OrderItem orderItem = order.getOrderItemList().get(i);
												tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
												//해당 주문아이템의 작성된 reivew 존재여부 check
												Review review = reviewService.selectByOrderitemNo(new Review(orderItem.getOi_no(), null, null, null, 0, null, 0, null, orderItem));
									%>
									<tr>
										<td width=290 height=26 align=center  bgcolor="ffffff" class=t1>
										<a href='product_detail.jsp?p_no=<%=orderItem.getProduct().getP_no()%>'>
												<%=orderItem.getProduct().getP_name()%></a>
										</td>
										<td width=112 height=26 align=center  bgcolor="ffffff" class=t1>
												<%=orderItem.getOi_qty()%>
										</td>
										
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
												<%=new DecimalFormat("#,###").format(orderItem.getOi_qty()*orderItem.getProduct().getP_price())%> 원
										</td>
										
										<!-- review 관리를 위한 from - start -->
										<form id='review_list_form_<%=orderItem.getOi_no() %>'>
										<td width=50 height=26 align=center class=t1 bgcolor="ffffff">
										<!-- '주문취소' or '리뷰작성완료'했을 경우, 표기 변경 -->
												<% if(!order.getO_desc().substring(0, 6).equals("[주문취소]")) { 
											//oi_no로 작성된 리뷰가 없다면
														if(review==null){%>
															<input type="hidden" name="o_no" value="<%=order.getO_no()%>">
															<input type='hidden' name='oi_no' value='<%=orderItem.getOi_no()%>'>
															<input type='hidden' name='index' value='<%=i%>'>
															<a href="javascript:review_select_write_action('review_list_form_<%=orderItem.getOi_no() %>');">작성하기</a>
															<!-- <input type="button" value="작성하기" onClick="review_select_write_action()"> -->
														<%} else if (review!=null){%>
															<!-- oi_no로 작성된 리뷰가 있다면 -->
															<input type='hidden' name='r_no' value='<%=review.getR_no()%>'>
															<a href="javascript:review_select_view_action('review_list_form_<%=orderItem.getOi_no() %>');">보기</a>
														
													<% }}%>
										</td>
										</form>
										<!-- review 관리를 위한 from - end -->
									</tr>
									<%}%>
									<!-- order item end -->
									<tr>
										<td width=640 colspan=4 height=26  bgcolor="ffffff" class=t1>
											<!-- '주문취소'했을 경우, 금액 표기및 색상 변경 -->
											<p align=right style="padding-top: 10px">
												<% if(!order.getO_desc().substring(0, 6).equals("[주문취소]")) { %>
												<font color=blue>총 주문 금액 : <%=new DecimalFormat("#,##0").format(tot_price)%> 원</font>
												<% }else { %>
												<font color=blue>총 주문 금액 :  <%=new DecimalFormat("#,##0").format(tot_price)%> 원</font>
												<br/>
												<font color=red>총 환불 금액 : -<%=new DecimalFormat("#,##0").format(tot_price)%> 원</font>
												<% } %>
											</p>
										</td>
									</tr>
								</table>
							<br />
							</div>
							<!-- form end -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center> 
										&nbsp;&nbsp;<a href=order_list.jsp class=m1>주문목록</a>
										&nbsp;&nbsp;<a href=product_list.jsp class=m1>쇼핑하러가기</a>
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
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>