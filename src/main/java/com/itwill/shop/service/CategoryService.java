package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.CategoryDao;
import com.itwill.shop.dto.Category;

public class CategoryService {
	private CategoryDao categoryDao;
	
	public CategoryService() throws Exception {
		categoryDao = new CategoryDao();
	}

	
	//카테고리 번호로 찾기
	public Category categoryListByNo(int no)throws Exception {
		return categoryDao.categoryByNo(no);
	}
	//카테고리 이름으로 찾기
	public Category categoryListByName(String name)throws Exception{
		return categoryDao.CategoryByName(name);
	}
	
	
	
	
	//카테고리스트 
	public List<Category> categoryList ()throws Exception{
		return categoryDao.selectAll();
	}
	
}
