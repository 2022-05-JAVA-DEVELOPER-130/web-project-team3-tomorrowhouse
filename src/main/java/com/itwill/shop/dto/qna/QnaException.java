package com.itwill.shop.dto.qna;

// 회원에 관련된 사용자 정의 예외 클래스
public class QnaException extends Exception {
	public QnaException(){
		this("게시판 관련 에러 발생");
	}
	public QnaException(String errorMsg){
		super(errorMsg);
	}
	public QnaException(String errorMsg, Throwable cause){
		super(errorMsg, cause);
	}	
}
