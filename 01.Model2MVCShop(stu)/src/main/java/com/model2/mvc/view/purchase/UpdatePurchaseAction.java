package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdatePurchaseAction extends Action {
	// execute() O/R
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Purchase purchase = new Purchase();

		PurchaseService purchaseService = new PurchaseServiceImpl();
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));
		purchase.setTranNo(tranNo);
		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setDivyAddr(request.getParameter("divyAddr"));
		purchase.setDivyDate(request.getParameter("divyDate"));
		purchase.setDivyRequest(request.getParameter("divyRequest"));

		purchaseService.updatePurchase(purchase);
		request.setAttribute("updated", purchase);

		System.out.println("UpdateAction에서구매번호 : " + tranNo);

		return "redirect:/getPurchase.do?tranNo=" + tranNo;
	}
}
