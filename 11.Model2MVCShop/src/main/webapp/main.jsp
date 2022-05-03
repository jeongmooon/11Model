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
        @font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body {
			font-family: 'GmarketSansMedium';
			padding-top : 50px;
		}
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->	
</head>
<script type="text/javascript">
	$(function(){
		$(".btitle").on("click",function (){			
			const boardNo = $(this).data("value");
			self.location = "/board/getBoard?boardNo="+boardNo;
		})
		
		$(".boardList").on("click",function(){
			self.location = "/board/listBoard";
		})
		
		$(".ptitle").on("click",function (){			
			const boardNo = $(this).data("value");
			self.location = "/board/getBoard?boardNo="+boardNo;
		})
		
		$(".productList").on("click",function(){
			self.location = "/product/listProduct?searchValue=0";
		})
	})
</script>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
      
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox" style="height:500px;">
          <div class="item active">
            <img src="https://png.pngtree.com/background/20210716/original/pngtree-tranquil-universe-background-picture-image_1337175.jpg" alt="...">
            <div class="carousel-caption">
              
            </div>
          </div>
          <div class="item">
            <img src="https://png.pngtree.com/background/20210716/original/pngtree-tranquil-universe-background-picture-image_1337175.jpg" alt="...">
            <div class="carousel-caption">
              
            </div>
          </div>          
        </div>
      	
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="height:500px;">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="height:500px;">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <div class="row">
        	<div class="col-md-6" style="text-align:center;">
        		<h1 class="boardList" style="border-bottom:3px solid #001D6E;">우리동네 잡담정보</h1>        		
        		<c:forEach var="board" items="${board}">
        			<c:set var="i" value="${ i+1 }" />
        			<div style="display:flex; justify-content: space-between;">
	        			<span class="btitle" style="font-weight:bolder;" data-value="${board.boardNo}">${board.boardTitle}</span>
	        			<span>${board.createAt }</span>
        			</div>
        		</c:forEach>	
        	</div>
        	<div class="col-md-6" style="text-align:center;">
        		<h1 class="productList" style="border-bottom:3px solid #001D6E;">우리동네 판매정보</h1>
        		<c:forEach var="product" items="${list }">
        			<c:set var="i" value="${ i+1 }" />
        			<div style="display:flex; justify-content: space-between;">
        				<span class="ptitle" id="prodId" data-value="${product.prodNo}">${product.prodName}</span>
        				<span>${product.createAt }</span>
        			</div>
        		</c:forEach>  
        	</div>
        </div>
  	 </div>

</body>

</html>