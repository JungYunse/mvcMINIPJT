
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>ȸ�� �����ȸ</title>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


function fncGetProductList(currentPage) {
	$("#currentPage").val(currentPage)
	//document.getElementById("currentPage").value = currentPage;
   	$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	//document.detailForm.submit();			   	
}// end of fncGetUserList






$(function(){
	//$("td.ct_btn01:contains('�˻�')").on("click",function(){
		//fncGetProductList(1);
	//})//�˻� Ŭ���ϸ� fncGetUserList �����ϰ�.
	
	$("td:nth-child(2)").on("click",function(){
		self.location="/product/getProduct?prodNo="+$(this).text().trim();
	})
	
	$("td:nth-child(5) > i").on("mouseover",function(){		
			//for(i=0;i<${resultPage.currentPage };i++){
				var	prodNo = $(this).next().val();
				
					//alert('prodNo = '+prodNo);
				//�̳��� for �� �ȿ� �ִ� �� 1���� ������� �ǳ� ��
			//}
		$.ajax({
			url:"/product/json/getProduct/"+prodNo, 
			method:"GET",
			dataType:"json",
			headers:{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success:function(JSONData , status){
// 				alert(status);
// 				//Debug...
// 				alert("JSONData : \n"+JSONData.price);
				
				var displayValue="<h6>"
					+"��ǰ��ȣ: "+ JSONData.prodNo +"<br/>"
					+"������: "+ JSONData.prodDetail +"<br/>"
					+"��  ��    : "+ JSONData.manuDate +"<br/>"
					+"�����   : "+ JSONData.regDate +"<br/>"
					+"����      : "+ JSONData.price +"<br/>"
					+"��ǰ����: <img src='../images/uploadFiles/"+ JSONData.fileName +"'></img><br/>"
					+"</h6>";
									
					$("h6").remove();
					$("#"+prodNo+"").html(displayValue);
					//h3 �±׸� �־��� ���� ã�� ��.
			}
			
		})
			
			
	})

	$(".ct_list_pop:nth-child(4n+6)").css("background-color","whitesmoke");
	
	$("td:nth-child(2)" ).css("color","brown");
	
	
	
})


</script>
<style type="text/css">
	p{
		display: none;
		}
	
	 body {
	    padding-top : 50px;
	        }
</style>
</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />


<div class="container">
	<c:if test="${sessionScope.user.role == 'admin' }">
		<div class="page-header text-info">
	       <h3>��ǰ ����</h3>
	    </div>
 	</c:if>
 	
	<c:if test="${user.role == 'user'}">
		<div class="page-header text-info">
	       <h3>��ǰ �����ȸ</h3>
	    </div>
 	</c:if> 

<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ�̸�</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
	</div>
	
	 <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��ȣ</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : ��ǰ���� Ȯ��">${product.prodNo}</td>
			  <td align="left">${product.prodName}</td>
			  <td align="left">${product.price}  ��</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
      </div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigatorProduct_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
<!-- 
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
				
				<c:if test="${param.menu == 'search' }">
					<td id="search" width="93%" class="ct_ttl01">��ǰ�����ȸ</td>
					</c:if>

				<c:if test="${param.menu == 'manage' }">
					<td id="manage" width ="93%" class = "ct_ttl01">��ǰ����</td>

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

<c:set var="i" value ="0"/>
	<c:forEach var="product" items ="${list }">
		<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align ="center">${i}</td>
			<td></td>	
			<td align="center" id='prodNo'>${product.prodNo }</td>
			<td></td>
			
			<td align ="left" id="tdtd">
				<p>${product.prodNo }</p>
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
		<tr id="damn">
			<td  colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
			
			</c:forEach>
		
</table>
 page Navigation Starts here! 
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>

		<jsp:include page="../common/pageNavigatorProduct.jsp"/>
    	</td>
	</tr>
</table>
  ������ Navigator �� 
</form>
</div>

</body>
</html>
 -->