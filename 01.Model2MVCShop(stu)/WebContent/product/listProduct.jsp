<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <style> -->
<!-- /* .ct_list_b{border-right:1px solid #fff; } */ -->
<!-- </style> -->
<%
// List<Product> list= (List<Product>)request.getAttribute("list");
// Page resultPage=(Page)request.getAttribute("resultPage");

// Search search = (Search)request.getAttribute("search");
// //==> null �� ""(nullString)���� ����
// String searchCondition = CommonUtil.null2str(search.getSearchCondition());
// String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

// 	HashMap<String,Object> map =(HashMap<String,Object>)request.getAttribute("map");
// 	System.out.println("��2:"+request.getAttribute("map"));
// 	SearchVO searchVO=(SearchVO)request.getAttribute("searchVO");
// 	System.out.println("��ġ2:"+request.getAttribute("searchVO"));
// 	int total=0;
// 	ArrayList<ProductVO> list=null;
// 	if(map != null){
// 		total=((Integer)map.get("count")).intValue();
// 		list=(ArrayList<ProductVO>)map.get("list");
// 	}
	
// 	int currentPage = searchVO.getPage();
	
// 	int totalPage=0;
// 	if(total > 0) {
// 		totalPage= total / searchVO.getPageUnit();
// 		if(total%searchVO.getPageUnit() >0)
// 			totalPage += 1;
// 	}
%>

<html>
<head>
<title>ȸ�� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function fncGetProductList(currentPage) {
	$("#currentPage").val(currentPage)
	//document.getElementById("currentPage").value = currentPage;
   	$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	//document.detailForm.submit();			   	
}// end of fncGetUserList




$(function(){
	$("td.ct_btn01:contains('�˻�')").on("click",function(){
		fncGetProductList(1);
	})//�˻� Ŭ���ϸ� fncGetUserList �����ϰ�.
	
	$(".ct_list_pop td:nth-child(3)").on("click",function(){
		self.location="/product/getProduct?prodNo="+$(this).text().trim()+"&menu="+$("input[type='hidden'][name='menu']").val();
	})
	

	$(".ct_list_pop:nth-child(4n+6)").css("background-color","whitesmoke");
	
	$(".ct_list_pop td:nth-child(3)").css("color","brown");
})



</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">
<input type="hidden" name="menu" value="${param.menu}">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				
<%-- 				<% --%>
<!--  					//System.out.println(request.getParameter("menu")); -->
<!-- 				//if(request.getParameter("menu").equals("search")){ -->
<!-- 				%>  -->
				<c:if test="${param.menu == 'search' }">
					<td id="search" width="93%" class="ct_ttl01">��ǰ�����ȸ</td>
					</c:if>
<%-- 				<% --%>
<!-- 		//			}else if(request.getParameter("menu").equals("manage")){ -->
<!-- 				%> -->
				<c:if test="${param.menu == 'manage' }">
					<td id="manage" width ="93%" class = "ct_ttl01">��ǰ����</td>
<%-- 				<%} %> --%>
				</c:if>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>

		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${search.searchCondition == "0" ? "selected" : ""}>��ǰ��ȣ</option>
				<option value="1" ${search.searchCondition == "1" ? "selected" : ""}>��ǰ��</option>
				<option value="2" ${search.searchCondition == "2" ? "selected" : ""}>��ǰ����</option>
			</select>
			<input type="text" name="searchKeyword"  value="${search.searchKeyword }"  class="ct_input_g" style="width:200px; height:19px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  ${requestScope.resultPage.totalCount }�Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr class="test1" style="border-bottom: 1px solid #dddddd;">
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_line02" width="1px"></td>
			<td class="ct_list_b" width="150">��ǰ��ȣ</td>
			<td class="ct_line02" width="1px"></td>
			<td class="ct_list_b" width="150">��ǰ��</td>
			<td class="ct_line02" width="1px"></td>
			<td class="ct_list_b" width = "150">����</td>
			<td class = "ct_line02"width="1px"></td>
			<td class = "ct_list_b" width ="200">�����</td>
			<td class = "ct_line02" width="1px"></td>
			<td class = "ct_list_b" width = "150">���� ����</td>
			<td class = "ct_line02" width="1px"></td>
		<c:if test="${param.menu=='manage' }">
			<td class = "ct_list_b" width = "150" style='border-bottom: 1px solid #dddddd;'>��� Ȯ��</td>
		</c:if>
		<c:if test="${param.menu=='search' }">
			<td class = "ct_list_b" width = "150">�� ��</td>
		</c:if>
		<td class = "ct_line02" width="1px"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
<%-- 	<% 		 --%>
<!-- //  		for(int i=0; i<list.size(); i++) {  -->
<!-- //  			Product vo = list.get(i);  -->
<%-- 	%> --%>
<!--  	<tr class="ct_list_pop">  -->
<%-- 		<td align="center"><%=i+1%></td> --%>
<!--  		<td></td>  -->
<%-- 		<td align="left"><%= vo.getProdNo() %></td> --%>
<!--  		<td></td>  -->
<!--  		<td align="left"> -->
<%-- 		<%if (request.getParameter("menu").equals("manage")) {%> --%>
<%-- 			<a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>&menu=manage"><%= vo.getProdName() %></a> --%>
<%-- 		<%}else if(request.getParameter("menu").equals("search")){ %> --%>
<%-- 			<a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>&menu=search"><%= vo.getProdName() %></a> --%>
<%-- 			<%} %> --%>
<!--  		</td> -->
<!--  		<td></td>	  -->
<%-- 		<td align="left"><%=vo.getPrice()%></td>		 --%>
<!--  		<td></td> -->
<%-- 		<td align ="left"><%=vo.getRegDate() %></td> --%>
<!--  		<td></td> -->
<!--  		<td align = "center">�Ǹ���</td> -->
<!-- 	</tr> -->
	
<!--  	<tr>  -->
<!--  		<td colspan="11" bgcolor="D6D7D6" height="1"></td>  -->
<!--  	</tr>  -->
<%-- 	<% } %> --%>
<c:set var="i" value ="0"/>
	<c:forEach var="product" items ="${list }">
		<c:set var="i" value="${i+1 }"/>
		<tr class="ct_list_pop">
			<td align ="center">${i }</td>
			<td></td>	
			<td align="center">${product.prodNo }</td>
			<td></td>
			
			<td align ="left">
			<c:if test="${param.menu == 'manage' }">
				${product.prodName }
			</c:if>
			<c:if test="${param.menu == 'search' && product.proTranCode.equals('1  ')}">			
				${product.prodName }
			</c:if>
			
			
			<c:if test="${param.menu == 'search' && !product.proTranCode.equals('1  ') }">
				${product.prodName }
			</c:if>
			</td>
			
			<td></td>
			<td align="left">${product.price }</td>
			<td></td>
			<td align ="left">${product.regDate }</td>
			<td></td>
			<td align ="center">
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('1  ') }">
			�ǸſϷ�
			</c:if>
			<c:if test="${param.menu == 'manage'&&product.proTranCode.equals('0') }">
			�Ǹ���
			</c:if>
			
			
			<c:if test="${param.menu == 'search'&&product.proTranCode.equals('1  ')||vo.proTranCode.equals('2  ')}">
			�ǸſϷ�
			</c:if>
			<c:if test="${param.menu == 'search'&&product.proTranCode.equals('0') }">
			�Ǹ���
			</c:if>
			</td>
			<td></td>
			<td align ="center">
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('1  ') }">
			<a href="/updateTranCodeByProd.do?prodNo=${product.prodNo }&tranCode=2">��۽���</a>
			</c:if>
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('2  ') }">
			�����
			</c:if>
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('3  ') }">
			���ǵ���
			</c:if>
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('0') }">
			�Ǹ���
			</c:if>
			
			<c:if test="${param.menu == 'search' && product.proTranCode.equals('0') }">
			1 ��
			</c:if>
			<c:if test="${param.menu == 'search' && !product.proTranCode.equals('0') }">
			0 ��
			</c:if>
			</td>
			</tr>
			<tr>
				<td colspan="11" bgcolor ="D6D7D6" height ="1"></td>
			</tr>
			</c:forEach>
</table>
<!-- page Navigation Starts here! -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
<%-- 			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %> --%>
<!-- 					�� ���� -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a> --%>
<%-- 			<% } %> --%>

<%-- 			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%> --%>
<%-- 					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a> --%>
<%-- 			<% 	}  %> --%>
	
<%-- 			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %> --%>
<!-- 					���� �� -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a> --%>
<%-- 			<% } %> --%>
		<jsp:include page="../common/pageNavigatorProduct.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>
</div>

</body>
</html>