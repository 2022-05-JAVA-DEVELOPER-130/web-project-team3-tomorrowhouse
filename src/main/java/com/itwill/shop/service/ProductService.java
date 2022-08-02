package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Product;

public class ProductService {
	
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		productDao = new ProductDao();
	}
	
	public List<Product> selectAll() throws Exception {
		return productDao.selectAll();
	}
	
	  
	
		

	

}//
