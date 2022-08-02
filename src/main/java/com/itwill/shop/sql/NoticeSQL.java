package com.itwill.shop.sql;
/*
-- 전체 공지 리스트
select * from notice;

-- pk로 공지 제목, 내용 변경
update notice set n_title='공지1 제목 변경', n_content='공지1 내용 변경' where n_no = 1;

-- pk로 공지 삭제
delete from notice where n_no=2;
 */
public class NoticeSQL {
	
	public static final String NOTICE_SELECT_All = 
			"select * from notice;";
	
	public static final String NOTICE_UPDATE_BY_NO = 
			"update notice set n_title=?, n_content=? where n_no = ?;";
	
	public static final String NOTICE_DELETE_BY_NO= 
			"delete from notice where n_no=?;";
}
