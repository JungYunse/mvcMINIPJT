<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
   	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script type="text/javascript">
   	
    var page = 2;

    $(window).scroll(function() {
        if ( $(window).scrollTop() == $(document).height() - $(window).height()) {
         // console.log(++page);
          $("body").append('<div class="container"><h1></h1></div>');
          
		
        }
    });
    
    
    

//     $.ajax({
// 		url:"/product/json/getProduct/"+10000, 
// 		method:"GET",
// 		dataType:"json",
// 		headers:{
// 			"Accept" : "application/json",
// 			"Content-Type" : "application/json"
// 		},
// 		success:function(JSONData , status){
// //				alert(status);
// //				//Debug...
// //				alert("JSONData : \n"+JSONData.price);
			
// 			var displayValue="<h6>"
// 				+"상품번호: "+ JSONData.prodNo +"<br/>"
// 				+"상세정보: "+ JSONData.prodDetail +"<br/>"
// 				+"이  름    : "+ JSONData.manuDate +"<br/>"
// 				+"등록일   : "+ JSONData.regDate +"<br/>"
// 				+"가격      : "+ JSONData.price +"<br/>"
// 				+"제품사진: <img src='../images/uploadFiles/"+ JSONData.fileName +"'></img><br/>"
// 				+"</h6>";
				
// 				alert('ss'+displayValue)
// 		}
		
//     })
// 				$("h6").remove();
// 				$("#"+prodNo+"").html(displayValue);
// 				//h3 태그를 넣어줄 곳을 찾는 다.
// 		}
		
// 	})
		
		

   	</script>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body style="overflow:scroll;">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
     </div>
    </div>

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <h3>내 인도친구는 이렇게 말했지.</h3>
        <p>"어제보다 나은 오늘을 살면 충분하다."</p>
  	 	
         <h3>Friedrich Nietzsche</h3>
         <p>Gott ist tott. Gott bleibt todt.</p>
		 <p>Und wir haben ihn getodtet.</p>
		 <p>Wie trosten wir uns, die Morder aller Morder?</p>
         
  	 </div>
  	 
  	

</body>

</html>