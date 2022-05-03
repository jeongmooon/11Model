<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
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
</style>
<div id="test">
	<c:forEach var="board" items="${board}">
		<c:set var="i" value="${ i+1 }" />
    <div class="productComponet">
        <div class="product">
          <div class="thumbnail" style="background-image: url('http://folo.co.kr/img/gm_noimage.png')">
          <img class="image" style="width:200px; height:200px;" src="../images/uploadFiles/"/>
          </div>
          <div class="flex-grow-1 p-4">
			<h5 class="title" style="font-size:larger; text-align:center;" data-value="${board.boardNo}" >${board.boardTitle}</h5> 
            <p class="date">등록일 : ${board.createAt}</p>
            <p class="price">동네 : ${board.region}</p>
            <p class="float-end">카테고리 : ${board.boardCategory }</p>
			<h4 class="status" title="stauts" style="text-align:center;">
				테스트중
			</h4>
          </div>
        </div>	
    </div>
    </c:forEach>    
</div>
<span id="b">scroll < 500px</span>