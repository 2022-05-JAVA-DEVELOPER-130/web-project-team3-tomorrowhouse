package com.itwill.shop.dto;

import java.util.Date;

/*
이름         널?       유형            
---------- -------- ------------- 
Q_NO       NOT NULL NUMBER(10)    
Q_TITLE             VARCHAR2(100) 
Q_CONTENT           VARCHAR2(10)  
Q_DATE              DATE          
Q_CATEGORY          VARCHAR2(10)  
U_ID                VARCHAR2(50)  
 */
public class Qna {
	private int q_no;
	private String q_title;
	private String q_content;
	private Date q_date;
	private String q_category;
	private UserInfo userInfo;
	
	public Qna() {
		
	}

	public Qna(int q_no, String q_title, String q_content, Date q_date, String q_category, UserInfo userInfo) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_category = q_category;
		this.userInfo = userInfo;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setU_id(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "qna [q_no=" + q_no + ", q_title=" + q_title + ", q_content=" + q_content + ", q_date=" + q_date
				+ ", q_category=" + q_category + ", u_id=" + userInfo + "]";
	}
	
	
}
