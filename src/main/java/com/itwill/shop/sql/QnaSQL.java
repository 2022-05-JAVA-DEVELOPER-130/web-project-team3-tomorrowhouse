package com.itwill.shop.sql;

public class QnaSQL {
	public static final String QNA_INSERT =
			"insert into qna(q_no, q_title, q_content, q_groupno, q_step, q_depth, u_id) values(qna_q_no_seq.nextval, ?, ?, qna_q_no_seq.currval, 1, 0, ?)";

	public static final String QNA_SELECT_ALL = 
			"select * FROM (SELECT rownum idx, s.* FROM(SELECT q_no, q_title, u_id, q_date, q_readcount, q_groupno, q_step, q_depth FROM qna ORDER BY q_groupno DESC, q_step ASC)s)WHERE idx >= ? AND idx <= ?)";
	
	public static final String QNA_DELETE_NO = "DELETE qna WHERE q_no = ?";
	
	public static final String QNA_UPDATE = "UPDATE qna SET q_title = ?, q_content = ? WHERE q_no = ?";
	
	public static final String QNA_SELECT_BY_NO = "SELECT q_no, q_title, u_id, q_content, q_date, q_readcount, q_groupno, q_step, q_depth FROM board WHERE q_no = ?";
/*	
	public static final String QNA_SELECT_ALL_USER_BY_ID = 
			"select * from qna where u_id = ?";
	// test1의 모든 문의 리스트 >> MyPage에서 출력

	
	public static final String QNA_SELECT_BY_NO_USER_BY_ID = 
			"select * from qna where u_id = ? and q_no = ?;";
	// test1의 문의 pk로 1개 출력 >> ??????
	
	
	public static final String QNA_UPDATE_BY_NO_AND_ID = 
			"update qna set q_title = ?, q_content = ?, q_category = ? where u_id = ? and q_no = ?";
	// test2의 문의 1개 pk로 변경
	
	public static final String QNA_DELETE_BY_NO_AND_ID = 
			"delete from qna where u_id=? and q_no = ?";
	// test1의 문의 pk로 1개 삭제
*/
}
