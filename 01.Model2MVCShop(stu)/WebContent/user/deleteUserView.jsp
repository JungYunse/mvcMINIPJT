<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	
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
	<script type="text/javascript">
	
	$(function(){
		$("button:contains('����')").on("click",function(){
			$("form").attr("method" , "POST").attr("action" , "/user/deleteUser").submit();
		})
		
		
	})
	
</script>
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<h3 class="text-info">ȸ�� ���� </h3>
	</div>

	<form class="form-horizontal">
<div class="container">
		<div class="form-group">
			<div class="panel panel-default">
				<div class="panel panel-warning">���� ���� �Ͻðڽ��ϱ�?</div>
				<div class=""><input type="text" id="deleteText" placeholder="id�� �Է����ּ���" value="${getUser.userId }">	</div>
				
			</div>
		</div>
		
		<div>
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">����</button>
			
		</div>
</div>
	</form>
</body>
</html>