
<%@ page contentType="text/html; charset=euc-kr" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>회원 목록 조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		//document.getElementById("currentPage").value = currentPage;
	   	$("form").attr("method","POST").attr("action","/user/listUser").submit();
		//document.detailForm.submit();			   	
	}// end of fncGetUserList
	
	$(function(){
		$("td.ct_btn01:contains('검색')").on("click",function(){
			fncGetUserList(1);
		
	})//검색 클릭하면 fncGetUserList 실행하게.
	
	$(".ct_list_pop td:nth-child(3)").on("click",function(){
		self.location="/user/getUser?userId="+$(this).text().trim();
	})//userId 를 클릭하게되면 getUser 로 가게
	
	$(".ct_list_pop:nth-child(4n+6)").css("background-color","whitesmoke");
	
	$(".ct_list_pop td:nth-child(3)").css("color","brown");
	})
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!-- jQuery로 대체! -->
<!-- <form name="detailForm" action="/user/listUser" method="post"> -->
<form name = "detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">회원 목록조회</td>
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
				<option value="0" ${search.searchCondition == '0' ? 'selected' : ''}>회원ID</option>
				<option value="1" ${search.searchCondition == '1' ? 'selected' : ''}>회원명</option>
			</select>
			<input 	type="text" name="searchKeyword" value="${requestScope.search.searchKeyword }"  class="ct_input_g" 
							style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			전체  ${resultPage.getTotalCount() } 건수,	현재  ${resultPage.getCurrentPage() } 페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
<!-- 		<td class="ct_list_b" width="150">회원ID</td> -->
		<td class="ct_list_b" width="150">
			회원ID<br/>
			<h7>(Click)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">이메일</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
<%-- 	<% --%>
<!-- // 		for(int i=0; i<list.size(); i++) { -->
<!-- // 			User vo = list.get(i); -->
<%-- 	%> --%>
<!-- 	<tr class="ct_list_pop"> -->
<%-- 		<td align="center"><%= i + 1 %></td> --%>
<!-- 		<td></td> -->
<!-- 		<td align="left"> -->
<%-- 			<a href="/user/getUser.do?userId=<%=vo.getUserId() %>"><%= vo.getUserId() %></a> --%>
<!-- 		</td> -->
<!-- 		<td></td> -->
<%-- 		<td align="left"><%= vo.getUserName() %></td> --%>
<!-- 		<td></td> -->
<%-- 		<td align="left"><%= vo.getEmail() %>	</td>		 --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
<!-- 	</tr> -->
<%-- 	<% } %> --%>
	<c:set var ="i" value="0"/>
	<c:forEach var="user" items="${list }">
		<c:set var="i" value="${i+1 }"/>
		<tr class ="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
			<td align="center">${user.userId}</td>
			<td></td>
			<td align="left">${user.userName }</td>
			<td></td>
			<td align="left">${user.email }</td>
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
<%-- 			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %> --%>
<!-- 					◀ 이전 -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a> --%>
<%-- 			<% } %> --%>

<%-- 			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%> --%>
<%-- 					<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a> --%>
<%-- 			<% 	}  %> --%>
	
<%-- 			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %> --%>
<!-- 					이후 ▶ -->
<%-- 			<% }else{ %> --%>
<%-- 					<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a> --%>
<%-- 			<% } %> --%>
		<c:import var="pageNavigatorUser" url="../common/pageNavigatorUser.jsp" scope ="session"/>
		${pageNavigatorUser }
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>