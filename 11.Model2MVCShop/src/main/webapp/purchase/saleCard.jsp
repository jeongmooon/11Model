<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<style>
	.saleComponet{
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
    .score{
    	text-align: center;
    	cursor: pointer;
    }
    .score:hover{
    	color:red;
    	trasition:3s;
    }
</style>
<script>
	$(function(){		
		$(".float-end:contains('배송하기')").on("click",function(){
			const tranNo = $(this).data("value");
			self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=2&con=''";
		})
		
	})
	
	let page = 2;
		$(window).on("scroll", function() {
	        const scrollHeight = $(document).height();
	        const scrollPosition = $(window).height() + $(window).scrollTop();
	        if (scrollHeight <= scrollPosition) {			
	            console.log(${resultPage.endUnitPage})
	            if(page <=${resultPage.maxPage}){         
	            $.getJSON("/purchase/json/listSale",
	                        {
	                            currentPage : page	
	                        },
	                        (data,status)=>{
	                        	if(status ==='success'){
	                        		for(let i=0; i<data.list.length; i++){
	                        			let card = $(".saleComponet").clone()[0];
	                        			//let card = $(".product").clone();
	                        			const purchase = data.list[i];
	                        			$(card).find(".title").attr("data-value",purchase.tranNo).text(purchase.purchaseProd.prodName)
	                        			$(card).find(".date").text(purchase.receiverName)
	                        			$(card).find(".price").text(purchase.receiverPhone)
	                        			$(card).find(".image").attr("src","../images/uploadFiles/"+purchase.purchaseProd.fileName);          			
	                        			
	                        			console.log(purchase)
	                        			
	                        			if(purchase.tranCode==="1  "){
	                        				$(card).find(".float-end").attr("data-value",purchase.tranNo).text("구매확인 배송하기")
	                        			} else if(purchase.tranCode==="2  "){
	                        				$(card).find(".float-end").text("구매확인 대기중")
	                        			} else if(purchase.tranCode==="3  "){
	                        				$(card).find(".float-end").text("배송완료")
	                        			}
	                        				                        			
	                        			$(".float-end:contains('배송하기')").on("click",function(){
	                        				const tranNo = $(this).data("value");
	                        				self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=2&con=''";
	                        			})
	                        			
	                        			$("#test").append(card);	                        			
	                        		}	                        		
	                        	}
	                        })
	            }
	            page++
	        }        
	    });
	
	
</script>
<div id="test">
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
    <div class="saleComponet">
        <div class="product">
        	<input type="hidden" name="tranNo" value ="${purchase.tranNo}" />
        	<div class="thumbnail" style="background-image: url('http://folo.co.kr/img/gm_noimage.png')">
          		<img class="image" style="width:200px; height:200px;" src="../images/uploadFiles/${purchase.purchaseProd.fileName}"/>
          	</div>
          	<div class="flex-grow-1 p-4">
          		<c:if test="${purchase.tranCode=='1  '||purchase.tranCode=='2  '}">
          			<h5 class="title" data-value="${purchase.tranNo}">${purchase.purchaseProd.prodName}</h5>
				</c:if>
				<c:if test="${purchase.tranCode != '1  ' && purchase.tranCode !='2  '}">
					<h5 class="title">${purchase.purchaseProd.prodName}</h5>
				</c:if>        
            <p class="date">받는사람 : ${purchase.receiverName}</p>
            <p class="price">받는사람번호 : ${purchase.receiverPhone}</p>
            <p class="float-end" data-value="${purchase.tranNo}">
				<c:if test="${purchase.tranCode== '1  '}">
					구매완료 배송하기
				</c:if>
				<c:if test="${purchase.tranCode== '2  '}">
					구매확인 대기중
				</c:if>
				<c:if test="${purchase.tranCode =='3  '}">
					배송완료
				</c:if>
			</p>
        </div>
    </div>        
    </div>
    </c:forEach>
</div>