//package com.model2.mvc.view.product;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.model2.mvc.framework.Action;
//import com.model2.mvc.service.domain.Product;
//import com.model2.mvc.service.product.ProductService;
//import com.model2.mvc.service.product.impl.ProductServiceImpl;
//
//public class UpdateProductAction extends Action {
//
//	/// execute() O/R
//	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
////		System.out.println("I was in UPDATEPRODUCT ACTION!");
//		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
//
//		Product prod = new Product();
//
////		HttpSession session = request.getSession();
////		int sessionID = ((ProductVO)session.getAttribute("prod")).getProdNo();
////		
//
//		prod.setProdNo(prodNo);
//		prod.setProdName(request.getParameter("prodName"));
//		prod.setProdDetail(request.getParameter("prodDetail"));
//		prod.setManuDate(request.getParameter("manuDate"));
//		prod.setPrice(Integer.parseInt(request.getParameter("price")));
//		prod.setFileName(request.getParameter("fileName"));
//
//		ProductService service = new ProductServiceImpl();
//		service.updateProduct(prod);
//
//		HttpSession session = request.getSession();
//		int sessionID = ((Product) session.getAttribute("prod")).getProdNo();
//
////	System.out.println("UPA prodDetail 1 = "+ prodVO.getProdDetail());
//		if (sessionID == prodNo) {
//			session.setAttribute("prod", prod);
//		}
////	System.out.println("UPA prodNo = "+prodVO.getProdNo());
////	System.out.println("UPA prodDetail = 2 "+ prodVO.getProdDetail());
////	System.out.println("I was in UPDATEPRODUCTACTION!");
//		return "redirect:/getProduct.do?prodNo=" + prodNo + "&menu=manage";
//
//	}
//}