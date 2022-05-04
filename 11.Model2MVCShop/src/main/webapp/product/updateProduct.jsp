<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
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
    </style>
<script type="text/javascript" src="../javascript/calendar.js">
</script>
<script type="text/javascript">
	const fncAddProduct = () =>{
	const name = $("input[name='prodName']").val();
	const detail = $("#prodDetail").val();
	const manuDate = $("input[name='manuDate']").val();
	const price = $("input[name='price']").val();
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method","POST").attr("action","/product/updateProduct").attr("enctype","multipart/form-data").submit();
}

	$(function() {
		$("button.btn.btn-primary").on("click" , function() {
			fncAddProduct();
		});
	 
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});			
	});

	function readURL(input) {
	if (input.files && input.files[0]) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview').src = "";
	}
}


</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
<div class="container">
	<form class="form-horizontal">
		<input type="hidden" name="prodNo" value="${product.prodNo}" />
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명" value="${product.prodName }">
			</div>
		</div>
		
		<div class="form-group">
			<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
			<div class="col-sm-4">
				<textarea type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세설명">${product.prodDetail }</textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
			<div class="col-sm-4">
				<input type="date" class="form-control" name="manuDate" value="${product.regDate }">
			</div>
		</div>
		
		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="price" placeholder="원" value="${product.price }">
			</div>
		</div>
		
		<div class="form-group">
			<label for="stock" class="col-sm-offset-1 col-sm-3 control-label">추가 재고</label>
			<div class="col-sm-4">
				<input type="number" class="form-control" name="stock" value="0">
			</div>
		</div>
		
		<div class="form-group">
			<label for="stock" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
			<div class="col-sm-4">				
				<input type="file" name="file" multiple="multiple" required="required" class="file" onchange="readURL(this);" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="stock" class="col-sm-offset-1 col-sm-3 control-label">미리보기</label>
			<div class="col-sm-4">				
				<img id="preview" style="width:200px; height:200px;" src="../images/uploadFiles/${product.fileName}">
			</div>
		</div>		
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary"  >수정</button>
				<a class="btn btn-primary btn" href="#" role="button">취소</a>
			</div>
		</div>
	</form>
</div>
</body>
</html>