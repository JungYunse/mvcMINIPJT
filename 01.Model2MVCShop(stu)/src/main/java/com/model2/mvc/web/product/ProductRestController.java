package com.model2.mvc.web.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService prodService;
	
	public ProductRestController() {
		System.out.println("[ "+this.getClass()+" ] ½ÇÇà!");
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}" , method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		System.out.println("/product/json/getProduct : GET");
		
		return prodService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public boolean addProduct(@RequestBody Product product)throws Exception{
		System.out.println("/product/json/addProduct : POST");
		
		prodService.addProduct(product);
		if(!product.equals(null)||!product.equals("")) {
			return true;
		}else {
			return false;
		}
	}
	
	

}
