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
<title>ȸ�� �����ȸ</title>

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
<!-- 	input�±� value �� userId �� �ָ� ������ ������? -->
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<td width="93%" class="ct_ttl01">���ų�������</td>
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
<%-- 				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option> --%>
<%-- 				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option> --%>
<%-- 				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option> --%>
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
<!-- 						<a href="javascript:fncGetProductList('1');">�˻�</a> -->
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
		<td colspan="11" >��ü ${resultPage.totalCount } �Ǽ�, ������ü ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width = "150">��ȭ��ȣ</td>
		<td class = "ct_line02"></td>
		<td class = "ct_list_b" width ="200">�����Ȳ</td>
		<td class = "ct_line02"></td>
		<td class = "ct_list_b" width = "150">��������</td>
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
<%-- <%-- 		<%//System.out.println("LIST ���� tranNo �̾ƺ���"+vo.getTranNo()); %> --%>
<!-- 		<td></td> -->
<%-- 		<td align="left"><a href="/getPurchase.do?tranNo=<%=vo.getTranNo() %>"><%= vo.getBuyer().getUserId()%></a></td> --%>
<!-- 		<td></td> -->
<%-- 		<td align="left"><%=vo.getReceiverName() %></td> --%>
<!-- 		<td></td>	 -->
<%-- 		<td align="left"><%=vo.getReceiverPhone()%></td>		 --%>
<!-- 		<td></td> -->
<%-- 		<% --%>
<!-- // 		System.out.println("list���� tranCode : "+ vo.getTranCode()); -->
<%-- 		if((vo.getTranCode().trim()).equals("1") && vo.getTranCode() != null){ %> --%>
<!-- 		<td align ="left">���籸�� �Ϸ���� �Դϴ�</td> -->
<%-- 		<%}else{ %> --%>
<!-- 		<td align ="left"> �Ƹ���</td> -->
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
			<%System.out.println("�����listPurchase : "+ request.getAttribute("purchase")); %>
			<c:if test="${fn.trim(purchase.tranCode) == '1' && !empty purchase.tranCode} ">
			���ſϷ�
			</c:if>
			<c:if test="${fn.trim(purchase.tranCode).equals('2') && purchase.tranCode.equals(null)} ">
			�����
			</c:if>
			<c:if test="${purchase.tranCode.equals('3') && purchase.tranCode.equals(null)} ">
			��ۿϷ�
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
<!-- 					�� ���� -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a> --%>
<%-- 			<% } %> --%>

<%-- 			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%> --%>
<%-- 					<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a> --%>
<%-- 			<% 	}  %> --%>
	
<%-- 			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %> --%>
<!-- 					���� �� -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a> --%>
<%-- 			<% } %> --%>
		<jsp:include page="../common/pageNavigatorPurchase.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>
</div>

</body>
</html>