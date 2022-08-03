package com.itwill.shop.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.UserInfo;
import com.itwill.shop.sql.UserInfoSQL;
/*
 사용자관리에서 데이타베이스와의 작업을 전담하는 클래스
 USERINFO 테이블에 사용자를 추가,삭제,검색,수정등의 작업을한다.
 */
public class UserInfoDao {
	/*
	 * - DataSource객체 : Connection을 반환해주는객체
	 * - 톰캣에서제공하는 DataSource 객체사용
	 */
	private DataSource dataSource;

	public UserInfoDao() throws Exception {
		/******Apache BasicDataSource*****/
		BasicDataSource basicDataSource=new BasicDataSource();
		
		Properties properties=new Properties();
		properties.load(UserInfoDao.class.getResourceAsStream("jdbc.properties"));
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
		
	}

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	public int create(UserInfo userinfo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		try {
			/*
			 * 예외발생 예상코드
			 */
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_INSERT);
			pstmt.setString(1, userinfo.getU_id());
			pstmt.setString(2, userinfo.getU_pw());
			pstmt.setString(3, userinfo.getU_name());
			pstmt.setString(4, userinfo.getU_email());
			pstmt.setString(5, userinfo.getU_address());
			pstmt.setString(6, userinfo.getU_phone());
			insertRowCount = pstmt.executeUpdate();
		} finally {
			/*
			 * 예외발생과 관계없이 반드시 실행되는 코드
			 */
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return insertRowCount;
	}

	/*
	 * 기존의 사용자 정보를 수정
	 */
	public int update(UserInfo userinfo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			/*
			 * 예외발생 예상코드
			 */
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_UPDATE);
			pstmt.setString(1, userinfo.getU_pw());
			pstmt.setString(2, userinfo.getU_name());
			pstmt.setString(3, userinfo.getU_email());
			pstmt.setString(4, userinfo.getU_id());
			pstmt.setString(5, userinfo.getU_address());
			pstmt.setString(6, userinfo.getU_phone());
			updateRowCount = pstmt.executeUpdate();
		} finally {
			/*
			 * 예외발생과 관계없이 반드시 실행되는 코드
			 */
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}

	/*
	 * 사용자 아이디에 해당하는 사용자를 삭제
	 */
	public int remove(String u_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int removeRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_DELETE);
			pstmt.setString(1, u_id);
			removeRowCount = pstmt.executeUpdate();

		} finally {
			/*
			 * 예외발생과 관계없이 반드시 실행되는 코드
			 */
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		}
		return removeRowCount;
	}

	/*
	 * 사용자아이디에해당하는 정보를 데이타베이스에서 찾아서 UserInfo 도메인클래스에 저장하여 반환
	 */
	public UserInfo findUser(String u_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo findUser = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_BY_ID);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findUser = new UserInfo(rs.getString("u_id"), 
										rs.getString("u_pw"), 
										rs.getString("u_name"),
										rs.getString("u_email"),
										rs.getString("u_address"),
										rs.getString("u_phone"));

			}
		} finally {
			/*
			 * 예외발생과 관계없이 반드시 실행되는 코드
			 */
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findUser;
	}

	/*
	 * 모든사용자 정보를 데이타베이스에서 찾아서 List<UserInfo> 콜렉션 에 저장하여 반환
	 */
	public ArrayList<UserInfo> findUserInfoList() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserInfo> findUserInfoList = new ArrayList<UserInfo>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				findUserInfoList.add(new UserInfo(rs.getString("u_id"),
											  rs.getString("u_pw"), 
											  rs.getString("u_name"),
											  rs.getString("u_email"),
											  rs.getString("u_address"),
											  rs.getString("u_phone")));

			}
		} finally {
			/*
			 * 예외발생과 관계없이 반드시 실행되는 코드
			 */
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findUserInfoList;
	}

	/*
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를 판별
	 */
	public boolean existedUserInfo(String u_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isExist = false;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_BY_ID_COUNT);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("cnt");
			if (count == 1) {
				isExist = true;
			}
		} finally {
			/*
			 * 예외발생과 관계없이 반드시 실행되는 코드
			 */
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return isExist;
	}

}
