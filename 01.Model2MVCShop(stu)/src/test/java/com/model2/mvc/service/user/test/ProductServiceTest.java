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

import com.model2.mvc.service.product.ProductService;



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
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService prodService;

	//@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		
		product.setProdName("testUserName");
		product.setProdDetail("testPasswd");
		product.setManuDate("20200513");
		product.setPrice(1000000);
		product.setFileName("��⵵");
		
		
		prodService.addProduct(product);
		
		product = prodService.getProduct(10027);
		System.out.println(10027);
		//==> console Ȯ��
		//System.out.println(user);
		
		//==> API Ȯ��
		Assert.assertEquals("testUserName", product.getProdName());
		Assert.assertEquals("testPasswd", product.getProdDetail());
		Assert.assertEquals("20200513", product.getManuDate());
		Assert.assertEquals(1000000, product.getPrice());
		Assert.assertEquals("��⵵", product.getFileName());
		
	}
	
	//@Test
	public void testGetProduct() throws Exception {
		System.out.println("-----------GetProduct-----------");
		Product product = new Product();
		//==> �ʿ��ϴٸ�...
//		user.setUserId("testUserId");S
//		user.setUserName("testUserName");
//		user.setPassword("testPasswd");
//		user.setSsn("1111112222222");
//		user.setPhone("111-2222-3333");
//		user.setAddr("��⵵");
//		user.setEmail("test@test.com");
		
		product = prodService.getProduct(10000);

		//==> console Ȯ��
		//System.out.println(user);
		
		//==> API Ȯ��
		Assert.assertEquals(10000, product.getProdNo());
		Assert.assertEquals("vaio vgn FS70B", product.getProdName());
		Assert.assertEquals("�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ", product.getProdDetail());
		Assert.assertEquals("20200403", product.getManuDate());
		Assert.assertEquals(2000000, product.getPrice());
		Assert.assertEquals("AHlbAAAAtBqyWAAA.jpg", product.getFileName());
		//Assert.assertEquals(12/12/14,product.getRegDate());
		

		Assert.assertNotNull(prodService.getProduct(10001));
		Assert.assertNotNull(prodService.getProduct(10002));
		System.out.println("=-=-=-=-=-=-=-=-=-=");
		System.out.println("::"+product);
		System.out.println("=-=-=-=-=-=-=-=-=-=");
		System.out.println("-----------GetProduct-----------\n\n");
	}
	
	//@Test
	 public void testUpdateProduct() throws Exception{
		 System.out.println("-----------UpdateProduct-----------");
		Product product = prodService.getProduct(10027);
		Assert.assertNotNull(product);
		
		Assert.assertEquals("testUserName", product.getProdName());
		Assert.assertEquals("testPasswd", product.getProdDetail());
		Assert.assertEquals("��⵵", product.getFileName());
		Assert.assertEquals("20200513", product.getManuDate());

		product.setProdName("change");
		product.setProdDetail("777-7777-7777");
		product.setFileName("change");
		
		
		prodService.updateProduct(product);
		
		product = prodService.getProduct(10027);
		Assert.assertNotNull(product);
		
		//==> console Ȯ��
		System.out.println("::::"+product);
			
		//==> API Ȯ��
		Assert.assertEquals("change", product.getProdName());
		Assert.assertEquals("777-7777-7777", product.getProdDetail());
		Assert.assertEquals("��⵵", product.getFileName());
		System.out.println("-----------UpdateProduct-----------\n\n");
	 }
	 
	
	
	
	 @Test
	 public void testGetProductListAll() throws Exception{
		System.out.println("-----------AllListProduct-----------");
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = prodService.getProductList(search);
	 	
	 	List<Product> list = (List<Product>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = prodService.getProductList(search);
	 	
	 	list = (List<Product>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	System.out.println("::::"+map);
	 	//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
		System.out.println("-----------AllListProduct-----------\n\n");
	 }
	 
	 //@Test
	 public void testGetProductListByProdNo() throws Exception{
		System.out.println("-----------UserIDList-----------");
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("10000");
	 	Map<String,Object> map = prodService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	System.out.println("::::"+map);
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = prodService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(":::::"+map);
	 	System.out.println(totalCount);
	 	System.out.println("-----------UserIDList-----------\n\n");
	 }
//	 
	// @Test
	 public void testGetProductListByProdName() throws Exception{
		System.out.println("-----------ProductNameList-----------");
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("������");
	 	Map<String,Object> map = prodService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println("::::: "+map);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = prodService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	System.out.println("-----------UserProductList-----------\n\n");
	 }	 
	 @Test
		 public void testGetProductListByPrice() throws Exception{
			System.out.println("-----------ProductNameList-----------");
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("2");
		 	search.setSearchKeyword("1000000");
		 	Map<String,Object> map = prodService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			//==> console Ȯ��
		 	System.out.println("::::: "+map);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("1");
		 	search.setSearchKeyword(""+System.currentTimeMillis());
		 	map = prodService.getProductList(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(0, list.size());
		 	
			//==> console Ȯ��
		 	
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	System.out.println("-----------UserProductList-----------\n\n");
		 }	 
	 
}