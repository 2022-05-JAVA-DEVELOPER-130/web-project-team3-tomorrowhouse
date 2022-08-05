package com.itwill.shop.dao.test;

import java.util.Date;

import com.itwill.shop.dao.QnaDao;
import com.itwill.shop.dto.Qna;

public class QnaDaoTestMain {

	public static void main(String[] args) throws Exception{
		QnaDao qnaDao = new QnaDao();
		System.out.println(qnaDao.createQna(new Qna()));
	}

}
