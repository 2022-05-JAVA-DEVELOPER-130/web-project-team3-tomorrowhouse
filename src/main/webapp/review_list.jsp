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
	
<%@include file="login_check.jspf"%>  
<%!
/* 댓글이 없어서 필요없음
public String getTitleString(Review review) {
		StringBuilder title = new StringBuilder(128);
		String t = review.getR_title()();
		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입
		
		for (int i = 0; i < review.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		if (review.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
}
*/
%>

<%
/********로그인한 고객의 리뷰를 보여주는 페이지***********/
/***************/
sUserId="test3";
/***************/

UserInfoService userInfoService = new UserInfoService();
UserInfo userInfo =
userInfoService.findUser(sUserId);
OrderService orderService = new OrderService();

//1.요청페이지번호	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}	
//2.한페이지에표시할 게시물수 
int rowCountPerPage = 10;
//3.한화면에보여줄 페이지번호갯수( 1 2 3 4 5 6 7 8 9 10 ▶ ▶▶)
int pageCountPerPage =10;
//페이징(계산)을위한DTO,VO
PageInputDto pageInputDto=
		new PageInputDto(rowCountPerPage,pageCountPerPage,pageno,"","");

//게시물조회
ReviewService reviewService = new ReviewService();
/*
	private int r_no;
	private String r_title;
	private String r_content;
	
	private Date r_date;
	private int r_rating;
	private String r_image;
	private int r_click_count;
	
	private String u_id;
	
	private OrderItem orderItem;	// oi_no
*/
ArrayList<Review> reviewList=
reviewService.selectAllByUserId(new Review(0,null,null,null,0,null,0,sUserId,null));
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
	function boardCreate() {
		location.href = "board_write.jsp";
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=userInfo.getU_name() %>님의 리뷰 리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
								<!-- 
								
								
									 -->
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=20 align=center bgcolor="E6ECDE">No.</td>
										<td width=80 align=center bgcolor="E6ECDE">상품</td>
										<td width=100 align=center bgcolor="E6ECDE">상품명</td>
										<td width=50 align=center bgcolor="E6ECDE">주문수량</td>
										<td width=170 align=center bgcolor="E6ECDE">제목</td>
										<td width=100 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">조수</td>
									</tr>
									<%
										for (Review review:reviewList) {
											int rowNo = 1;
											Order order = 
													orderService.findOrderDetailByOrderItemNo(review.getOrderItem().getOi_no());
											Product product=order.getOrderItemList().get(0).getProduct(); 
													//orderService.findProductByOrderItemNo(review.getOrderItem().getOi_no());
									%>
									<tr>
										<td width=20 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=rowNo++%>
										</td>
										<td width=80 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='product_detail.jsp?p_no=<%=product.getP_no()%>'>
											<img width="60px" height="58px" src="image/product/<%=product.getP_image()%>" border="0">
											</a>
										</td>
										<td width=100 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='product_detail.jsp?p_no=<%=product.getP_no()%>'>
											<%=product.getP_name()%>
											</a>
										</td>
										<td width=50 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=order.getOrderItemList().get(0).getOi_qty()%>
										</td>
										<td width=170 align=center bgcolor="ffffff">
											<a href='review_view.jsp?r_no=<%=review.getR_no()%>'>
											<%=review.getR_title()%>
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
										rowNo++;
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