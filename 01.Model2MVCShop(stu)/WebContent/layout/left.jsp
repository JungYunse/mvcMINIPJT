<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	User vo=(User)session.getAttribute("user");
// 	String role="";
	
// 	if(vo != null) {
// 		role=vo.getRole();
// 	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">	
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function history(){
	popWin = window.open(	"/history.jsp",
							"popWin",
							"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}


$(function(){
	$(".Depth03:contains('����������ȸ')").on("click" , function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
		
	});
	
 	$( ".Depth03:contains('ȸ��������ȸ')" ).on("click" , function() {
		//Debug..
		//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
	}); 
});
</script>

</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
	<tr>
		<c:if test="${!empty user }">
	
		<tr>
			<td class="Depth03">
			����������ȸ
			</td>
		</tr>
		</c:if>
		
		<c:if test="${user.role=='admin'}">
		
		<tr>
			<td class="Depth03" >
				ȸ��������ȸ
			</td>
		</tr>
		
		</c:if>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>
<c:if test="${user.role == 'admin' }">

<!--menu 02 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03">
					<a href="../product/addProductView.jsp;" target="rightFrame">�ǸŻ�ǰ���</a>
				</td>
			</tr>
			<tr>
				<td class="Depth03">
					<a href="/product/listProduct?menu=manage"  target="rightFrame">�ǸŻ�ǰ����</a>
				</td>
			</tr>
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
		</table>
	</td>
</tr>
</c:if>


<!--menu 03 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03">
					<a href="/product/listProduct?menu=search" target="rightFrame">�� ǰ �� ��</a>
				</td>
			</tr>
			<c:if test="${!empty user && user.role=='user' }">
			
			<tr>
				<td class="Depth03">
					<a href="/purchase/listPurchase"  target="rightFrame">�����̷���ȸ</a>
				</td>
			</tr>
			
			</c:if>
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03">
					<a href="javascript:history()">�ֱ� �� ��ǰ</a>
				</td>
			</tr>
		</table>
	</td>
</tr>

</table>

</body>
</html>
