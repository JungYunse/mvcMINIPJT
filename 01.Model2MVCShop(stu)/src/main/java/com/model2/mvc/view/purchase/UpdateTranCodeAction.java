package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdateTranCodeAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

//		Purchase purchase = new Purchase();
//		Product prod = new Product();

		// System.out.println("request "+request.getAttributeNames());

		System.out.println("1   : " + request.getAttribute("delivery"));
		System.out.println("1      : " + request.getParameter("delivery"));
		System.out.println("2   : " + request.getAttribute("list"));
		// System.out.println("DELIVERY num 1 :
		// "+request.getParameter("prodForPurchase"));
		// prod.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
		// System.out.println("DELIVERY num 2 : "+request.getParameter("prodNo"));

		PurchaseService purchaseService = new PurchaseServiceImpl();

		// purchaseService.updateTranCode(purchase);

		return "redirect:/product/listProduct.jsp";

	}

}
