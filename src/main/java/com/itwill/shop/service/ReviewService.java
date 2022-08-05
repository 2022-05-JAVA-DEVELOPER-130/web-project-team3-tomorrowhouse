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
	
	
}
	



	/***************/

	
