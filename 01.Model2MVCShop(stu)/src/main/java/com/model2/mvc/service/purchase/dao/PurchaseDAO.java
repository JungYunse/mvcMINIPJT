package com.model2.mvc.service.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

public class PurchaseDAO {

	public PurchaseDAO() {

	}

	public void insertPurchase(Purchase purchase) throws SQLException {

		Connection con = DBUtil.getConnection();

		String sql = "INSERT INTO transaction VALUES(seq_transaction_tran_no.NEXTVAL,?,?,?,?,?,?,?,?,sysdate,?)";

		PreparedStatement stmt = con.prepareStatement(sql);

		stmt.setInt(1, purchase.getPurchaseProd().getProdNo());
		stmt.setString(2, purchase.getBuyer().getUserId());
		System.out.println("getBuyer로 userID = " + purchase.getBuyer().getUserId());
		stmt.setString(3, purchase.getPaymentOption());
		stmt.setString(4, purchase.getReceiverName());
		stmt.setString(5, purchase.getReceiverPhone());
		stmt.setString(6, purchase.getDivyAddr());
		stmt.setString(7, purchase.getDivyRequest());
		System.out.println("Trancode from DAO :" + purchase.getTranCode());
		stmt.setString(8, purchase.getTranCode());
		stmt.setString(9, purchase.getDivyDate());
		stmt.executeUpdate();

		con.close();
	}// end of inserPurchase()

	public Purchase findPurchase(int tranNo) throws SQLException {
		Connection con = DBUtil.getConnection();

		String sql = "select * from transaction where tran_no = ?";
		PreparedStatement stmt = con.prepareStatement(sql);

		stmt.setInt(1, tranNo);

		ResultSet rs = stmt.executeQuery();

		Purchase purchase = null;

		while (rs.next()) {
			purchase = new Purchase();
			purchase.setTranNo(rs.getInt("tran_no"));
			Product prod = new Product();
			prod.setProdNo(rs.getInt("prod_no"));
			purchase.setPurchaseProd(prod);
			User user = new User();
			user.setUserId(rs.getString("buyer_id"));
			purchase.setBuyer(user);
			purchase.setPaymentOption(rs.getString("payment_option"));
			purchase.setReceiverName(rs.getString("receiver_name"));
			purchase.setReceiverPhone(rs.getString("receiver_phone"));
			purchase.setDivyAddr(rs.getString("demailaddr"));
			purchase.setDivyRequest(rs.getString("dlvy_request"));
			purchase.setTranCode(rs.getString("tran_status_code"));
			purchase.setOrderDate(rs.getDate("order_data"));
			purchase.setDivyDate(rs.getString("dlvy_date"));
		}

		System.out.println("PURCHASE GET해보기 ::" + purchase);

		con.close();
		return purchase;
	}// end of findUser() 수정필요
//처음부터 다시봐야함

	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		Connection con = DBUtil.getConnection();

		System.out.println("-_-_-_-_-_-_-");
		System.out.println("buyerId = " + buyerId);
		System.out.println("_-_-_-_-_-_-_");
		// tran_status_code
		String sql = "SELECT buyer_id , receiver_name , receiver_phone , tran_no , tran_status_code  FROM transaction ";
		if (!(buyerId.equals("")) || !(buyerId.equals(null))) {
			sql += (" WHERE buyer_id = '" + buyerId + "' ");
		}

		PreparedStatement stmt = con.prepareStatement(sql);
		System.out.println("표오시1 : " + buyerId);

		ResultSet rs = stmt.executeQuery();

		System.out.println("getPurchaseList SQL문 : " + sql);

		int totalCount = getTotalCount(sql);
		System.out.println("로우의 수:" + totalCount);
		System.out.println("buyerID:" + buyerId);

		List<Purchase> list = new ArrayList<Purchase>();

		while (rs.next()) {
			Purchase purchase = new Purchase();
			User user = new User();
			user.setUserId(rs.getString("buyer_Id"));
			System.out.println("buyer_id" + rs.getString("buyer_id"));
			purchase.setBuyer(user);
			System.out.println("user를 뽑아보자 :" + user.getUserId());
			purchase.setReceiverName(rs.getString(2));
			purchase.setReceiverPhone(rs.getString(3));
			purchase.setTranNo(rs.getInt(4));
			String a = rs.getString(5);
			a = a.trim();
			System.out.println("a를뽑자 : " + a);
			purchase.setTranCode(a);
			// 배송현황
			// 정보수정
			//
			list.add(purchase);

		}
		System.out.println("확인");
		// ==> totalCount 정보 저장
		map.put("totalCount", new Integer(totalCount));
		// ==> currentPage 의 게시물 정보 갖는 List 저장
		map.put("list", list);

		rs.close();
		stmt.close();
		con.close();

		return map;
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		System.out.println("I was at the UpdatePurchaseDAO!");
		Connection con = DBUtil.getConnection();

		System.out.println("========");
//		
//		System.out.println("구매자아이디 고정 : "+purchase.getBuyer().getUserId());
//		System.out.println("구매방법 : "+purchase.getPaymentOption());
		System.out.println("구매자이름 : " + purchase.getReceiverName());
		System.out.println("구매자연락처 : " + purchase.getReceiverPhone());
		System.out.println("구매자주소 : " + purchase.getDivyAddr());
		System.out.println("구매요청사항 : " + purchase.getDivyRequest());
		System.out.println("구매번호 :" + purchase.getTranNo());
//		
		System.out.println("========");

		String sql = "UPDATE transaction SET receiver_name = ? , receiver_phone = ? ,  demailaddr = ? , dlvy_date = ? , dlvy_request =? where tran_no =?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, purchase.getReceiverName());
		stmt.setString(2, purchase.getReceiverPhone());
		stmt.setString(3, purchase.getDivyAddr());
		stmt.setString(4, purchase.getDivyDate().replace("-", ""));
		stmt.setString(5, purchase.getDivyRequest());
		stmt.setInt(6, purchase.getTranNo());

		int updateCount = stmt.executeUpdate();

		/// 업데이트 되면 업데이트한만큼 숫자줌
		if (updateCount > 1) {
			System.out.println("I went Through to the DataBase!");
			System.out.println("됬나? updateCount = " + updateCount);
		} else if (updateCount == 0) {
			System.out.println("DB에 업데이트 실패");
		}
		con.close();
	}

	public void updateTranCode(Purchase purchase) throws Exception {
		System.out.println("I was at the UpdatePurchaseDAO!");
		Connection con = DBUtil.getConnection();
		String sql = "UPDATE transaction SET tran_status_code = ? where prod_no =?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, purchase.getTranCode());
		stmt.setInt(2, purchase.getPurchaseProd().getProdNo());

		int updateCount = stmt.executeUpdate();

		/// 업데이트 되면 업데이트한만큼 숫자줌
		if (updateCount > 1) {
			System.out.println("I went Through to the DataBase!");
			System.out.println("됬나? updateCount = " + updateCount);
		} else if (updateCount == 0) {
			System.out.println("DB에 업데이트 실패");
		}

		con.close();
	}

	private int getTotalCount(String sql) throws Exception {
		System.out.println("getTotalCount SQL문 : " + sql);
		sql = "SELECT COUNT(*) " + "FROM ( " + sql + ") countTable";

		Connection con = DBUtil.getConnection();
		PreparedStatement pStmt = con.prepareStatement(sql);

		ResultSet rs = pStmt.executeQuery();

		int totalCount = 0;
		if (rs.next()) {
			totalCount = rs.getInt(1);
		}
		System.out.println("I was at the getTotalCount");
		pStmt.close();
		con.close();
		rs.close();

		return totalCount;
	}

	// 게시판 currentPage Row 만 return
	private String makeCurrentPageSql(String sql, Search search) {
		sql = "SELECT * " + "FROM (		SELECT inner_table. * ,  ROWNUM AS row_seq " + " 	FROM (	" + sql
				+ " ) inner_table " + "	WHERE ROWNUM <=" + search.getCurrentPage() * search.getPageSize() + " ) "
				+ "WHERE row_seq BETWEEN " + ((search.getCurrentPage() - 1) * search.getPageSize() + 1) + " AND "
				+ search.getCurrentPage() * search.getPageSize();

		System.out.println("UserDAO :: make SQL :: " + sql);

		return sql;
	}

	public Map<String, Object> getPurchaseList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

}// end of class
