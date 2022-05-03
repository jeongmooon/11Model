<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- css body 적용 -->
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
</head>
<style>
       @font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body {
			font-family: 'GmarketSansMedium';
			padding-top : 100px;
		}
		.productComponet{
			justify-content: center;
		}
	    .product {
	        display: flex;
	        padding: 10px;
	        justify-content: center;
	    }
	    .thumbnail {
	        max-width: 200px;
	        width: 200px;
	        border-radius: 10px;
	        background-size: cover;
	        background-position: center;        
	        
	    }
	    .flex-grow-1{
	    	padding-left:50px;
	    }
	    .product .price {
	        font-size: 16px;
	        font-weight: 600;
	    }
	    .product .title {
	        font-size: 17px;
	        font-weight: 600;
	    }
	    .product .date {
	        color: grey;
	        font-size: 13px;
	    }
	    span{
	            color:white;
	    }
	    
	    .addBtn{
	    	display:flex;
	    	background-color:#001D6E;
	    	width:50px;
	    	height:50px;
	    	border-radius:100%;
	    	justify-content:center;
	    	align-items:center;	    	
	    }
</style>
<script type="text/javascript">
	$(function(){
		$( ".addBtn" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/board/addBoard");
		});
	})
</script>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<div class="list-group">
					 <a href="#" class="list-group-item" data-value="0">전체글 보기</a>
					 <a href="#" class="list-group-item" data-value="1">이름 정렬</a>
					 <a href="#" class="list-group-item" data-value="2">가격낮은순</a>
					 <a href="#" class="list-group-item" data-value="3">등록일빠른순</a>
					 <a href="#" class="list-group-item" data-value="4">안팔린물건</a>
				</div>		
			</div>
			<div class="col-md-6 display">
				<div style="text-align:center;">
					<input type="hidden" name="searchCondition" id="searchCondition" value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>
					<div class="col-md-10">
						<input name="searchKeyword" type="text" class="form-control" id="searchKeyword" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-primary col-md-2">검색</button>			
				</div>
				
				<div class="disW">		
					<jsp:include page="boardCard.jsp" />
			   	</div>
			   	
				</div>
				<div class="col-md-2" style="position: fixed; right: 5%; bottom: 5%;">
					<div class="addBtn">
						<h1 style="color:#fff; font-size:50px;">+</h1>
					</div>
				</div>				
			</div>			
		</div>
	   	
</body>
</html>