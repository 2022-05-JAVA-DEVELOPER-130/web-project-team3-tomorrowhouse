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
	
	/* ------ review insert------ */
	//8.리뷰 작성
	//insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰1', '리뷰1 내용', 'test1', 1);
	
	public static final String CREATE_REVIEW =
			"insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, ?, ?, ?, ?)";
	
	
	/* ------ review select------ */
	//1.(마이페이지-리뷰list) 로그인한 회원이 마이페이지?에서 리뷰를 모아서 볼 수 있음 -> u_id로 review 선택
	//select * from review where u_id = 'test6';
	public static final String SELECT_ALL_BY_USER_ID =
			"select * from review where u_id = ?";
	
	
	//2.(마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=22;
	
	public static final String SELECT_BY_ORDER_ITEM_NO =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=?";
	
	
	//3.(상품detail-리뷰list) 상품목록에서 리뷰를 보여주려면, p_no로 접근
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=1;
	
	public static final String SELECT_BY_PRODUCT_NO =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=?";
	
	//4.(상품detail-리뷰detail) 리뷰list에서 r_no로 접근
	//select * from review where r_no=26;
	
	public static final String SELECT_BY_REVIEW_NO =
			"select * from review where r_no=?";
	
	/* ----- review update ----*/
	
	//-- update는 후기목록에서 선택할테니, pk이인 r_no로 접근해야하는건 아닌가?
	//update review set r_title = '9번 리뷰 제목_수정', r_content = '9번 리뷰 내용_수정' where r_no= 9;
	//5.후기detail에서 r_no로 후기 업데이트
	public static final String UPDATE_BY_REVIEW_NO =
			"update review set r_title = ?, r_content = ? where r_no= ?";
	
	
	/* ----- review delete ----*/
	//6. u_id로 후기 전체삭제
	//delete from review where u_id = 'test1';
	
	public static final String DELETE_BY_USER_ID =
			"delete from review where u_id = ?";
	
	//7.r_no로 후기 1개삭제
	//select * from review where r_no=26;
	
	public static final String DELETE_BY_REVIEW_NO =
			"delete from review where r_no=?";
	
}
