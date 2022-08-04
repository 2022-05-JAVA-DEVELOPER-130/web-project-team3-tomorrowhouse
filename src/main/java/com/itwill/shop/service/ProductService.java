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
	public List<Product> productSelectAll() throws Exception {
		return productDao.productSelectAll();  
	}
	//카테고리번호로 해당상품 전체출력
	public List<Product> selectAllByCgNo(int no) throws Exception{
		return productDao.selectAllByCgNo(no);
	}
	
	
	//상품번호로 1개 출력
	public Product productSelectByNo(Product product) throws Exception {
		return productDao.productSelectByNo(product);
	}
	
	//상품이름으로 1개 출력
	public Product productSelectByName(Product product) throws Exception {
		return productDao.productSelectByName(product);
	}
	
	//상품명 검색
	public List<Product> productSerch(String keyword) throws Exception {
		List<Product> productSerchList = productDao.productSerch(keyword);
		for(Product product : productSerchList) {
			System.out.println(product);
		}
		return productSerchList;
	}
	
	/*********************<<관리자 전용>>**************************/
	
	//상품등록하기
	public int insertProduct(Product product) throws Exception {
		return productDao.insertProduct(product);
	}
	
	//상품수정하기
	public int updateProduct(Product product) throws Exception {
		return productDao.updateProduct(product);
	}
	
	//상품삭제하기
	public int deleteProduct(Product product) throws Exception {
		return productDao.deleteProduct(product);
	}
	

}//
