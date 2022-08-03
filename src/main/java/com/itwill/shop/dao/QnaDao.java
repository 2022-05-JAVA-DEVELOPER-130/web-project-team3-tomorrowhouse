package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.Qna;
import com.itwill.shop.sql.QnaSQL;

public class QnaDao {
	
	private DataSource dataSource;
	
	public QnaDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shop/common/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
		}
	
	public int createQna(Qna qna) throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(QnaSQL.QNA_INSERT);
		pstmt.setString(1, qna.getQ_title());
		pstmt.setString(2, qna.getQ_content());
		pstmt.setDate(3, (Date)qna.getQ_date());
		pstmt.setString(4, qna.getQ_category());
		pstmt.setString(5, qna.getUserInfo().getU_id());
				
		int createRowCount = pstmt.executeUpdate();
		
		con.close();
		return createRowCount;
	}
	
	public int deleteQna(Qna qna) throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt.setString(1, qna.getUserInfo().getU_id());
		pstmt.setInt(2, qna.getQ_no());
		
		int deleteRowCount = pstmt.executeUpdate(); 
		
		con.close();
		return deleteRowCount;
	}
	
	
	
}