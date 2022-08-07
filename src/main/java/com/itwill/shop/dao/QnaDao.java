package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.qna.Qna;
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
		
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_INSERT);
		pstmt.setString(1, qna.getQ_title());
		pstmt.setString(2, qna.getQ_content());
		pstmt.setString(3, qna.getU_id());
				
		int createRowCount = pstmt.executeUpdate();
		
		con.close();
		return createRowCount;
	}
	
	public int removeQna(int q_no) throws Exception{

		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(QnaSQL.QNA_DELETE_NO);
			pstmt.setInt(1, q_no);
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;

	}
	
	public int updateQna(Qna qna) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnaSQL.QNA_UPDATE);
			pstmt.setString(1, qna.getQ_title());
			pstmt.setString(2, qna.getQ_content());
			pstmt.setInt(3, qna.getQ_no());
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	
	/**
	 * 게시물 리스트를 반환(게시물시작번호,게시물끝번호)
	 */
	public ArrayList<Qna> findQnaList(int start, int last) throws Exception{
		System.out.println("" + start + " ~ " + last);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;// 조회 결과에 접근하는 참조 변수
		// 데이터베이스의 데이터를 읽어서 저장할 객체 컬렉션
		ArrayList<Qna> qnas = new ArrayList<Qna>();

		try {
			con = dataSource.getConnection();
			// String sql="select boardno,title,groupno,step,depth from board order by groupno desc";

			

			pstmt = con.prepareStatement(QnaSQL.QNA_SELECT_ALL);
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Qna qna = new Qna();
				qna.setQ_no(rs.getInt(2));
				qna.setQ_title(rs.getString(3));
				qna.setU_id(rs.getString(4));
				qna.setQ_date(rs.getDate(5));
				qna.setQ_readcount(rs.getInt(6));
				qna.setQ_groupno(rs.getInt(7));
				qna.setQ_step(rs.getInt(8));
				qna.setQ_depth(rs.getInt(9));

				qnas.add(qna);
			}
		} finally {
			// 6. 연결닫기
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
		}
		// System.out.println(boards);
		return qnas;
	}
	/**
	 * 게시물 번호에 해당하는 게시물 정보를 반환하는 메써드.
	 */
	public Qna findQna(int q_no) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Qna qna = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnaSQL.QNA_SELECT_BY_NO);
			pstmt.setInt(1, q_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				qna = new Qna();
				qna.setQ_no(rs.getInt(1));
				qna.setQ_title(rs.getString(2));
				qna.setU_id(rs.getString(3));
				qna.setQ_content(rs.getString(4));
				qna.setQ_date(rs.getDate(5));
				qna.setQ_readcount(rs.getInt(6));
				qna.setQ_groupno(rs.getInt(7));
				qna.setQ_step(rs.getInt(8));
				qna.setQ_depth(rs.getInt(9));
			}
		}finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return qna;

	}
}