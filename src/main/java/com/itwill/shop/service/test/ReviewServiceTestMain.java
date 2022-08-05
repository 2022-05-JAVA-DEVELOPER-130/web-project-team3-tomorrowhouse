package com.itwill.shop.service.test;

import java.util.ArrayList;

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
		
		
	}

}
