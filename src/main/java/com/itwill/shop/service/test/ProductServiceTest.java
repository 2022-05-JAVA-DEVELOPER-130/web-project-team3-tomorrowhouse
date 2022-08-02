package com.itwill.shop.service.test;

import com.itwill.shop.service.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		
		ProductService productService = new ProductService();
		
		/*
		System.out.println(">> 전체출력");
		System.out.println(productService.selectAll());
		*/
		
		System.out.println(">> 상품번호로 1개 출력");		
		System.out.println(productService.selectByNo(1));
		
	}

}
