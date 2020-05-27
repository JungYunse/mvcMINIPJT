//package com.model2.mvc.view.product;
//
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.model2.mvc.common.Page;
//import com.model2.mvc.common.Search;
//import com.model2.mvc.framework.Action;
//import com.model2.mvc.service.product.ProductService;
//import com.model2.mvc.service.product.impl.ProductServiceImpl;
//
//public class ListProductAction extends Action {
//
//	/// execute() O/R
//	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//		Search search = new Search();
//
//		System.out.println("action = " + request.getParameter("searchCondition"));
//		System.out.println("action = " + request.getParameter("searchKeyword"));
//
//		int currentPage = 1;
//		if (request.getParameter("currentPage") != null) {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		}
//
//		search.setCurrentPage(currentPage);
//		search.setSearchCondition(request.getParameter("searchCondition"));
//		search.setSearchKeyword(request.getParameter("searchKeyword"));
//
//		int pageSize = Integer.parseInt(getServletContext().getInitParameter("pageSize"));
//		int pageUnit = Integer.parseInt(getServletContext().getInitParameter("pageUnit"));
//		search.setPageSize(pageSize);
//
//		ProductService service = new ProductServiceImpl();
//		Map<String, Object> map = service.getProductList(search);
//
//		Page resultPage = new Page(currentPage, ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
//
//		System.out.println("ListUserAction ::" + resultPage);
//
//		request.setAttribute("list", map.get("list"));
//		request.setAttribute("resultPage", resultPage);
//		request.setAttribute("search", search);
//		return "forward:/product/listProduct.jsp";
//
//	}
//}