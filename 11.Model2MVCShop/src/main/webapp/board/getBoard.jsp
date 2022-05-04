<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	$(function(){
		$("#commentBtn").on("click",function(){
			const boardNo = $("#title").data("value");
			const cm = $("input[name=contents]").val();
			$.ajax({
				url:"/comment/json/addComment",
				method:"POST",
				data:{
					boardNo:boardNo,
					contents:cm
				},
				dataType:"json",
				success: function(data){					
					//const cmCard = $(".cmForm").clone()[0];
					
					const cmCard = "<div class='cmForm' style='margin:10px;'>"
						   			+	"<div style='display:flex; justify-content: space-between;'>"
						   			+		"<h4 class='userId'>"+data.userId+"</h4><h5 class='cmDate'>"+data.updateAt+"</h5>"
						   			+	"</div>"
					   				+	"<div style='display:flex; justify-content: space-between;'>"
					   				+		"<h5 class='cm'>"+data.contents+"</h5>"
						   			+		"<button class='deleteCm' data-value='${comment.bcNo}'>삭제하기</button>"
						   			+	"</div>"
						   			+"</div>"
						   			+"<hr />"
					/*
		   			$(cmCard).find(".userId").text(data.userId);
					$(cmCard).find(".cm").text(data.contents);
					$(cmCard).find(".cmDate").text(data.updateAt);
					*/
					console.log(cmCard)
					$(".cmBox").append(cmCard);
					$("input[name=contents]").val("");
				}
			})			
		})
		
		$(".deleteCm").on("click",function(){
			const bcNo = $(this).data("value");
			const tag = ($(this).parent()).parent();
			$.getJSON("/comment/json/deleteComment/"+bcNo,
					(data,status)=>{
						if(status =='success'){
							alert("삭제성공")
							tag.empty();
							tag.html("삭제된 댓글 입니다.");
						}
					}
			)
		})
		
	})
</script>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	<div class="container">
   		<h1 id="title" style="text-align:center; border-bottom:3px solid #001D6E;" data-value="${board.boardNo}">${board.boardTitle }</h1>
   		<div style="text-align:right; border-bottom:3px solid #001D6E;">
   			<h4>${board.userId }</h4>
   			<h5>${board.createAt}</h5>
   		</div>
   		
   		<div class="row">
   			<div class="col-md-3" style="text-align:center;"></div>
   			<div class="col-md-6" style="text-align:center;"><img src=""></div>
   			<div class="col-md-3" style="text-align:center;"></div>
   		</div>
   		
   		<div class="row" style="border:1px solid red; margin:10px;">   			
   			<div class="col-md-3" style="text-align:center;"></div>
   			<div class="col-md-6" style="text-align:center; height:500px;">   				
   				${board.boardContent}
   			</div>
   			<div class="col-md-3" style="text-align:center;"></div>
   		</div>
   		
   		<div class="row" style="border:1px solid red; margin:10px;">
	   			<div style="display:flex;justify-content: center;">
	   				<input type="hidden" name="boardNo" value="${board.boardNo}" />
	   				<input type="text" name="contents" style="width:90%; height:50px; margin:10px;" />
	   				<button id="commentBtn" style="height:50px; margin:10px;">입력</button>
	   			</div>
	   		<div class="cmBox">
	   			<c:forEach var="comment" items="${board.comment}">	   				
	   				<c:if test="${comment.status == 0}">
		   				<div class="cmForm" style="margin:10px;">
			   				<div style="display:flex; justify-content: space-between;">
			   					<h4 class="userId">${comment.userId}</h4><h5 class="cmDate">${comment.updateAt}</h5>
			   				</div>
			   				<div style="display:flex; justify-content: space-between;">
			   					<h5 class="cm">${comment.contents}</h5>
			   					<button class="deleteCm" data-value="${comment.bcNo}">삭제하기</button>
			   				</div>
			   			</div>
			   			<hr />
		   			</c:if>
		   			<c:if test="${comment.status == 1}">
		   				<div class="cmForm" style="margin:10px;">
			   				삭제된 댓글 입니다.
			   			</div>
			   			<hr />
			   		</c:if>
	   			</c:forEach>	   			
   			</div>   			
   		</div>
   	</div>
	
</body>
</html>