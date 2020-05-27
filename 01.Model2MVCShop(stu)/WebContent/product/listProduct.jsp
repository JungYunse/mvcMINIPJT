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
// //==> null 을 ""(nullString)으로 변경
// String searchCondition = CommonUtil.null2str(search.getSearchCondition());
// String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

// 	HashMap<String,Object> map =(HashMap<String,Object>)request.getAttribute("map");
// 	System.out.println("맵2:"+request.getAttribute("map"));
// 	SearchVO searchVO=(SearchVO)request.getAttribute("searchVO");
// 	System.out.println("서치2:"+request.getAttribute("searchVO"));
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
<title>회원 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetProductList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do" method="post">
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
					<td width="93%" class="ct_ttl01">상품목록조회</td>
					</c:if>
<%-- 				<% --%>
<!-- 		//			}else if(request.getParameter("menu").equals("manage")){ -->
<!-- 				%> -->
				<c:if test="${param.menu == 'manage' }">
					<td width ="93%" class = "ct_ttl01">상품관리</td>
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
				<option value="0" ${search.searchCondition == "0" ? "selected" : ""}>상품번호</option>
				<option value="1" ${search.searchCondition == "1" ? "selected" : ""}>상품명</option>
				<option value="2" ${search.searchCondition == "2" ? "selected" : ""}>상품가격</option>
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
						<a href="javascript:fncGetProductList('1');">검색</a>
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
		<td colspan="11" >전체  ${requestScope.resultPage.totalCount }건수, 현재 ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr class="test1" style="border-bottom: 1px solid #dddddd;">
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_line02" width="1px"></td>
			<td class="ct_list_b" width="150">상품번호</td>
			<td class="ct_line02" width="1px"></td>
			<td class="ct_list_b" width="150">상품명</td>
			<td class="ct_line02" width="1px"></td>
			<td class="ct_list_b" width = "150">가격</td>
			<td class = "ct_line02"width="1px"></td>
			<td class = "ct_list_b" width ="200">등록일</td>
			<td class = "ct_line02" width="1px"></td>
			<td class = "ct_list_b" width = "150">현재 상태</td>
			<td class = "ct_line02" width="1px"></td>
		<c:if test="${param.menu=='manage' }">
			<td class = "ct_list_b" width = "150" style='border-bottom: 1px solid #dddddd;'>배송 확인</td>
		</c:if>
		<c:if test="${param.menu=='search' }">
			<td class = "ct_list_b" width = "150">개 수</td>
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
<!--  		<td align = "center">판매중</td> -->
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
				<a href="/getProduct.do?prodNo=${product.prodNo }&menu=manage">${product.prodName }</a>
			</c:if>
			<c:if test="${param.menu == 'search' && product.proTranCode.equals('1  ')}">			
				${product.prodName }
			</c:if>
			<c:if test="${param.menu == 'search' && !product.proTranCode.equals('1  ') }">
				<a href="/getProduct.do?prodNo=${product.prodNo }&menu=search">${product.prodName }</a>
			</c:if>
			</td>
			<td></td>
			<td align="left">${product.price }</td>
			<td></td>
			<td align ="left">${product.regDate }</td>
			<td></td>
			<td align ="center">
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('1  ') }">
			판매완료
			</c:if>
			<c:if test="${param.menu == 'manage'&&product.proTranCode.equals('0') }">
			판매중
			</c:if>
			<c:if test="${param.menu == 'search'&&product.proTranCode.equals('1  ')||vo.proTranCode.equals('2  ')}">
			판매완료
			</c:if>
			<c:if test="${param.menu == 'search'&&product.proTranCode.equals('0') }">
			판매중
			</c:if>
			</td>
			<td></td>
			<td align ="center">
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('1  ') }">
			<a href="/updateTranCodeByProd.do?prodNo=${product.prodNo }&tranCode=2">배송시작</a>
			</c:if>
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('2  ') }">
			배송중
			</c:if>
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('3  ') }">
			물건도착
			</c:if>
			<c:if test="${param.menu == 'manage' && product.proTranCode.equals('0') }">
			판매중
			</c:if>
			
			<c:if test="${param.menu == 'search' && product.proTranCode.equals('0') }">
			1 개
			</c:if>
			<c:if test="${param.menu == 'search' && !product.proTranCode.equals('0') }">
			0 개
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
<!-- 					◀ 이전 -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a> --%>
<%-- 			<% } %> --%>

<%-- 			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%> --%>
<%-- 					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a> --%>
<%-- 			<% 	}  %> --%>
	
<%-- 			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %> --%>
<!-- 					이후 ▶ -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a> --%>
<%-- 			<% } %> --%>
		<jsp:include page="../common/pageNavigatorProduct.jsp"/>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>

</body>
</html>