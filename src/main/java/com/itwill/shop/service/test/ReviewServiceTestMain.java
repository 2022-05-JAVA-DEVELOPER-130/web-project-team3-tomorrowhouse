package com.itwill.shop.service.test;

import java.util.ArrayList;

import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;
import com.itwill.shop.dto.review.Review;
import com.itwill.shop.service.ReviewService;

public class ReviewServiceTestMain {

	public static void main(String[] args) throws Exception {
		
		ReviewService reviewService = new ReviewService();
		Review review = new Review(0, null, null, null, 0, null, 0, "test6", null);
		
		ArrayList<Review> reviewList=
		reviewService.selectAllByUserId(review);
		System.out.println(reviewList);
		
		review = new Review(10, null, null, null, 0, null, 0, "test6", null);
		System.out.println(reviewService.updateClickCountByReviewNo(review));
		System.out.println(reviewService.selectByReviewNo(review));

		review = new Review(10, null, null, null, 0, null, 0, "test6", null);
		//System.out.println(reviewService.updateByReviewNo(review));
		
		Product product = new Product(1,null,0,null,null,0,null);
		System.out.println(	reviewService.selectAllByProductNo(new Review(0,null,null,null,0,null,0,null,
													new OrderItem(0,0,0,
																	product
																))));
		
		ArrayList<Review> arrayList = new ArrayList<Review>(0);
		arrayList.size();
		System.out.println(arrayList.size());
		
		//System.out.println(reviewService.deleteByReviewNo(new Review(19, null, null, null, 0, null, 0, "test6", null)));
		int o_no=0;
		System.out.println("o_no로 작성된 review_count");
		System.out.println(reviewService.countReviewByOrderNo(o_no));
	}

}
