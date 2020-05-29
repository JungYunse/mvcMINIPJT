package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;
@Controller
public class PurchaseController {
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	///Constructor
	public PurchaseController() {
		// TODO Auto-generated constructor stub
		System.out.println("[ "+this.getClass()+" ] 실행");
	}
	
	//Page 정보를 여기서 Parsing 해오자 라는 의미.
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping("/addPurchaseView.do")
	public String addPurchaseView(	@RequestParam("prodNo")int prodNo ,
									@Param("user.userId")String userId
									,HttpServletRequest request
									,HttpServletResponse response
									,Model model 
									,HttpSession session) throws Exception {
		System.out.println("/addPurchaseView.do");
		System.out.println("!!"+prodNo);
		System.out.println("!@!"+userId);
		
		Product prod = productService.getProduct(prodNo);
		Purchase purchase = new Purchase();
		request.setAttribute("product", prod);
		
		
		model.addAttribute("purch",purchase);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping("/addPurchase.do")
	public String addPurchase(	
								@ModelAttribute("purch") Purchase purchase
								,HttpServletRequest request 
								,HttpServletResponse response
								,Model model) throws Exception {
		System.out.println("/addPurchase.do");
		
		
		System.out.println("!!@@"+purchase);
		//purchaseService.addPurchase(purchase);
		
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	@RequestMapping("/getPurchase.do")
	public String getPurchase(@Param("tranNo")int tranNo , Model model) throws Exception {
		System.out.println("/getProduct.do");
		Purchase purchase = purchaseService.getPurchase(tranNo);
		model.addAttribute("purchase", purchase);
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping("/listPurchase.do")
	public String listPurchase(@ModelAttribute("search") Search search , Model model , HttpServletRequest request,String buyerId) throws Exception {
		
		System.out.println("/listProduct.do");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit , pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list" , map.get("list"));
		model.addAttribute("resultPage" , resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
		
	}
	
	@RequestMapping("/updatePurchaseView.do")
	public String updatePurchaseView(@Param("prodNo")int prodNo , Model model) throws Exception {
		System.out.println("/updateProductView.do");
		Purchase purchase = purchaseService.getPurchase(prodNo);
		
		model.addAttribute("purchase",purchase);
		System.out.println(""+ purchase);
		
		return "forward:/purchase/updatePurchase.jsp";
	}
	
	@RequestMapping("/updatePurchase.do")
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase , Model model ) throws Exception {
		System.out.println("/updateProduct.do");
		purchaseService.updatePurchase(purchase);
		
		return "redirect:/getPurchase.do?tranNo="+purchase.getTranNo();
	}
	
}
