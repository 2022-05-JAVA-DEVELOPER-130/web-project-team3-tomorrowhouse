package com.itwill.shop.sql;
/*
--test1의 모든 리뷰 리스트
select * from review where u_id = 'test1';

--test1의 1번 상품 리뷰 한 개 출력
select * from review r join orderitem o on r.oi_no = o.oi_no where r.u_id='test1' and o.p_no=1;

--test1의 주문상세 1번 상품 리뷰 한 개 변경
update review set r_title='리뷰1 제목 변경', r_content='리뷰1 내용 변경' where u_id = 'test1' and oi_no=1;

--test1의 모든 리뷰 삭제
delete from review where u_id='test1';

--test1의 상품 번호 1번 리뷰 삭제
delete from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no=1) where u_id='test1';
 */

public class ReviewSQL {
	
	public static final String REVIEW_SELECT_ALL_USER_BY_ID =
			"select * from review where u_id = ?;";
	
	public static final String REVIEW_SELECT_BY_NO_USER_ID = 
			"select * from review r join orderitem o on r.oi_no = o.oi_no where r.u_id = ? and o.p_no = ?;";
	
	public static final String REVIEW_UPDATE_BY_P_NO_USER_BY_ID = 
			"update review set r_title = ?, r_content = ? where u_id = ? and oi_no = ?;";
	
	public static final String REVIEW_DELETE_ALL_USER_BY_ID =
			"delete from review where u_id = ?;";
	
	public static final String REVIEW_DELETE_BY_NO_USER_BY_ID = 
			"delete from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no = ?) where u_id = ?;";
	
}
