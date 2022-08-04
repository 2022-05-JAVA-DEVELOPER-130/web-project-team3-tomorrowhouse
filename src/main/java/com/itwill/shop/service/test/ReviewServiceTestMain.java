package com.itwill.shop.service.test;

import com.itwill.shop.dto.Review;
import com.itwill.shop.service.ReviewService;

public class ReviewServiceTestMain {

	public static void main(String[] args) throws Exception {
		
		ReviewService reviewService = new ReviewService();
		Review review = new Review(0, null, null, null, 0, null, 0, "test6", null);
		reviewService.selectAllByUserId(review);
		
		
		
		
	}

}
