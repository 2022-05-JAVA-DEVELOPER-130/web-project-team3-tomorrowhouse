package com.itwill.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.ReviewDao;
import com.itwill.shop.dto.Product;
import com.itwill.shop.dto.review.Review;

public class ReviewService {

	private ReviewDao reviewDao;
	private ProductService productService;
	private OrderService orderService;
	
	public ReviewService() throws Exception {
		reviewDao = new ReviewDao();
		productService = new ProductService();
		orderService=new OrderService();
	}
	/* ------ review select------ */
	public ArrayList<Review> selectAllByUserId(Review review)throws Exception{
		return reviewDao.selectAllByUserId(review);
	}
	
	public int findProductNoByOrderItemNo(Review review)throws Exception{
		int p_no=0;
		p_no=review.getOrderItem().getProduct().getP_no();
		productService.productSelectByNo(new Product(p_no, null, 0, null, null, 0, null));
		
		return p_no;
	}
	//2.(마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=22;
	public Review selectByOrderitemNo(Review review) throws Exception{
		return reviewDao.selectByOrderitemNo(review);
	}
	//3.(상품detail-리뷰list) 상품목록에서 리뷰를 보여주려면, p_no로 접근
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=1;
	public ArrayList<Review> selectAllByProductNo(Review review)throws Exception{
		return reviewDao.selectAllByProductNo(review);
	}
	
	//4.(상품detail-리뷰detail) 리뷰list에서 r_no로 접근
	//select * from review where r_no=26;
	public Review selectByReviewNo(Review review)throws Exception{
	
	return reviewDao.selectByReviewNo(review);
	}
	
	/* ------ review update------ */
	//리뷰 클릭시, r_click_count 증가
	public int updateClickCountByReviewNo(Review review)throws Exception{
		return reviewDao.updateClickCountByReviewNo(review);
	}
	
	//5.후기detail에서 r_no로 후기 업데이트
	
	public int updateByReviewNo(Review review)throws Exception{
		return reviewDao.updateByReviewNo(review); 
	}
	
	/* ------ review insert------ */
	//8.리뷰 작성
	//insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰1', '리뷰1 내용', 'test1', 1);
	public int createReview(Review review)throws Exception{
		return reviewDao.createReview(review);
	}
	
	/* ----- review delete ----*/
	
	//6. u_id로 후기 전체삭제
	//delete from review where u_id = 'test1';
	//7.r_no로 후기 1개삭제
	//delete from review where r_no=?;
	public int deleteByReviewNo(Review review)throws Exception{
		return reviewDao.deleteByReviewNo(review);
	}
	
	
	
	
}
	



	/***************/

	
