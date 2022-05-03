<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>게시판 상세보기</title>
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
			padding-top : 50px;
		}
</style>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	<div class="container">
   		<h1 style="text-align:center; border-bottom:3px solid #001D6E;">${board.boardTitle }</h1>
   		<div style="text-align:right; border-bottom:3px solid #001D6E;">
   			<h4>${board.userId }</h4>
   			<h5>${board.createAt}</h5>
   		</div>
   		
   		<div class="row">
   			<div class="col-md-3" style="text-align:center;"></div>
   			<div class="col-md-6" style="text-align:center;"><img src=""></div>
   			<div class="col-md-3" style="text-align:center;"></div>
   		</div>
   		
   		<div class="row">   			
   			<div class="col-md-3" style="text-align:center;"></div>
   			<div class="col-md-6" style="text-align:center;">   				
   				${board.boardContent}
   			</div>
   			<div class="col-md-3" style="text-align:center;"></div>
   		</div>
   	</div>
	
</body>
</html>