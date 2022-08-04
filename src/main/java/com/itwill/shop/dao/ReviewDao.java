package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;
import com.itwill.shop.dto.Review;
import com.itwill.shop.sql.CartSQL;
import com.itwill.shop.sql.ReviewSQL;


public class ReviewDao {
	
	private DataSource dataSource;

	public ReviewDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shop/common/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
		
	}
	/* ------ review select------ */
	//1.(마이페이지-리뷰list) 로그인한 회원이 마이페이지?에서 리뷰를 모아서 볼 수 있음 -> u_id로 review 선택
	public ArrayList<Review> selectAllByUserId(Review review)throws Exception{
		//	public static final String SELECT_ALL_BY_USER_ID =
		//"select * from review where u_id = ?";
		
		ArrayList<Review> reviewList = new ArrayList<Review>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.SELECT_ALL_BY_USER_ID);
			pstmt.setString(1, review.getU_id());
			rs = pstmt.executeQuery();
			while (rs.next()) {
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
				reviewList.add(new Review(rs.getInt("r_no"),
											rs.getString("r_title"),
											rs.getString("r_content"),
											rs.getDate("r_date"),
											rs.getInt("r_rating"),
											rs.getString("r_image"),
											rs.getInt("r_click_count"),
											rs.getString("u_id"), 
											new OrderItem(rs.getInt("oi_no"), 0, 0, null)
											)
								);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return reviewList;
	}
	
	//2.(마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택
		//select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=22;
	
	public Review selectByOrderitemNo(Review review) throws Exception{
		Review findReview= null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.SELECT_BY_ORDER_ITEM_NO);
		/*
	public static final String SELECT_BY_ORDER_ITEM_NO =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=?";
		 */
		pstmt.setInt(1, review.getOrderItem().getOi_no());
		rs = pstmt.executeQuery();
		/*
		 * 	private int r_no;
			private String r_title;
			private String r_content;
			private String u_id;
			
			private OrderItem orderItem;
		 */
		if (rs.next()) {
			findReview = new Review(rs.getInt("r_no"),
												rs.getString("r_title"),
												rs.getString("r_content"),
												rs.getDate("r_date"),
												rs.getInt("r_rating"),
												rs.getString("r_image"),
												rs.getInt("r_click_count"),
												rs.getString("u_id"), 
												new OrderItem(rs.getInt("oi_no"), 0, 0, null)
									);
		}
		
		return findReview;
	}
	
	//3.(상품detail-리뷰list) 상품목록에서 리뷰를 보여주려면, p_no로 접근
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=1;
	public ArrayList<Review> selectAllByProductNo(Review review)throws Exception{
		/*
		public static final String SELECT_BY_PRODUCT_NO =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=?";
		 */
		
		ArrayList<Review> reviewList = new ArrayList<Review>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.SELECT_BY_PRODUCT_NO);
			pstmt.setInt(1, review.getOrderItem().getProduct().getP_no());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
					reviewList.add(new Review(rs.getInt("r_no"),
							rs.getString("r_title"),
							rs.getString("r_content"),
							rs.getDate("r_date"),
							rs.getInt("r_rating"),
							rs.getString("r_image"),
							rs.getInt("r_click_count"),
							rs.getString("u_id"), 
							new OrderItem(rs.getInt("oi_no"), 0, 0, null)
							)
				);
			}
		
		return reviewList;
	}
	
	//4.(상품detail-리뷰detail) 리뷰list에서 r_no로 접근
		//select * from review where r_no=26;
	/*
	public static final String SELECT_BY_REVIEW_NO =
			"select * from review where r_no=?";
	*/
	
	public Review selectByReviewNo(Review review)throws Exception{
		
		Review findReview= null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.SELECT_BY_REVIEW_NO);
		/*
			public static final String SELECT_BY_REVIEW_NO =
					"select * from review where r_no=?";
		 */
		pstmt.setInt(1, review.getR_no());
		rs = pstmt.executeQuery();
		/*
		 * 	private int r_no;
			private String r_title;
			private String r_content;
			private String u_id;
			
			private OrderItem orderItem;
		 */
		if (rs.next()) {
					findReview = new Review(rs.getInt("r_no"),
							rs.getString("r_title"),
							rs.getString("r_content"),
							rs.getDate("r_date"),
							rs.getInt("r_rating"),
							rs.getString("r_image"),
							rs.getInt("r_click_count"),
							rs.getString("u_id"), 
							new OrderItem(rs.getInt("oi_no"), 0, 0, null)
				);
		}
		
		return findReview;
		
	}
	/* ----- review update ----*/
	//5.후기detail에서 r_no로 후기 업데이트
	/*
	public static final String UPDATE_BY_REVIEW_NO =
			"update review set r_title = ?, r_content = ? where r_no= ?";
	*/
	
	public int updateByReviewNo(Review review)throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.UPDATE_BY_REVIEW_NO);
		/*
			public static final String UPDATE_BY_REVIEW_NO =
					"update review set r_title = ?, r_content = ? where r_no= ?";
		 */
		pstmt.setString(1, review.getR_title());
		pstmt.setInt(2, review.getR_no());
		pstmt.setInt(3, review.getR_no());
		int rowCount = pstmt.executeUpdate();
		
		return rowCount;
	}
	
	/* ----- review delete ----*/
	//6. u_id로 후기 전체삭제
	//delete from review where u_id = 'test1';
	public int deleteByUserId(Review review)throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.DELETE_BY_USER_ID);
		/*
			public static final String DELETE_BY_USER_ID =
			"delete from review where u_id = ?";
		 */
		pstmt.setString(1, review.getU_id());
		int rowCount = pstmt.executeUpdate();
		
		return rowCount;
	}
	
	//7.r_no로 후기 1개삭제
	//select * from review where r_no=26;
	public int deleteByReviewNo(Review review)throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.DELETE_BY_REVIEW_NO);
		/*
		public static final String DELETE_BY_REVIEW_NO =
			"delete from review where r_no=?";
		 */
		pstmt.setInt(1, review.getR_no());
		int rowCount = pstmt.executeUpdate();
		
		return rowCount;
	}
	
	/* ------ review insert------ */
	//8.리뷰 작성
	//insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰1', '리뷰1 내용', 'test1', 1);
	public int createReview(Review review)throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.CREATE_REVIEW);
		/*
			public static final String CREATE_REVIEW =
			"insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, ?, ?, ?, ?)";
		 */
		
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_content());
		pstmt.setString(3, review.getU_id());
		pstmt.setInt(4, review.getOrderItem().getOi_no());
		int rowCount = pstmt.executeUpdate();
		
		return rowCount;
	}
	
	//9.리뷰 작성시, 기존에 작성된 리뷰가 있는지 orderItem_no로 체크
	 //-> u_id & p_no조합은, 고객이 상품을 여러번 샀을 수도있다.
	public int isExistedReviewByOrderitemNo(Review review) throws Exception {
		 Connection con=dataSource.getConnection();
		 /*
		  	public static final String IS_EXISTED_REVIEW_BY_ORDER_ITEM_NO =
			"select count(*) from review where oi_no=?";
		  */
		 PreparedStatement pstmt=con.prepareStatement(ReviewSQL.IS_EXISTED_REVIEW_BY_ORDER_ITEM_NO);
		 pstmt.setInt(1, review.getOrderItem().getOi_no());
		 ResultSet rs = pstmt.executeQuery();
		 rs.next();
		 int review_count = rs.getInt(1);
		 con.close();
		return review_count;
	}
	
	
	
	
}
