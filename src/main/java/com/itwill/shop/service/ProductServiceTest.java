package com.itwill.shop.service;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		
		ProductService productService = new ProductService();
		
		System.out.println(">> 전체출력");
		System.out.println(productService.selectAll());
		
	}

}
