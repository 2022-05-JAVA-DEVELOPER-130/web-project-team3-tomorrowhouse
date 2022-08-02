package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Product;

public class ProductService {
	
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		productDao = new ProductDao();
	}
	
	//상품전체출력
	public List<Product> selectAll() throws Exception {
		return productDao.selectAll();  
	}
	
	//상품번호로 1개 출력
	public Product selectByNo(int p_no) throws Exception {
		return productDao.selectByNo(p_no);
	}
	
	//상품이름으로 1개 출력
	public Product selectByName(String p_name) throws Exception {
		return productDao.selectByName(p_name);
	}
	
	
	
	/*********************<<관리자 전용>>**************************/
	
	//상품등록하기
	public int insertProduct(Product product) throws Exception {
		return productDao.insertProduct(product);
	}
	
	
	
	

}//
