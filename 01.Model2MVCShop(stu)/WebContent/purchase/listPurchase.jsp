<%@page import="com.model2.mvc.service.domain.User"%>
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.service.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html>
<head>
<title>회원 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetPurchaseList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<form name="detailForm" action="/listPurchase.do" method="post">
<input type="hidden" name="userId" value="${user.userId }">
<!-- 	input태그 value 에 userId 를 주면 가지고 오나아? -->
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<td width="93%" class="ct_ttl01">구매내역보기</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;"> -->
<!-- 	<tr> -->

<!-- 		<td align="right"> -->
<!-- 			<select name="searchCondition" class="ct_input_g" style="width:80px"> -->
<%-- 				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option> --%>
<%-- 				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option> --%>
<%-- 				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>상품가격</option> --%>
<!-- 			</select> -->
<%-- 			<input type="text" name="searchKeyword"  value="<%= searchKeyword %>"  class="ct_input_g" style="width:200px; height:19px" > --%>
<!-- 		</td> -->
<!-- 		<td align="right" width="70"> -->
<!-- 			<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;"> -->
<!-- 						<a href="javascript:fncGetProductList('1');">검색</a> -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount } 건수, 현재전체 ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width = "150">전화번호</td>
		<td class = "ct_line02"></td>
		<td class = "ct_list_b" width ="200">배송현황</td>
		<td class = "ct_line02"></td>
		<td class = "ct_list_b" width = "150">정보수정</td>
		<td class = "ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
<%-- 	<% 		 --%>
<!-- // 		for(int i=0; i<list.size(); i++) { -->
<!-- // 			Purchase vo = list.get(i); -->
<%-- 	%> --%>
<!-- 	<tr class="ct_list_pop"> -->
<%-- 		<td align="center"><%=i+1%><input type="hidden" name ="tranNo" value ="${vo.tranNo }"></td> --%>
<%-- <%-- 		<%//System.out.println("LIST 에서 tranNo 뽑아보기"+vo.getTranNo()); %> --%>
<!-- 		<td></td> -->
<%-- 		<td align="left"><a href="/getPurchase.do?tranNo=<%=vo.getTranNo() %>"><%= vo.getBuyer().getUserId()%></a></td> --%>
<!-- 		<td></td> -->
<%-- 		<td align="left"><%=vo.getReceiverName() %></td> --%>
<!-- 		<td></td>	 -->
<%-- 		<td align="left"><%=vo.getReceiverPhone()%></td>		 --%>
<!-- 		<td></td> -->
<%-- 		<% --%>
<!-- // 		System.out.println("list에서 tranCode : "+ vo.getTranCode()); -->
<%-- 		if((vo.getTranCode().trim()).equals("1") && vo.getTranCode() != null){ %> --%>
<!-- 		<td align ="left">현재구매 완료상태 입니다</td> -->
<%-- 		<%}else{ %> --%>
<!-- 		<td align ="left"> 아몰랑</td> -->
<%-- 		<%} %> --%>
<!-- 		<td></td> -->
<!-- 		<td align = "center"> </td> -->
<!-- 	</tr> -->
	
	<c:set var="i" value ="0"/>
	<c:forEach var="purchase" items ="${list }">
		<c:set var="i" value="${i+1 }"/>
		<tr class="ct_list_pop">
			<td align ="center">${i }</td>
			<td></td>	
			<td align ="left">
				<a href="/getPurchase.do?tranNo=${purchase.tranNo}" >${purchase.buyer.userId }</a>
			</td>
			<td></td>
			<td align="left">${purchase.receiverName }</td>
			<td></td>
			<td align ="left">${purchase.receiverPhone }</td>
			<td></td>
			<td align ="center">
			<%System.out.println("여기는listPurchase : "+ request.getAttribute("purchase")); %>
			<c:if test="${fn.trim(purchase.tranCode) == '1' && !empty purchase.tranCode} ">
			구매완료
			</c:if>
			<c:if test="${fn.trim(purchase.tranCode).equals('2') && purchase.tranCode.equals(null)} ">
			배송중
			</c:if>
			<c:if test="${purchase.tranCode.equals('3') && purchase.tranCode.equals(null)} ">
			배송완료
			</c:if>
			
			</td>
			<td></td>
		</tr>
			
	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>
<!-- page Navigation Starts here! -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
<!-- 		   <input type="hidden" id="currentPage" name="currentPage" value=""/> -->
<%-- 			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %> --%>
<!-- 					◀ 이전 -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a> --%>
<%-- 			<% } %> --%>

<%-- 			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%> --%>
<%-- 					<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a> --%>
<%-- 			<% 	}  %> --%>
	
<%-- 			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %> --%>
<!-- 					이후 ▶ -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a> --%>
<%-- 			<% } %> --%>
		<jsp:include page="../common/pageNavigatorPurchase.jsp"/>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>

</body>
</html>