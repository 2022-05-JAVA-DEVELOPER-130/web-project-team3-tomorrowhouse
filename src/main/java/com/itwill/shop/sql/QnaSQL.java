package com.itwill.shop.sql;

public class QnaSQL {
	public static final String QNA_INSERT =
			"insert into qna values(qna_q_no_seq.nextval, ?, ?, null, ?, ?); ";
	
	public static final String QNA_SELECT_ALL = 
			"select * from qna;";
	// 모든 문의 리스트 출력 >> qna_list.jsp 출력
	
	public static final String QNA_SELECT_ALL_USER_BY_ID = 
			"select * from qna where u_id = ?;";
	// test1의 모든 문의 리스트 >> MyPage에서 출력

	/*
	public static final String QNA_SELECT_BY_NO_USER_BY_ID = 
			"select * from qna where u_id = ? and q_no = ?;";
	// test1의 문의 pk로 1개 출력 >> ??????
	*/
	
	public static final String QNA_UPDATE_BY_NO_AND_ID = 
			"update qna set q_title = ?, q_content = ?, q_category = ? where u_id = ? and q_no = ?;";
	// test2의 문의 1개 pk로 변경
	
	public static final String QNA_DELETE_BY_NO_AND_ID = 
			"delete from qna where u_id = ? and q_no = ?;";
	// test1의 문의 pk로 1개 삭제
}
