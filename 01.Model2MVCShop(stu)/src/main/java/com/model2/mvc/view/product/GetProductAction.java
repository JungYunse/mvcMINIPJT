//package com.model2.mvc.view.product;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.model2.mvc.framework.Action;
//import com.model2.mvc.service.domain.Product;
//import com.model2.mvc.service.domain.Purchase;
//import com.model2.mvc.service.product.ProductService;
//import com.model2.mvc.service.product.impl.ProductServiceImpl;
//import com.model2.mvc.service.purchase.PurchaseService;
//import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
//
//public class GetProductAction extends Action {
//
//	/// execute() O/R
//	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
//
//		ProductService prodService = new ProductServiceImpl();
//		Product prod = prodService.getProduct(prodNo);
//
//		PurchaseService purchaseService = new PurchaseServiceImpl();
//
//		request.setAttribute("vo", prod);
//
//		return "forward:/product/getProduct.jsp";// 이동할 JSP 페이지 URI 작성!
//	}
//
//}
