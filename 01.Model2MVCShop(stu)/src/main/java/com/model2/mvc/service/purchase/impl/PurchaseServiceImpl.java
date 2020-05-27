package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDAO;

	public PurchaseServiceImpl() {
	}

	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDAO.addPurchase(purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDAO.getPurchase(tranNo);
	}

	public Purchase getPurchase2(int ProdNo) throws Exception {
		return purchaseDAO.getPurchase(ProdNo);
	}

	public Map<String , Object> getPurchaseList(Search search,String buyerId) throws Exception {
		List<Purchase> list = purchaseDAO.getPurchaseList(search, buyerId);
		int totalCount = purchaseDAO.getTotalCount(search,buyerId);
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("totalCount", totalCount);
		map.put("list", list);
		return map;
	}

	public Map<String, Object> getSaleList(Search search) throws Exception {
		return purchaseDAO.getSaleList(search);
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDAO.updatePurchase(purchase);
	}

	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDAO.updateTranCode(purchase);
	}

}
