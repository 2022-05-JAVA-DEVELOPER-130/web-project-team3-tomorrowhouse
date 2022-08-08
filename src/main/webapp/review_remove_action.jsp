<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login_check하지 않고, 하단에서 접근 막음 -->
<%
	String r_noStr = request.getParameter("r_no");
	String u_idStr = request.getParameter("u_id");
	//String p_noStr = request.getParameter("p_no");
	String sUserId = (String)session.getAttribute("sUserId");
	System.out.println(sUserId);
	
	//r_no없이 접근하는 경우
	if(r_noStr==null || r_noStr.equals("")) {
		 response.sendRedirect("review_list.jsp");
		 return;
	}
	
	ReviewService reviewService = new ReviewService();
	
	Review findReview = new Review(Integer.parseInt(r_noStr),null,null,null,0,null,0,null,null);
	
	Review review = reviewService.selectByReviewNo(findReview);
	//System.out.println("null");
	//System.out.println(u_idStr);
	//System.out.println(review.getU_id());
	
	
	/*************forwarding***************/
	//request.setAttribute("u_id",); //msg는 URL에 붙여보낼때는 인코딩하고, msg를 인코딩해서 보내면, 값을 얻은 후 다시 디코딩해야함.
	//request.setAttribute("fuser", newUser);
	
	//RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
	//rd.forward(request, response);	//요청의 흐름이 "user_write_form.jsp"로 이동
	//비회원과 작성자가 아닌사람은 접근불가 
	/*
	if(sUserId==null|| sUserId.equals("")  ){
		out.println("<script>");
		out.println("alert('작성자만 삭제가능합니다');");
		out.println("location.href='review_view.jsp?r_no="+r_noStr+"';");
		out.println("</script>");
		return;
	}
	*/
	//(관리자와 작성자만 접근)
	/*
	if( !sUserId.equals(u_idStr) ){
		out.println("<script>");
		out.println("alert('작성자만 삭제가능합니다');");
		out.println("location.href='review_view.jsp?r_no="+r_noStr+"';");
		out.println("</script>");
		return;
	}
	*/
	
	/*
	if( !sUserId.equals("admin") || !review.getU_id().equals(sUserId)  ){
		out.println("<script>");
		out.println("alert('작성자만 삭제가능합니다');");
		out.println("location.href='review_view.jsp?r_no="+r_noStr+"';");
		out.println("</script>");
		return;
	}
	*/
	
	if(sUserId==null||!sUserId.equals("admin") && !sUserId.equals(review.getU_id())){
		out.println("<script>");
		out.println("alert('작성자만 삭제가능합니다');");
		out.println("location.href='review_view.jsp?r_no="+r_noStr+"';");
		out.println("</script>");
		return;
	}
reviewService.deleteByReviewNo(new Review(Integer.parseInt(r_noStr),null,null,null,0,null,0,null,null));
//(수정필요)현재, 해당 user의 review_list로 이동
response.sendRedirect("review_list.jsp");


%>
