<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>������������</title>
<link rel="stylesheet" href = "/css/admin.css" type ="text/css">

<script type ="text/javascript" src ="../javascript/calendar.js"></script>
<script type = "text/javascript">
function fncUpdatePurchase(){
	
// 	var name = document.detailForm.buyerId.value;
// 	var addr = document.detailForm.divyAddr.value;
// 	var phone = document.detailForm.receiverPhone.value;
	
// 	if(name == null || name.length<1){
// 		alert("������ �̸��� �ݵ�� �Է��ϼž� �մϴ�.");
// 		return;
// 	}
// 	if(addr == null|| addr.length <1){
// 		alert("�ּҴ� �ݵ�� �Է� ��Ź�帳�ϴ�.");
// 		return;
// 	}
// 	if(phone.contains("-") ){
// 		alert("���ڸ� �Է� ��Ź�帳�ϴ�.");
// 		return;
// 	}
	
	
	document.detailForm.action='/updatePurchase.do';
	document.detailForm.submit();
		
}
function resetData() {
	document.detailForm.reset();
}
</script>


</head>
<body bgcolor="#ffffff" text="#000000">

<form name="detailForm"  method="post" >

<input type="hidden" name="tranNo" value="${updatePurchase.tranNo }">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ��������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${updatePurchase.tranNo }</td>
					<td></td>
				</tr>
</table>
</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�����ھ��̵�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="hidden" name="buyerId" value="${updatePurchase.buyer.getUserId()}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100">${updatePurchase.buyer.getUserId()}
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ź��</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="paymentOption" value="${updatePurchase.paymentOption}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������̸�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverName" value="${updatePurchase.receiverName}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�����ڿ���ó</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverPhone" value="${updatePurchase.receiverPhone}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="divyAddr" value="${updatePurchase.divyAddr}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��۽� ��û����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="divyRequest" value="${updatePurchase.divyRequest}" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="divyDate" class="ct_input_g" style="width: 100px; height: 19px" maxlength="10" minlength="6">
				&nbsp;<img src="../images/ct_icon_date.gif" onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)" width="15" height="15">		
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
<!-- <a href="javascript:fncUpdatePurchase();">����</a> -->
						<a href="javascript:fncUpdatePurchase();">����</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:resetData();">���</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>