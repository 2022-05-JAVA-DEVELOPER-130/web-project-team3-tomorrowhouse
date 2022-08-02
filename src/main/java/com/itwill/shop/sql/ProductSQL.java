package com.itwill.shop.sql;

public class ProductSQL {
	
/* Select문*/	
	
 //product 전체보기
 public final static String PRODUCT_SELECT_ALL
 				= "select * from product";
 

 //product 상품번호(p_no)로 1개 보기
 public final static String PRODUCT_SELECT_BY_NO 
 				= "select * from product where p_no = ? ";
 //product 상품이름(p_name)로 1개 보기
 public final static String PRODUCT_SELECT_BY_NAME
 				= "select * from product where p_name = ?";
 
 
 /* Update문 (관리자전용) */

 //product 상품번호(p_no)로 수정 -(이름(p_no),가격(p_price),이미지(p_image),상품설명(p_desc),카테고리(cg_no)
 public final static String PRODUCT_UPDATE_BY_NO
 	= "update product set p_name=?, p_price=?, p_image=?, p_desc=?, cg_no=?  where p_no=?";
 //product 상품번호(p_no)로 클릭수(p_click_count) 증가
 public final static String PRODUCT_CLICK_COUNT
 	= "update product set p_click_count=p_click_count+? where p_no =?";

 
 /* Delete문 (관리자전용) */

 // product 상품번호(p_no)로 삭제
 public final static String PRODUCT_DELETE_BY_NO
 				= "delete from product where p_no=?";
 
 
 /* Insert문 (관리자전용) */
 
 // product 새상품 추가
 public final static String PRODUCT_INSERT
	="insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values (product_p_no_seq.nextval,?,?,?,?,?,?)";

 
}