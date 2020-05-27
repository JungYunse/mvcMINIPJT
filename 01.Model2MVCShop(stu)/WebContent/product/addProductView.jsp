<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	Product prod = (Product)request.getAttribute("vo");
	session.setAttribute("vo",prod);
%>

<html><head>
<title>��ǰ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	document.detailForm.action='/addProduct.do';
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}

</script>
</head>

<body text="#000000" bgcolor="#ffffff">

<form name="detailForm" method="post">

<table width="100%" height="37" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td style="padding-left: 10px;" width="100%" background="/images/ct_ttl_img02.gif">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody><tr>
					<td class="ct_ttl01" width="93%">��ǰ���</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</tbody></table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</tbody></table>

<table style="margin-top: 13px;" width="100%" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr>
		<td colspan="3" height="1" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td class="ct_write" width="104">
			��ǰ�� <imgsrc=" images="" ct_icon_red.gif"="" width="3" height="3" align="absmiddle">
		</imgsrc="></td>
		<td width="1" bgcolor="D6D6D6"></td>
		<td class="ct_write01">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody><tr>
					<td width="105">
						<input type="text" name="prodName" class="ct_input_g" style="width: 100px; height: 19px" maxlength="20">
					</td>
				</tr>
			</tbody></table>
		</td>
	</tr>
	<tr>
		<td colspan="3" height="1" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td class="ct_write" width="104">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td width="1" bgcolor="D6D6D6"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" class="ct_input_g" style="width: 100px; height: 19px" maxlength="10" minlength="6">
		</td>
	</tr>
	<tr>
		<td colspan="3" height="1" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td class="ct_write" width="104">
			�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td width="1" bgcolor="D6D6D6"></td>
		<td class="ct_write01">
			<input type="text" name="manuDate" class="ct_input_g" style="width: 100px; height: 19px" maxlength="10" minlength="6">
				&nbsp;<img src="../images/ct_icon_date.gif" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" width="15" height="15">
		</td>
	</tr>
	<tr>
		<td colspan="3" height="1" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td class="ct_write" width="104">
			���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td width="1" bgcolor="D6D6D6"></td>
		<td class="ct_write01">
			<input type="text" name="price" class="ct_input_g" style="width: 100px; height: 19px" maxlength="10">&nbsp;��
		</td>
	</tr>
	<tr>
		<td colspan="3" height="1" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td class="ct_write" width="104">��ǰ�̹���</td>
		<td width="1" bgcolor="D6D6D6"></td>
		<td class="ct_write01">
			<input type="text" name="fileName" class="ct_input_g" style="width: 200px; height: 19px" maxlength="13">
		</td>
	</tr>
	<tr>
		<td colspan="3" height="1" bgcolor="D6D6D6"></td>
	</tr>
</tbody></table>

<table style="margin-top: 10px;" width="100%" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr>
		<td width="53%"></td>
		<td align="right">
		<table cellspacing="0" cellpadding="0" border="0">
			<tbody><tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23">
				</td>
				<td class="ct_btn01" style="padding-top: 3px;" background="/images/ct_btnbg02.gif">
					<a href="javascript:fncAddProduct();">���</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23">
				</td>
				<td class="ct_btn01" style="padding-top: 3px;" background="/images/ct_btnbg02.gif">
					<a href="javascript:resetData();">���</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</tbody></table>
		</td>
	</tr>
</tbody></table>

</form>

</body></html>