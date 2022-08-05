<%@page import="com.itwill.shop.dto.ProductListPageMakerDto"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="java.text.DecimalFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	String cgNoStr= request.getParameter("cg_no");
//	
//	if(cgNoStr==null || cgNoStr.equals("")){
//		response.sendRedirect("product_list.jsp");
//		return;
//	}
//	ProductService productService = new ProductService();
//	List<Product> productTableList = productService.selectAllByCgNo(Integer.parseInt(cgNoStr));
//	//Category category = new Category();
	
	String pagenoStr = request.getParameter("pageno");
	String cgNoStr= request.getParameter("cg_no");
	
	if(pagenoStr==null)pagenoStr="1";
	if(cgNoStr==null)cgNoStr="1";
	
	ProductService productService = new ProductService();
	ProductListPageMakerDto productListPageMaker = productService.productSelectAllCategory(Integer.parseInt(pagenoStr),Integer.parseInt(cgNoStr));
	
	
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
							<!-- 검색아이콘 start -->
							<form method='get' action='product_search_action_view.jsp'>
							<p align ="right"><input size="30" type = "text" name='keyword' placeholder="검색어를 입력하세요">&nbsp;<input type = "submit" value="검색">
							</form>
							<!-- 검색아이콘 fin -->
							<form name="f" method="post">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="0" bgcolor="BBBBBB">
									<%
									int product_size=productListPageMaker.itemList.size();
									int product_column_size=4;
									int product_line_count = 1;
									
									
									for (int i=0;i<productListPageMaker.itemList.size();i++) {
											Product product=productListPageMaker.itemList.get(i);
									%>
									<!--상품시작 -->
									<%
									 if(i%product_column_size==0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="100px" height="90px"
												src="image/product/<%=product.getP_image()%>" border="0"></a><br />
											<b>상품명 : <%=product.getP_name()%></b><br> <font
											color="#FF0000">가격 : <%=new DecimalFormat("#,##0").format(product.getP_price())%>원
										</font></td>
									<%if(i%product_column_size==3){%>
									</tr>
									<%} %>	
									<!--  빈칸채우기 start -->
										<% if(i==productListPageMaker.itemList.size()-1) {
												for(int j=0; j < 3 - i %4 ; i++){
												%> <td align="center" width="25%"  bgcolor="ffffff"></td>
												<%}
												}%> 
									<!--  빈칸채우기 fin -->	
								   <!--상품 끝 -->
								   <%}%>	
								</table>
								<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     
										 <%if(productListPageMaker.pageMaker.getPrevGroupStartPage()>0) {%>    
										    <a href="./category_list.jsp?pageno=1&cg_no=1">◀◀</a>&nbsp;
										 <%}%>
										 <%if(productListPageMaker.pageMaker.getPrevPage()>0) {%>    
											<a href="./category_list.jsp?cg_no=<%=cgNoStr%>&pageno=<%=productListPageMaker.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										 <%}%>
										<%
											for (int i = productListPageMaker.pageMaker.getBlockBegin(); i <= productListPageMaker.pageMaker.getBlockEnd(); i++) {
										 	if (productListPageMaker.pageMaker.getCurPage() == i) {
										%>
										 <font color='red'><strong><%=i%></strong></font>&nbsp;
										<%} else {%>
										<a href="./category_list.jsp?cg_no=<%=cgNoStr%>&pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										   }
										  }
										 %>
										 <%if(productListPageMaker.pageMaker.getCurPage() != productListPageMaker.pageMaker.getTotPage()){%>
										  <a href="./category_list.jsp?cg_no=<%=cgNoStr%>&pageno=<%=productListPageMaker.pageMaker.getNextPage()%>">▶&nbsp;</a>
										 <%}%>
										 <%if(productListPageMaker.pageMaker.getNextGroupStartPage() < productListPageMaker.pageMaker.getTotPage()){%>
										<a
										href="./category_list.jsp?cg_no=<%=cgNoStr%>&pageno=<%=productListPageMaker.pageMaker.getNextGroupStartPage()%>">▶▶</a>&nbsp;
										 <%}%>
									</td>
								</tr>
							</table> <!-- button -->
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