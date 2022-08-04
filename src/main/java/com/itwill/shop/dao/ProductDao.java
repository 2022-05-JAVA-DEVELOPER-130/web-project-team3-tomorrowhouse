package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.Category;
import com.itwill.shop.dto.Product;
import com.itwill.shop.sql.ProductSQL;


public class ProductDao {
	
	private DataSource dataSource;
	public ProductDao() throws Exception{
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
	//상품전체리스트출력
	public List<Product> productSelectAll() throws Exception {
		List<Product> productList = new ArrayList<Product>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productList.add(new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_desc"),
										rs.getInt("p_click_count"),
										new Category(rs.getInt("cg_no"),null)
										)
							);
		}
		rs.close();
		con.close();
		pstmt.close();
		return productList;
	}
	
	
	//상품번호(p_no)로 1개 출력
	public Product productSelectByNo(Product product) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NO);
		pstmt.setInt(1, product.getP_no());
		ResultSet rs = pstmt.executeQuery();
		Product findProductNo = null;
		if(rs.next()) {
			findProductNo = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_desc"),
										rs.getInt("p_click_count"),
										new Category(rs.getInt("cg_no"),null)
										);
		}
		rs.close();
		con.close();
		pstmt.close();
		return findProductNo;
	}
	
	
	//상품이름(p_name)로 1개 출력
	public Product productSelectByName(Product product) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NAME);
		pstmt.setString(1, product.getP_name());
		ResultSet rs = pstmt.executeQuery();
		Product findProductName = null;
		if(rs.next()) {
			findProductName = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_desc"),
										rs.getInt("p_click_count"),
										new Category(rs.getInt("cg_no"),null)
										);
		}
		rs.close();
		con.close();
		pstmt.close();
		return findProductName;
	}

	public List<Product> selectAllByCgNo(int cg_no)throws Exception{
		List<Product> productList = new ArrayList<>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL_BY_CG_NO);
		pstmt.setInt(1, cg_no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productList.add(
					new Product(rs.getInt("p_no"),
								rs.getString("p_name"),
								rs.getInt("p_price"),
								rs.getString("p_image"),
								rs.getString("p_desc"),
								rs.getInt("p_click_count"),
								new Category(rs.getInt("cg_no"),
											 null)));
		}
		con.close();
		return productList;
	}
	
	
	
	
		//InsertProduct - 새상품추가(관리자 전용)
		public int insertProduct(Product product) throws Exception {
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_INSERT);
			//"insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values (product_p_no_seq.nextval,?,?,?,?,?,?)";
			pstmt.setString(1, product.getP_name());
			pstmt.setInt(2, product.getP_price());
			pstmt.setString(3, product.getP_image());
			pstmt.setString(4, product.getP_desc());					
			pstmt.setInt(5, product.getP_click_count());
			pstmt.setInt(6, product.getCategory().getCg_no());
			int rowCount=pstmt.executeUpdate();
			con.close();
			return rowCount;
		}
			
	
	
		//UpdateProduct - 상품번호로 수정(관리자 전용)
		public int updateProduct(Product product)throws Exception {
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_UPDATE_BY_NO);
			pstmt.setString(1, product.getP_name());
			pstmt.setInt(2, product.getP_price());
			pstmt.setString(3, product.getP_image());
			pstmt.setString(4, product.getP_desc());
			pstmt.setInt(5, product.getCategory().getCg_no());
			pstmt.setInt(6, product.getP_no());
			int rowCount = pstmt.executeUpdate();
			con.close();
			return rowCount;
		}
		
		//DeleteProduct - 상품번호로 삭제(관리자 전용)
		public int deleteProduct(Product product)throws Exception {
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt= con.prepareStatement(ProductSQL.PRODUCT_DELETE_BY_NO);
			pstmt.setInt(1, product.getP_no());
			int rowCount = pstmt.executeUpdate();
			con.close();
			return rowCount;
		}
	
		//Click_count "update product set p_click_count=p_click_count+? where p_no =?"
		// 상품번호 기준 클릭수 증감(관리자 전용)
		public int clickCount(Product product) throws Exception{
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_CLICK_COUNT);
			pstmt.setInt(1, product.getP_click_count());
			pstmt.setInt(2, product.getP_no());
			int rowCount = pstmt.executeUpdate();
			con.close();
			return rowCount;
		}
		
		
		
		 //product 검색기능 - 상품명만
		 //public final static String PRODUCT_SERCH = "select * from product where p_name like ?";
		
		public List<Product> productSerch(String keyword) throws Exception {
			List<Product> productSerchList = new ArrayList<Product>();
						Connection con = dataSource.getConnection();
			PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SERCH);
			pstmt.setString(1, "%"+keyword+"%");
			ResultSet rs = pstmt.executeQuery();
			
			try {
			
				while(rs.next()) {
					Product product = (new Product(rs.getInt("p_no"),
							                rs.getString("p_name"),
							                rs.getInt("p_price"),
							                rs.getString("p_image"),
							                rs.getString("p_desc"),
							                rs.getInt("p_click_count"),
							                new Category(rs.getInt("cg_no"), null)));
				productSerchList.add(product);
			  }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}
			return productSerchList;
		} //method fin
		 
		
		
		
		
}//