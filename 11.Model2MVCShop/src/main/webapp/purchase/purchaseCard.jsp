<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	.purchaseComponet{
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
		$(()=>{			
			$( ".title" ).on("click" , function() {
				if($(this).data("value") !== 'none'){
					const tranNo = $(this).data("value");
					self.location = "/purchase/getPurcahse?tranNo="+tranNo;
				}
			});
			
			$( ".score:contains('물건도착')" ).on("click" , function() {
				const tranNo = $(this).data("value");
				self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3&con=user";
			});			
		})
		
		let page = 2;
		$(window).on("scroll", function() {
	        const scrollHeight = $(document).height();
	        const scrollPosition = $(window).height() + $(window).scrollTop();
	        if (scrollHeight <= scrollPosition) {			
	            console.log(${resultPage.endUnitPage})
	            if(page <=${resultPage.maxPage}){         
	            $.getJSON("/purchase/json/listPurchase",
	                        {
	                            currentPage : page	
	                        },
	                        (data,status)=>{
	                        	if(status ==='success'){
	                        		for(let i=0; i<data.list.length; i++){
	                        			let card = $(".purchaseComponet").clone()[0];
	                        			//let card = $(".product").clone();
	                        			const purchase = data.list[i];
	                        			$(card).find(".title").attr("data-value",purchase.purchaseProd.prodNo).text(purchase.purchaseProd.prodName)
	                        			$(card).find(".date").text(purchase.receiverName)
	                        			$(card).find(".price").text(purchase.receiverPhone)
	                        			$(card).find(".image").attr("src","../images/uploadFiles/"+purchase.purchaseProd.fileName);          			
	                        			
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
    <div class="purchaseComponet">
        <div class="product">
        	<input type="hidden" name="prodNo" value ="${purchase.purchaseProd.prodNo}" />
        	<div class="thumbnail" style="background-image: url('http://folo.co.kr/img/gm_noimage.png')">
          		<img class="image" style="width:200px; height:200px;" src="../images/uploadFiles/${purchase.purchaseProd.fileName}"/>
          	</div>
          	<div class="flex-grow-1 p-4">
          		<c:if test="${purchase.tranCode=='1  '||purchase.tranCode=='2  '}">
          			<h5 class="title" data-value="${purchase.tranNo}">${purchase.purchaseProd.prodName}</h5>
				</c:if>
				<c:if test="${purchase.tranCode != '1  ' && purchase.tranCode !='2  '}">
					<h5 class="title" data-value="none">${purchase.purchaseProd.prodName}</h5>
				</c:if>        
            <p class="date">받는사람 : ${purchase.receiverName}</p>
            <p class="price">받는사람번호 : ${purchase.receiverPhone}</p>
            <p class="float-end">
        		<c:if test="${purchase.tranCode =='1  '}">
					현재 구매 완료 상태입니다.
				</c:if>
				<c:if test="${purchase.tranCode =='2  '}">
					현재 배송중 상태 입니다.
				</c:if>
				<c:if test="${purchase.tranCode =='3  '}">
					현재 배송완료 상태 입니다.
				</c:if>
			</p>
			<c:if test="${purchase.tranCode =='2  '}" >
				<div class="score" data-value="${purchase.tranNo}">				
					물건도착
				</div>
			</c:if>			
			<c:if test="${purchase.tranCode =='3  '&& purchase.star.checkB ==null}">
				<div class="score" style="text-align: center;"
						onClick="window.open('/purchase/score',
						'popWin','left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no')">
						후기등록
				</div>
			</c:if>
			<c:if test="${purchase.star.checkB =='1' }">
				<div style="text-align: center;">후기 등록완료</div>
			</c:if>			
        </div>
    </div>        
    </div>
    </c:forEach>
</div>