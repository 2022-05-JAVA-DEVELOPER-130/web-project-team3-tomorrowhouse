<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String keyword = request.getParameter("keyword");

if( keyword==null || keyword.equals("")) {
	response.sendRedirect("product_serch_form.jsp");
}

ProductService productService = new ProductService();
List<Product> searchList = productService.productSearch(keyword);


if(searchList.size() == 0) {
	//response.sendRedirect("product_serch_form.jsp");
}

//response.sendRedirect("product_detail.jsp?p_no="+);
%>    

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내일의집</title>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 상품리스트</b></td>
								</tr>
							</table>

							<form name="f" method="post">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
									<input type = "text" name="">&nbsp;<input type = "submit" value="검색버튼">
									<%
									int product_size=searchList.size();
									int product_column_size=4;
									int product_line_count = 1;
									
									
									for (int i=0;i<searchList.size();i++) {
											Product product=productList.get(i);
									%>
									<!--상품시작 -->
									<%
									 if(i%product_column_size==0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="60px" height="40px"
												src="image/product/<%=product.getP_image()%>" border="0"></a><br />
											<br /> <b>상품명 : <%=product.getP_name()%></b><br> <font
											color="#FF0000">가격 : <%=new DecimalFormat("#,##0").format(product.getP_price())%>원
										</font></td>
									<%if(i%product_column_size==5){%>
									</tr>
									<%} %>	
									
								   <!--상품 끝 -->
								   <%}%>	
								</table>
							</form> <br /></td>
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