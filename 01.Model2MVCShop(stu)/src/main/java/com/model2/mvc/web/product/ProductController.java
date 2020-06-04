package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
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
import com.model2.mvc.service.product.impl.ProductServiceImpl;
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
//	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
//	public String addProduct(@ModelAttribute("product") Product product, Model model) throws Exception {
//		productService.addProduct(product);
//		//model.addAttribute("product", product);
//		return "forward:/product/addProduct.jsp";
//	}
//	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("/product/addProduct : POST");
		
		if(FileUpload.isMultipartContent(request)) {
			String temDir ="C:\\Users\\user\\git\\mvcMINIPJT\\01.Model2MVCShop(stu)\\WebContent\\images\\uploadFiles\\";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setSizeMax(1024*1024*10);
			fileUpload.setSizeThreshold(1024*100);
			
			if(request.getContentLength() < fileUpload.getSizeMax()) {
				Product prod = new Product();
				
				StringTokenizer token = null;
				
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				for(int i =0; i<Size;i++) {
					FileItem fileItem = (FileItem)fileItemList.get(i);
					
					if(fileItem.isFormField()) {
						if(fileItem.getFieldName().equals("manuDate")) {
							token = new StringTokenizer(fileItem.getString("euc-kr"),"-");
							System.out.println("\n!!!!!"+token+"\n");
							String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
							prod.setManuDate(manuDate);
							System.out.println("\n!!!!!!!!"+manuDate);
						}else if(fileItem.getFieldName().equals("prodName"))
							prod.setProdName(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("prodDetail"))
							prod.setProdDetail(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("price"))
							prod.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
					}else {
						if(fileItem.getSize()>0) {
							int idx=fileItem.getName().lastIndexOf("\\");
							if(idx==-1) {
								idx=fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx+1);
							prod.setFileName(fileName);
							try {
								File uploadedFile = new File(temDir,fileName);
								fileItem.write(uploadedFile);
							}catch(IOException e) {
								System.out.println(e);
							}
							
						}else {
							prod.setFileName("../../images/empty.GIF");
						}
						
					}
					
				}				
				
				System.out.println("!)@(#*@"+prod);
				productService.addProduct(prod);
				
				System.out.println("\n\n ssss"+prod.getProdNo());
				prod = productService.getProduct(prod.getProdNo()+1);
				
				System.out.println("\n!######"+prod+"\n");
				request.setAttribute("prod", prod);
			}else {
				int overSize = (request.getContentLength()/1000000);
				System.out.println("<script>alert('파일의 크기는 1MB 까지 입니다. 올리신 파일 용량은 ')"+overSize+" MB 입니다.");
				System.out.println("history.back()</script>");
			}
		}else {
			System.out.println("인코딩 타입이 multipart/form-data 가 아닙니다.");
		}
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
