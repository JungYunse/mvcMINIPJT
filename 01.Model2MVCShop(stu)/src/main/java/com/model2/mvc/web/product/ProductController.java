package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
@Controller
@RequestMapping("/product/*")
public class ProductController {
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	///Constructor
	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println("[ "+this.getClass()+" ] 실행");
	}
	
	//Page 정보를 여기서 Parsing 해오자 라는 의미.
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@RequestMapping("/addProductView.do")
	@RequestMapping(value="/addProduct",method=RequestMethod.GET)
	public String addProduct() {
		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProduct.jsp";
	}
	
	//@RequestMapping("/addProduct.do")
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, Model model) throws Exception {
		System.out.println("/product/addProduct : POST");
		
		productService.addProduct(product);
//		model.addAttribute("product", product);
		return "forward:/product/addProduct.jsp";
	}
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping(value="/getProduct",method=RequestMethod.GET)
	public String getProduct(@Param("prodNo")int prodNo , Model model) throws Exception {
		System.out.println("/product/getProduct : GET");
		Product prod = productService.getProduct(prodNo);
		model.addAttribute("product", prod);
		return "forward:/product/getProduct.jsp";
	}
	
	//@RequestMapping("/listProduct.do")
	@RequestMapping(value="/listProduct")
	public String listProduct(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("/product/listProduct : GET / POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit , pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list" , map.get("list"));
		model.addAttribute("resultPage" , resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
		
	}
	
	//@RequestMapping("/updateProductView.do")
	@RequestMapping(value="/updateProduct",method=RequestMethod.GET)
	public String updateProduct(	@Param("prodNo")int prodNo 
										, Model model) throws Exception {
		System.out.println("/product/updateProduct : GET");
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product",product);
		System.out.println("ㅋㅋ루삥뽕"+ product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping(value="/updateProduct",method=RequestMethod.POST)
	public String updateProduct(	@ModelAttribute("product") Product product 
									, Model model ) throws Exception {
		System.out.println("/product/updateProduct : POST");
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
}
