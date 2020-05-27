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
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",  
		 "classpath:config/context-mybatis.xml",  
		 "classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
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
		purchase.setDivyAddr("�츮��");
		purchase.setDivyRequest("�����Ϳ�");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		purchase.setDivyDate("20200505");//,sdf.format(date)
		purchase.setPaymentOption("����");
		purchase.setReceiverName("������");
		purchase.setReceiverPhone("01015881588");
		purchase.setTranCode("1");
		purchaseService.addPurchase(purchase);
		purchase = purchaseService.getPurchase(0);
		
		//==> console Ȯ��
		//System.out.println(user);
		
		//==> API Ȯ��
//		Assert.assertEquals("����", purchase.getBuyer());
//		Assert.assertEquals("10000", purchase.getPurchaseProd());
//		Assert.assertEquals("�츮��", purchase.getDivyAddr());
//		Assert.assertEquals(1000000, purchase.getDivyDate());
//		Assert.assertEquals("��⵵", purchase.getDivyRequest());
//		//Assert.assertEquals("",purchase.getOrderDate());
//		Assert.assertEquals("����", purchase.getPaymentOption());
//		Assert.assertEquals("������",purchase.getReceiverName());
//		Assert.assertEquals("01015881588", purchase.getReceiverPhone());
//		Assert.assertEquals("1",purchase.getTranCode());
//		
		
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		System.out.println("-----------GetPurchase-----------");
		Purchase purchase = new Purchase();
	
		
		purchase = purchaseService.getPurchase(10001);

		//==> console Ȯ��
		//==> API Ȯ��
		Assert.assertEquals(10001, purchase.getTranNo());
		Assert.assertEquals("admin", purchase.getBuyer().getUserId());
		Assert.assertEquals(10000, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("������", purchase.getReceiverName());
		Assert.assertEquals("����", purchase.getPaymentOption());
	

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
//		Assert.assertEquals("������", purchase.getReceiverName());
//		Assert.assertEquals("����", purchase.getPaymentOption());
		
//		purchase.setReceiverName("change");
//		purchase.setReceiverPhone("777-7777-7777");
//		purchase.setPaymentOption("change");
//		purchase.setDivyDate("20200505");
//		
//		
//		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10001);
		
		//==> console Ȯ��
		System.out.println("::::"+purchase);
			
		//==> API Ȯ��
		Assert.assertEquals("change", purchase.getReceiverName());
		Assert.assertEquals("777-7777-7777", purchase.getReceiverPhone());
		Assert.assertEquals("����", purchase.getPaymentOption());
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
	 	
		//==> console Ȯ��
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
	 	//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		System.out.println("-----------AllListProduct-----------\n\n");
	 }
	 
	
	 
}