package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.Notice;
import com.itwill.shop.sql.NoticeSQL;

public class NoticeDao {
	private DataSource dataSource;
	
	public NoticeDao() throws Exception {
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
	
	
	//selectAll
	public List<Notice> selectAll()throws Exception{
		List<Notice> notice = new ArrayList<Notice>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt= con.prepareStatement(NoticeSQL.NOTICE_SELECT_All);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			notice.add(new Notice(rs.getInt("n_no"),
									 rs.getString("n_title"),
									 rs.getString("n_content"),
									 null));
		}
		con.close();
		return notice;
	}
	
	//selectBy_N_no
	public Notice selectByNNo(int n_no)throws Exception{
		Notice notice = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_SELECT_BY_NO);
		pstmt.setInt(1, n_no);
		ResultSet rs= pstmt.executeQuery();
		if(rs.next()) {
			notice = new Notice(rs.getInt("n_no"),
								rs.getString("n_title"),
								rs.getString("n_content"),
								rs.getDate("n_date"));
		}
		con.close();
		return notice;
	}
		
	//insert
	public int insert(Notice notice)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_INSERT);
		pstmt.setString(1, notice.getN_title());
		pstmt.setString(2, notice.getN_content());
		int rowCount =pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
	
	//update 
	public int update(Notice notice)throws Exception{
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_UPDATE_BY_NO);
		pstmt.setString(1, notice.getN_title());
		pstmt.setString(2, notice.getN_content());
		pstmt.setInt(3, notice.getN_no());
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
		
	}
	
	//delete
	public int delete(int n_no)throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt =con.prepareStatement(NoticeSQL.NOTICE_DELETE_BY_NO);
		pstmt.setInt(1, n_no);
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
	
}
