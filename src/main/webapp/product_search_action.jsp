<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

String keyword = request.getParameter("keyword");

if( keyword==null || keyword.equals("")) {
	response.sendRedirect("product_serch_form.jsp");
}

ProductService productService = new ProductService();
List<Product> searchList = productService.productSerch(keyword);


if(searchList.size() == 0) {
	//response.sendRedirect("product_serch_form.jsp");
}

//response.sendRedirect("product_detail.jsp?p_no="+);
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<h1>[상품검색리스트]</h1><hr>
<div>

</div>
<div>
   <ul>
   
   <%
   if(searchList.size() == 0) {
	out.print("검색결과 없음");
	}
   %>
      
      <%for(Product product : searchList ) { %>
    		<li><a href='product_detail.jsp?p_no=<%=product.getP_no()%>'><%=product.getP_name() %></a></li>
      <% } %>
   
   </ul>
</div>
</body>
</html>

