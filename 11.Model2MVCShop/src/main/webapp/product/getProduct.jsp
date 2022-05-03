<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품상세조회</title>
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
	
	h2{
		text-align: center;
	}
    .star {
        position: relative;
        font-size: 2rem;
        color: #ddd;
    }
    
    .star input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
    }
    
    .star span {
        width: 0;
        position: absolute; 
        left: 0;
        color: red;
        overflow: hidden;
        pointer-events: none;
    }
    
    .inputBtn{
    }
    .inputBtnE{
    	text-align: center;
    	border: 1px solid #ddd;
		box-shadow: 0.5px 0.5px gray;
		cursor: pointer;
    }
    
    .inputBtn:hover{
    	color:red;
    }
    
    
    textarea{
        width: 100%;
        height: 500px;
        resize: none;
        -webkit-border-radius: 5px;
	    -moz-border-radius: 5px;
	    border-radius: 5px;
    }
    
    .img-thumbnail{
    	margin : 10px;
    	width : 100%;
    	height: 550px;
    	margin : auto;
    	vertical-align:middle;
    }
    
    .box-line{
    	border: 1px solid #ddd;
    	padding : 20px;
    }
    .col-md-6{
    	/*border: 1px solid #ddd;*/
    	padding : 10px;
    }
    .btn{
    	&+&{
    		margin:20px;
    	}
    }
    
    .card-bottom{
    	position: absolute;
    	bottom: 0;
    	width : 100%;
    }
    
</style>
<script type="text/javascript">
	const fncCoupon = (()=>{
	    const num = [];
		    for(let i=1; i<100; i++){
		        num.push(i);
		    }
		    const result = [];
		    
		    for(let i=0; i<1; i++){
		        const index= Math.floor(Math.random()*(num.length-i));
		        if(num[index]<11 && 1<num[index]){
		            result.push("1");
		            break;
		        }
		        if(num[index]<16 && 11<num[index]){
		            result.push("2");
		            break;
		        }
		        result.push("0");
		        //num.splice(index,1);
		    }
		    let display;
				switch(result[0]) {
				case "1" : display ="10%할인권";
					break;
				case "2" : display ="20%할인권";
					break;
				default : display = "꽝";
			}
	    	alert(display);
	    	$('.couponBtn').attr("disabled","disabled");
		    $.ajax(
		    	{
		    		url : "/coupon/json/addCoupon",
		    		method : "GET",
		    		data : {
		    			salePercent : result[0],
		    			eventNum : "1"
		    		},
		    		dataType : "json",
		    		success : function(data, status) {
		    			
		    		}
		    	}		
		    )		    
	})    

	$(function() {
		 // 구매 버튼
		 $(".btn-primary:contains('구매')").on("click", function(){
			 self.location = "/purchase/addPurchase?prodNo=${product.prodNo}";
		 })
		 
		 // 쿠폰버튼
		 $(".btn-primary:contains('쿠폰')").on("click", function(){
			 fncCoupon();
		 })
	});
</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="container">
		<div class="row">
	  		<div class="col-md-6" style="height:700px">
	  			<c:if test="${!empty product.fileName}">
	  				<img src="../images/uploadFiles/${product.fileName}" alt="..." class="img-thumbnail" onerror="this.src='http://folo.co.kr/img/gm_noimage.png'">
	  			</c:if>
	  			<c:if test="${empty product.fileName}">
	  				<img src="http://folo.co.kr/img/gm_noimage.png" alt="..." class="img-thumbnail">
	  			</c:if>
				<div class="card-bottom" style="position: absolute; bottom: 0;">
					<h3>평점 :
						<c:if test="${!empty product.star.score}">
							${product.star.score}
						</c:if>
						<c:if test="${empty product.star.score}">
							평가 없음
						</c:if>
					</h3>
				</div>
	  		</div>
			<div class="col-md-6" style="height:700px">
				<div style="text-align:center;"><h1 style="font-size:50px;">${product.prodName}</h1></div>
				<div style="display:flex; justify-content: space-between;">
					<div></div>
					<h2>${product.price } 원</h2>
				</div>
				<div class="box-line">
					<div style="display:flex; justify-content: space-between;">
						<h4>${user.userId} 님을 위한 혜택</h4>
						<input id="coupon" type="hidden" name="coupon" value="" />
						<button class="btn btn-primary couponBtn" >쿠폰 받기</button>
					</div>
					<hr/>
					<div>
						<div style="display:flex; justify-content: space-between;">
							<h5>최대 할인가</h5>
							<h4 style="color:red;">${product.price }원</h4>
						</div>
						<div style="display:flex; justify-content: space-between;">
							<h5>등록 일자</h5>
							<h4>${product.regDate}</h4>
						</div>
						<div style="border: 1px solid #dce0e3; padding:10px; background-color: #f7f8fa; height:180px;">
							<h5>상세 설명</h5>
							<h4>${product.prodDetail }</h4>
						</div>
					</div>
					<br/>
				</div>
				<div class="row">
					<div class="card-bottom">
						<div style="padding:10px;">
							<button class="btn btn-primary col-md-2" style="width:100%;">구매하기</button>	
						</div>
						<div style="padding:10px; margin-top:10px;">
							<div style="display:flex; justify-content: space-between; margin-top: 10px">
								<button class="btn btn-primary" style="width:32%;">문의하기</button>
								<button class="btn btn-primary" style="width:32%;">장바구니</button>
								<button class="btn btn-primary" style="width:32%;">관련상품</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>