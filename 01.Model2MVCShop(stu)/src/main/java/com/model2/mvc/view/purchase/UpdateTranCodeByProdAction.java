package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdateTranCodeByProdAction extends Action {

	// execute()O/R
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println();
		int num = Integer.parseInt(request.getParameter("prodNo"));
		Product prod = new Product();
		prod.setProdNo(num);

		Purchase purchase = new Purchase();
		purchase.setPurchaseProd(prod);
		purchase.setTranCode(request.getParameter("tranCode"));

		PurchaseService purchaseService = new PurchaseServiceImpl();
		purchaseService.updateTranCode(purchase);
		return "redirect:/product/listProduct.jsp";
	}

}
