package com.itwill.shop.service;

import java.util.ArrayList;

import com.itwill.shop.dao.ReviewDao;
import com.itwill.shop.dto.Review;

public class ReviewService {

	private ReviewDao reviewDao;
	
	public ReviewService() throws Exception {
		reviewDao = new ReviewDao();
	}
	/* ------ review select------ */
	public ArrayList<Review> selectAllByUserId(Review review)throws Exception{
		return reviewDao.selectAllByUserId(review);
	}
	
	
}
