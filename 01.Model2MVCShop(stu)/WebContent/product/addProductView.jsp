
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%-- <% --%>
<!-- // 	Product prod = (Product)request.getAttribute("vo"); -->
<!-- // 	session.setAttribute("vo",prod); -->
<%-- %> --%>

<html lang="ko">
	<head>
	

	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
	body{
		padding-top: 50px;
	}
</style>



<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
//  var name = document.detailForm.prodName.value;
// 	var detail = document.detailForm.prodDetail.value;
 	
// 	var price = document.detailForm.price.value;
	var name 	= $("input[name='prodName']").val()
	var detail 	= $("input[name='prodDetail']").val()
	var manuDate=$("input[name='manuDate']")
	var price 	= $("input[name='price']").val()
	
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

// 	document.detailForm.action='/product/addProduct';
// 	document.detailForm.submit();
	$("form").attr("method","POST").attr("action","/product/addProduct").submit();
}

$(function(){
	$("button.btn.btn-primary").on("click",function(){
			fncAddProduct()
		})
	
	$("a[href='#' ]").on("click" , function(){
		$("form")[0].reset();
		})
		
// 	$("img[src='../images/ct_icon_date.gif']").on("click",function(){
// 		 show_calendar($("input[name='manuDate']"), $("input[name='manuDate']").val());
// 	})
})

// show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)

</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<h3 class="text-info">��ǰ ��� </h3>
	</div>
	
<form enctype="multipart/form-data" class="form-horizontal">

		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName"  placeholder="��ǰ�̸� �ۼ�">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�� ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������ �Է�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">���� ����</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="manuDate" name="manuDate" placeholder="�������� Ȯ��">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ �̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="fileName" >
		    </div>
		  </div>
	<!-- 	  
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
			��ǰ�� <img src="/images/ct_icon_red.gif" images="ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
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
				&nbsp;<img src="../images/ct_icon_date.gif" name="manuDate" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" width="20" height="20">
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
			<input type="file" name="fileName" class="ct_input_g" style="width: 200px; height: 20px" maxlength="13">
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
					���
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23">
				</td>
				<td class="ct_btn01" style="padding-top: 3px;" background="/images/ct_btnbg02.gif">
					���
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</tbody></table>
		</td>
	</tr>
</tbody></table>-->

	  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>


</form>

</body>

</html>