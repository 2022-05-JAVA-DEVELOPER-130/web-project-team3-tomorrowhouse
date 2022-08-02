package com.itwill.shop.service.test;

import com.itwill.shop.dto.Category;
import com.itwill.shop.dto.Product;
import com.itwill.shop.service.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		
		ProductService productService = new ProductService();
		
	
		System.out.println(">> 전체출력");
		System.out.println(productService.selectAll());
	
		
		/*
		System.out.println(">> 상품번호로 1개 출력");		
		System.out.println(productService.selectByNo(1));
		*/
		
		/*
		System.out.println(">> 상품이름으로 1개 출력");
		System.out.println(productService.selectByName("의자"));
		*/
		
		
		
		/*********************<<관리자 전용>>**************************/
		
		//System.out.println(">> 상품등록하기");
		//productService.insertProduct(new Product(0, "컴퓨터", 500000, "computer.jsp", "컴퓨터입니다", 0, new Category(3, null)));
	}

}
