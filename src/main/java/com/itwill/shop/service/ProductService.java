package com.itwill.shop.service;

import java.util.List;


import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Product;
import com.itwill.shop.dto.ProductListPageMakerDto;
import com.itwill.shop.dto.review.PageMaker;

public class ProductService {

	private ProductDao productDao;

	public ProductService() throws Exception {
		productDao = new ProductDao();
			}

	// 상품전체출력
	public ProductListPageMakerDto productSelectAll(int pageno) throws Exception {
		// 1.전체글의 갯수
		int totalRecordCount = productDao.getProductCount();
		// 2.paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker =
				new PageMaker(totalRecordCount, pageno);
		PageMaker.BLOCK_SCALE=5;
		PageMaker.PAGE_SCALE=12;
		
		// 3.게시물데이타 얻기
		List<Product> productList = productDao.productSelectAll(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		ProductListPageMakerDto pageMakerProductList = new ProductListPageMakerDto();
		pageMakerProductList.totRecordCount = totalRecordCount;
		pageMakerProductList.itemList = productList;
		pageMakerProductList.pageMaker = pageMaker;
		return pageMakerProductList;
	}
	
	
	
	// 카테고리번호로 해당상품 전체출력(페이징) - 서비스에서 검색
	public ProductListPageMakerDto productSelectAllCategory(int pageno , int cg_no) throws Exception {
		
		int categoryRecordCount = productDao.getProductCategoryCount(cg_no); 
		System.out.println("categoryRecordCount:"+categoryRecordCount);
		PageMaker pageMaker = new PageMaker(categoryRecordCount,pageno);
		PageMaker.BLOCK_SCALE=3;
		PageMaker.PAGE_SCALE=12;
	
		List<Product> productList = productDao.productSelectAllCategory(cg_no, pageMaker.getPageBegin(), pageMaker.getPageEnd()); 
		System.out.println("productList:"+productList.size());
		
		ProductListPageMakerDto pageMakerProductList = new ProductListPageMakerDto();
		pageMakerProductList.totRecordCount = categoryRecordCount;
		pageMakerProductList.itemList = productList;
		pageMakerProductList.pageMaker = pageMaker;
		return pageMakerProductList;

	}
		
	

	// 카테고리번호로 해당상품 전체출력
	public List<Product> selectAllByCgNo(int no) throws Exception {
		return productDao.selectAllByCgNo(no);
	}

	// 상품번호로 1개 출력
	public Product productSelectByNo(Product product) throws Exception {
		return productDao.productSelectByNo(product);
	}

	// 상품이름으로 1개 출력
	public Product productSelectByName(Product product) throws Exception {
		return productDao.productSelectByName(product);
	}

	// 상품명 검색
	public List<Product> productSearch(String keyword) throws Exception {
		List<Product> productSearchList = productDao.productSearch(keyword);
		for (Product product : productSearchList) {
			System.out.println(product);
		}
		return productSearchList;
	}

	/********************* <<관리자 전용>> **************************/

	// 상품등록하기
	public int insertProduct(Product product) throws Exception {
		return productDao.insertProduct(product);
	}

	// 상품수정하기
	public int updateProduct(Product product) throws Exception {
		return productDao.updateProduct(product);
	}

	// 상품삭제하기
	public int deleteProduct(int no) throws Exception {
		return productDao.deleteProduct(no);
	}

}//
