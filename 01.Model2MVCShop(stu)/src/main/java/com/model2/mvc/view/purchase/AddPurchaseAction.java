package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class AddPurchaseAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Purchase purchase = new Purchase();
		Product prod = new Product();
		prod.setProdNo(Integer.parseInt(request.getParameter("prodNo")));

		User user = new User();
		user.setUserId(request.getParameter("userId"));

		purchase.setBuyer(user);
		purchase.setPurchaseProd(prod);

		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));
		purchase.setDivyDate(request.getParameter("receiverDate").replace("-", ""));
		purchase.setPaymentOption(request.getParameter("paymentOption"));
		// purchase.setTranCode(request.getParameter("tranCode"));
		purchase.setTranCode("1");
		HttpSession session = request.getSession();
		session.setAttribute("vo", purchase);

		System.out.println("Purchase¾×¼Ç VO°ª: " + session.getAttribute("vo"));
		PurchaseService service = new PurchaseServiceImpl();
		service.addPurchase(purchase);

		return "redirect:/purchase/addPurchase.jsp";
	}
}
