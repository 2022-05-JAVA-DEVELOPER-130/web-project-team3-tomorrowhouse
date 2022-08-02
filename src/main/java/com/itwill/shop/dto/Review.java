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
	/*
		이름        널?       유형             
		--------- -------- -------------- 
		R_NO      NOT NULL NUMBER(10)     
		R_TITLE            VARCHAR2(100)  
		R_CONTENT          VARCHAR2(1000) 
		U_ID               VARCHAR2(50) -(fk)  
		OI_NO              NUMBER(10) 	-(fk)
	 */
	private int r_no;
	private String r_title;
	private String r_content;
	private String u_id;
	
	private OrderItem orderItem;	// oi_no
	/*
		private int oi_no;
		private int oi_qty;
		private int o_no;
		
		private Product product;
	 */
	
	public Review() {
		
	}

	public Review(int r_no, String r_title, String r_content, String u_id, OrderItem orderItem) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_content = r_content;
		this.u_id = u_id;
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

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", r_title=" + r_title + ", r_content=" + r_content + ", u_id=" + u_id
				+ ", orderItem=" + orderItem + "]";
	}

	
	
}
