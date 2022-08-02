package com.itwill.shop.sql;
/*
--test1의 모든 질문 리스트
select * from qna where u_id = 'test1';

--test1의 질문 pk로 1개 출력
select * from qna where u_id = 'test1' and q_no=1;

--test2의 질문 1개 pk로 변경
update qna set q_title = '문의 제목 변경', q_content = '문의 내용 변경', q_category = '카테고리 변경' where u_id = 'test2' and q_no=3;

--test1의 질문 pk로 1개 삭제
delete from qna where u_id = 'test1' and q_no=1;
 */
public class QnaSQL {
	
	public static final String QNA_SELECT_ALL_USER_BY_ID = 
			"select * from qna where u_id = ?;";
	
	public static final String QNA_SELECT_BY_NO_USER_BY_ID = 
			"select * from qna where u_id = ? and q_no = ?;";
	
	public static final String QNA_UPDATE_BY_NO_USER_BY_ID = 
			"update qna set q_title = ?, q_content = ?, q_category = ? where u_id = ? and q_no = ?;";
	
	public static final String QNA_DELETE_BY_NO_USER_BY_ID = 
			"delete from qna where u_id = ? and q_no = ?;";
}
