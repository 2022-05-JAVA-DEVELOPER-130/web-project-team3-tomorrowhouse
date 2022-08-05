<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.review.ReviewListPageMakerDto"%>
<%@page import="com.itwill.shop.dto.review.PageInputDto"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
/*
if(request.getMethod().equalsIgnoreCase("GET")){
    response.sendRedirect("product_list.jsp");		  
	 return;
}
*/


String p_noStr=
request.getParameter("p_no");

/**************/
//p_noStr="1";
/**************/

//게시물조회
ReviewService reviewService = new ReviewService();
OrderService orderService =new OrderService();
ProductService productService = new ProductService();

Product product = new Product(Integer.parseInt(p_noStr),null,0,null,null,0,null);
product=
productService.productSelectByNo(product);

ArrayList<Review> reviewList=
reviewService.selectAllByProductNo(new Review(0,null,null,null,0,null,0,null,
													new OrderItem(0,0,0,
																	product
																)));
if(reviewList.size()==0){
	out.println("<script>");
	out.println("alert('아차차 아직 작성된 후기가 없네요♡. 얼리어답터가 되보시겠어요?');");
	out.println("location.href='product_detail.jsp?p_no="+p_noStr+"';");
	out.println("</script>");
}
	 
//BoardService boardService=new BoardService();
//BoardListPageDto boardListPage 	=boardService.findBoardList(pageInputDto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">

	
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=product.getP_name() %> 상품의 리뷰 리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
								<!-- 
									 -->
								</tr>
					</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<input type="hidden" name="p_no" value='<%=product.getP_no() %>'>
										<td width=70 align=center bgcolor="E6ECDE">주문일</td>
										<td width=170 align=center bgcolor="E6ECDE">제목</td>
										<td width=150 align=center bgcolor="E6ECDE">내용</td>
										<td width=100 align=center bgcolor="E6ECDE">작성일</td>
										<td width=70 align=center bgcolor="E6ECDE">조회수</td>
									</tr>
									<%
										for (Review review:reviewList) {
											Order order = 
													orderService.findOrderDetailByOrderItemNo(review.getOrderItem().getOi_no());
													//orderService.findProductByOrderItemNo(review.getOrderItem().getOi_no());
									%>
									<tr>
										<input type="hidden" name="r_no" value='<%=review.getR_no() %>'>
										<td width=70 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<%=(order.getO_date()+"").substring(5, 10) %>
										</td>
										<td width=170 align=center bgcolor="ffffff">
											<a href='review_view.jsp?r_no=<%=review.getR_no()%>'>
											<%=review.getR_title()%>
										</td>
										<td width=170 align=center bgcolor="ffffff">
											<a href='review_view.jsp?r_no=<%=review.getR_no()%>'>
											<%=review.getR_content()%>
										</td>
										<td width=100 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=review.getR_date()%>
										</td>
										<td width=70 align=center bgcolor="ffffff" align="left"><%=review.getR_click_count()%>
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
							
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
									
									
									</td>
								</tr>
							</table>
							<!-- button -->
							<!-- 
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right"><input type="button" value="게시물 생성"
										onclick="boardCreate();" /></td>
								</tr>
							</table>
							 -->
							</td>
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