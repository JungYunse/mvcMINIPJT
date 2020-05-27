//package com.model2.mvc.view.product;
//
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.Date;
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
//public class AddProductAction extends Action {
//
//	/// execute() O/R
//	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//		Product prod = new Product();
//		// prodVO.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
//		prod.setProdName(request.getParameter("prodName"));
//		// System.out.println("AddProductActionø°º≠ ªÃ¿∫ ProdVO: "+
//		// prodVO.getProdName()+prodVO.getPrice());
//		prod.setProdDetail(request.getParameter("prodDetail"));
//		prod.setManuDate(request.getParameter("manuDate"));
//		// try {
//		prod.setPrice(Integer.parseInt(request.getParameter("price")));
//		System.out.println("PRICE =[" + prod.getPrice() + "]");
//
//		// }catch(NumberFormatException e) {
//		// e.printStackTrace();
//		// }
//		prod.setFileName(request.getParameter("fileName"));
//
//		HttpSession session = request.getSession();
//		session.setAttribute("vo", prod);
//
//		// System.out.println("AddProductActionø°º≠ ªÃ¿∫ ProdVO: "+
//		// prodVO.getProdName()+prodVO.getPrice());
//
//		ProductService service = new ProductServiceImpl();
//		service.addProduct(prod);
//
//		return "redirect:/product/addProduct.jsp";
//	}
//
//}
