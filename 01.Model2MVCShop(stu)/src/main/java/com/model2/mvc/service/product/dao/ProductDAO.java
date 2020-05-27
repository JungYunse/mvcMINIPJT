//package com.model2.mvc.service.product.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import com.model2.mvc.common.Search;
//import com.model2.mvc.common.util.DBUtil;
//import com.model2.mvc.service.domain.Product;
//import com.model2.mvc.service.domain.User;
//
//public class ProductDAO {
//
//	public ProductDAO() {
//	}
//
//	public void insertProduct(Product prod) throws Exception {
//
//		Connection con = DBUtil.getConnection();
//
//		String sql = "insert into PRODUCT  VALUES (seq_product_prod_no.NEXTVAL, ? , ? , ? , ? , ? , sysdate)";
//
//		PreparedStatement stmt = con.prepareStatement(sql);
//
//		// stmt.setInt(1, prodVO.getProdNo());
//		stmt.setString(1, prod.getProdName());
//		stmt.setString(2, prod.getProdDetail());
//		stmt.setString(3, (prod.getManuDate()).replace("-", ""));
//		stmt.setInt(4, prod.getPrice());
//		stmt.setString(5, prod.getFileName());
//		// 이부분 어케하지?
//		stmt.executeUpdate();
//
//		con.close();
//	}
//
//	public Product findProduct(int prodNo) throws Exception {
//
//		Connection con = DBUtil.getConnection();
//
//		String sql = "select * from PRODUCT where PROD_NO =?";
//
//		PreparedStatement stmt = con.prepareStatement(sql);
//		stmt.setInt(1, prodNo);
//
//		ResultSet rs = stmt.executeQuery();
//
//		Product prod = null;
//		while (rs.next()) {
//			prod = new Product();
//			prod.setProdNo(rs.getInt("PROD_NO"));
//			prod.setProdName(rs.getString("PROD_NAME"));
//			prod.setProdDetail(rs.getString("PROD_DETAIL"));
//			prod.setManuDate(rs.getString("MANUFACTURE_DAY"));
//			prod.setPrice(rs.getInt("PRICE"));
//			prod.setRegDate(rs.getDate("REG_DATE"));
//		}
//
//		con.close();
//
//		return prod;
//	}
//
//	public Map<String, Object> getProductList(Search search) throws Exception {
//
//		Connection con = DBUtil.getConnection();
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		System.out.println("-_-_-_-_-_-_-");
//		System.out.println("Search = " + search);
//		System.out.println("_-_-_-_-_-_-_");
//		// select t.prod_no , t.prod_name, t.price , t.reg_date, p.tran_status_code
//		// from product t, transaction p where t.prod_no = p.prod_no(+);
//		String sql = "select prod.prod_no, prod.prod_name , prod.price , prod.reg_date , purch.tran_status_code from PRODUCT prod ,transaction purch where prod.prod_no = purch.prod_no(+) ";
//		if (search.getSearchCondition() != null) {
//			if (search.getSearchCondition().equals("0") && !search.getSearchKeyword().equals("")) {
//				sql += " AND prod.PROD_NO LIKE '%" + search.getSearchKeyword() + "%'";
//			} else if (search.getSearchCondition().equals("1")) {
//				sql += " AND prod.PROD_NAME LIKE '%" + search.getSearchKeyword() + "%'";
//			} else if (search.getSearchCondition().equals("2")) {
//				sql += " AND prod.PRICE LIKE '%" + search.getSearchKeyword() + "%'";
//			}
//		}
//		sql += " order by prod.PROD_NO";
//
//		System.out.println("prodDAO :: Original SQL = " + sql);
//		int totalCount = this.getTotalCount(sql);
//		System.out.println("로우의 수:" + totalCount);
//		sql = makeCurrentPageSql(sql, search);
//
//		PreparedStatement stmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
//				ResultSet.CONCUR_UPDATABLE);
//		ResultSet rs = stmt.executeQuery();
//
//		List<Product> list = new ArrayList<Product>();
//		while (rs.next()) {
//			Product prod = new Product();
//			prod.setProdNo(rs.getInt(1));
//			prod.setProdName(rs.getString(2));
//			prod.setPrice(rs.getInt(3));
//			prod.setRegDate(rs.getDate(4));
////			String a = rs.getString(5);
////			a = a.trim();
//			if (rs.getString(5) == null || rs.getString(5).equals("")) {
//				prod.setProTranCode("0");
//			} else {
//				prod.setProTranCode(rs.getString(5));
//			}
////			System.out.println("트림 : "+a);
//			list.add(prod);
//		}
//		// ==> totalCount 정보 저장
//		map.put("totalCount", new Integer(totalCount));
//		// ==> currentPage 의 게시물 정보 갖는 List 저장
//		map.put("list", list);
//
//		rs.close();
//		stmt.close();
//		con.close();
//
//		return map;
//	}
//
//	public void updateProduct(Product prod) throws Exception {
//		System.out.println("I was at the UpdateProduct!");
//		Connection con = DBUtil.getConnection();
//
//		System.out.println("========");
//
//		System.out.println("상품번호 : " + prod.getProdNo());
//		System.out.println("상품명 : " + prod.getProdName());
//		System.out.println("상품상세 : " + prod.getProdDetail());
//		System.out.println("상품제작 : " + prod.getManuDate());
//		System.out.println("가격 : " + prod.getPrice());
//		System.out.println("등록일자 : " + prod.getRegDate());
//		System.out.println("========");
//
//		String sql = "UPDATE PRODUCT SET PROD_NAME= ? ,PROD_DETAIL= ? ,MANUFACTURE_DAY= ? ,PRICE= ?  WHERE PROD_NO= ? ";
//
//		PreparedStatement stmt = con.prepareStatement(sql);
//		stmt.setString(1, prod.getProdName());
//		stmt.setString(2, prod.getProdDetail());
//		stmt.setString(3, (prod.getManuDate()).replace("-", ""));
//		stmt.setInt(4, prod.getPrice());
//		stmt.setInt(5, prod.getProdNo());
//		int updateCount = stmt.executeUpdate();
//		/// 업데이트 되면 업데이트한만큼 숫자줌
//		if (updateCount > 1) {
//			System.out.println("I went Through to the DataBase!");
//			System.out.println("됬나? updateCount = " + updateCount);
//
//		}
//		con.close();
//	}
//
//	private int getTotalCount(String sql) throws Exception {
//
//		sql = "SELECT COUNT(*) " + "FROM ( " + sql + ") countTable";
//
//		Connection con = DBUtil.getConnection();
//		PreparedStatement pStmt = con.prepareStatement(sql);
//		ResultSet rs = pStmt.executeQuery();
//
//		int totalCount = 0;
//		if (rs.next()) {
//			totalCount = rs.getInt(1);
//		}
//		pStmt.close();
//		con.close();
//		rs.close();
//		return totalCount;
//	}
//
//	private String makeCurrentPageSql(String sql, Search search) {
//		sql = "SELECT * " + "FROM (		SELECT inner_table. * ,  ROWNUM AS row_seq " + " 	FROM (	" + sql
//				+ " ) inner_table " + "	WHERE ROWNUM <=" + search.getCurrentPage() * search.getPageSize() + " ) "
//				+ "WHERE row_seq BETWEEN " + ((search.getCurrentPage() - 1) * search.getPageSize() + 1) + " AND "
//				+ search.getCurrentPage() * search.getPageSize();
//		System.out.println("UserDAO :: make SQL :: " + sql);
//		return sql;
//	}
//
//}