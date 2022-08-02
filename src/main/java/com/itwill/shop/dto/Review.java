package com.itwill.shop.dto;
/*
 이름        널?       유형             

--------- -------- -------------- 
R_NO      NOT NULL NUMBER(10)     
R_TITLE            VARCHAR2(100)  
R_CONTENT          VARCHAR2(1000) 
U_ID               VARCHAR2(50)   
OI_NO              NUMBER(10)     
*/

public class Review {
	private int r_no;
	private String r_title;
	private String r_content;
	private UserInfo userInfo;
	private OrderItem orderItem;
	
	public Review() {
		
	}

	public Review(int r_no, String r_title, String r_content, UserInfo userInfo, OrderItem orderItem) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_content = r_content;
		this.userInfo = userInfo;
		this.orderItem = orderItem;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	@Override
	public String toString() {
		return "review [r_no=" + r_no + ", r_title=" + r_title + ", r_content=" + r_content + ", u_id=" + userInfo
				+ ", oi_no=" + orderItem + "]";
	}
	
	
	
}
