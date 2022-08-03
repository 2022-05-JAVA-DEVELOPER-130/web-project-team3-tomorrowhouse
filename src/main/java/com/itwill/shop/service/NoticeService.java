package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.NoticeDao;
import com.itwill.shop.dto.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
	
	//공지사항 전체출력
	public List<Notice> selectAll() throws Exception {
		return noticeDao.selectAll();
	}
	//공지사항 한개출력
	public Notice selectByNo(int no)throws Exception {
		return noticeDao.selectByNNo(no);
	}
	//공지사항 추가
	public int insertNotice(Notice notice)throws Exception {
		return noticeDao.insert(notice);
	}
	//공지사항 변경
	public int updateNotice(Notice notice)throws Exception {
		return noticeDao.update(notice);
	}
	//공지사항 삭제
	public int deleteNotice(int no)throws Exception {
		return noticeDao.delete(no);
	}
}
