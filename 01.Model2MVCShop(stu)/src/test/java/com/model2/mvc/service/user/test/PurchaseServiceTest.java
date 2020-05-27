package com.model2.mvc.service.user.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.sun.glass.ui.Pixels.Format;



/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",  
		 "classpath:config/context-mybatis.xml",  
		 "classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	//@Test
	public void testAddProduct() throws Exception {
		
		Purchase purchase = new Purchase();
		User user = new User();
		Product prod = new Product();
		prod.setProdNo(10000);
		user.setUserId("admin");
		
		purchase.setPurchaseProd(prod);
		purchase.setBuyer(user);
		purchase.setDivyAddr("우리집");
		purchase.setDivyRequest("빨리와요");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		purchase.setDivyDate("20200505");//,sdf.format(date)
		purchase.setPaymentOption("현금");
		purchase.setReceiverName("정정정");
		purchase.setReceiverPhone("01015881588");
		purchase.setTranCode("1");
		purchaseService.addPurchase(purchase);
		purchase = purchaseService.getPurchase(0);
		
		//==> console 확인
		//System.out.println(user);
		
		//==> API 확인
//		Assert.assertEquals("윤세", purchase.getBuyer());
//		Assert.assertEquals("10000", purchase.getPurchaseProd());
//		Assert.assertEquals("우리집", purchase.getDivyAddr());
//		Assert.assertEquals(1000000, purchase.getDivyDate());
//		Assert.assertEquals("경기도", purchase.getDivyRequest());
//		//Assert.assertEquals("",purchase.getOrderDate());
//		Assert.assertEquals("현금", purchase.getPaymentOption());
//		Assert.assertEquals("정정정",purchase.getReceiverName());
//		Assert.assertEquals("01015881588", purchase.getReceiverPhone());
//		Assert.assertEquals("1",purchase.getTranCode());
//		
		
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		System.out.println("-----------GetPurchase-----------");
		Purchase purchase = new Purchase();
	
		
		purchase = purchaseService.getPurchase(10001);

		//==> console 확인
		//==> API 확인
		Assert.assertEquals(10001, purchase.getTranNo());
		Assert.assertEquals("admin", purchase.getBuyer().getUserId());
		Assert.assertEquals(10000, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("정정정", purchase.getReceiverName());
		Assert.assertEquals("현금", purchase.getPaymentOption());
	

		System.out.println("=-=-=-=-=-=-=-=-=-=");
		System.out.println("::"+purchase);
		System.out.println("=-=-=-=-=-=-=-=-=-=");
		System.out.println("-----------GetProduct-----------\n\n");
	}
	
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 System.out.println("-----------UpdateProduct-----------");
		Purchase purchase = purchaseService.getPurchase(10001);
		Assert.assertNotNull(purchase);
		
//		Assert.assertEquals(10001, purchase.getTranNo());
//		Assert.assertEquals("admin", purchase.getBuyer().getUserId());
//		Assert.assertEquals(10000, purchase.getPurchaseProd().getProdNo());
//		Assert.assertEquals("정정정", purchase.getReceiverName());
//		Assert.assertEquals("현금", purchase.getPaymentOption());
		
//		purchase.setReceiverName("change");
//		purchase.setReceiverPhone("777-7777-7777");
//		purchase.setPaymentOption("change");
//		purchase.setDivyDate("20200505");
//		
//		
//		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10001);
		
		//==> console 확인
		System.out.println("::::"+purchase);
			
		//==> API 확인
		Assert.assertEquals("change", purchase.getReceiverName());
		Assert.assertEquals("777-7777-7777", purchase.getReceiverPhone());
		Assert.assertEquals("현금", purchase.getPaymentOption());
		System.out.println("-----------UpdateProduct-----------\n\n");
	 }
	 
	
	
	
	 @Test
	 public void testGetPurchaseListAll() throws Exception{
		System.out.println("-----------AllListProduct-----------");
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Purchase purchase = new Purchase();
	 	purchase = purchaseService.getPurchase(10001);
	 	purchaseService.getPurchaseList(search,purchase.getBuyer().getUserId());
	 	
	
	 	Map<String,Object> map = purchaseService.getPurchaseList(search,purchase.getBuyer().getUserId());
	 	
	 	List<Purchase> list = (List<Purchase>)map.get("list");
	 	
	 	System.out.println("LIST ={"+list+"}");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	System.out.println("purchase.getBuyer().getUserId() : "+"admin");
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	map = purchaseService.getPurchaseList(search,purchase.getBuyer().getUserId());
	 	
	 	list = (List<Purchase>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	System.out.println("\n::::"+map+"\n");
	 	//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		System.out.println("-----------AllListProduct-----------\n\n");
	 }
	 
	
	 
}