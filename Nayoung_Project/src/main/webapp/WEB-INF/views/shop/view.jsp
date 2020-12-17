<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
</head>
<body class="subpage">

	<style>
#goodsList {
	display: inline-block;
	margin: 10px;
}

div.goods div.goodsImg {
	float: left;
	width: 50%;
	height: 400px;
}

div.goods div.goodsImg img {
	width: 70%;
	height: 90%;
	padding-left: 30px;
}

div.goods div.goodsInfo {
	float: right;
	width: 50%;
	height: 400px;
	font-size: 22px;
}

div.goods div.goodsInfo p {
	margin: 20px 120px 10px 0;
}

div.goods div.goodsInfo p span {
	display: inline-block;
	width: 100px;
	margin-right: 15px;
}

div.goods div.goodsInfo p.cartStock input {
	font-size: 12px;
	width: 40px;
	padding: 3px;
	margin: 0;
	border: 1px solid #eee;
}

div.goods div.goodsInfo p.cartStock button {
	border: 0px !important;
	background: none;
	box-shadow: inset 0 0 0 0px;
	padding: 0 0px;
	height: 2em;
}

div.goods div.goodsInfo p.addToCart {
	text-align: right;
}

div.goods div.gdsDetail {
	font-size: 18px;
	clear: both;
	padding-top: 30px;
	border-top: 1px solid #9a9a9a;
}

.addCart_btn {
	height: 2em;
	padding: 0 5px;
	border-radius: 5px;
	font-size: 15pt;
}

.goodsTop {
	width: 100% !important;
	height: 400px !important;
}

.goodsImg {
	width: 50% !important;
}

.goodsInfo {
	width: 50% !important;
	font-size: 17px !important;
	padding-top: 60px;
}
</style>



	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>

	<!-- Three -->
	<section id="three" class="wrapper"> <header
		class="align-center"> <a href="/shop/list?gdsCate=마스크"><h3>Shop</h3></a>
	<p>Welcome to my project!</p>
	</header> <%@ include file="/WEB-INF/views/include/shopMenu.jsp"%>
	<div class="inner">


		<form role="form" method="post">
			<input type="hidden" name="gdsCode" id="gdsCode"
				value="${view.gdsCode}" />
		</form>

		<div class="goods">
			<div class="goodsTop">
				<div class="goodsImg">
					<img src="${view.gdsImg}">
				</div>

				<div class="goodsInfo">
					<p class="gdsName">
						<span>상품명</span>${view.gdsName}</p>

					<p class="gdsCate">
						<span>카테고리</span>${view.gdsCate}</p>

					<p class="gdsPrice">
						<span>가격 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
						원
					</p>

					<p class="gdsStock">
						<span>재고 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
						EA
					</p>

					<c:if test="${view.gdsStock != 0 }">

						<p class="cartStock">
							<span>구입 수량</span>
							<button type="button" class="plus">+</button>
							<input type="number" class="numBox" min="1"
								max="${view.gdsStock}" value="1" readonly />
							<button type="button" class="minus">-</button>
						</p>

						<p class="addToCart">
							<c:choose>
								<c:when
									test="${sessionScope.member.verify ==0}">
									<button type="button" class="addCart_btn">카트에 담기</button>
								</c:when>
								<c:when test="${sessionScope.member.verify ==9}">
									(관리자모드로 구매 불가능)
								</c:when>
								<c:when
									test="${sessionScope.member == null}">
									<button type="button" class="addCart_btn">카트에 담기</button>
								</c:when>
							</c:choose>
						</p>
					</c:if>

					<c:if test="${view.gdsStock ==0 }">
						<p>상품 수량이 부족합니다.</p>
					</c:if>
				</div>
			</div>

			<center>
				<div class="gdsDetail">${view.gdsDetail}</div>
			</center>
		</div>


	</div>
	</section>





	<%@include file="/WEB-INF/views/include/footer.jsp"%>




	<script>
	
$(".plus").click(function(){
	   var num = $(".numBox").val();
	   var plusNum = Number(num) + 1;
	   
	   if(plusNum >= ${view.gdsStock}) {
	    $(".numBox").val(num);
	   }else {
	    $(".numBox").val(plusNum);          
	   }
	  });
	  
	  
	  
	  $(".minus").click(function(){
	   var num = $(".numBox").val();
	   var minusNum = Number(num) - 1;
	   
	   if(minusNum <= 0) {
	    $(".numBox").val(num);
	   } else {
	    $(".numBox").val(minusNum);          
	   }
	  });
	  
	  
	  
	  $(".addCart_btn").click(function(){
		  var gdsCode = $("#gdsCode").val();
	 	  var cQt = $(".numBox").val();
	 	  
	 	  var data = {
	 			  gdsCode : gdsCode,
	 			  cQt : cQt
	 	  };
	 	  
	 	  $.ajax({
	 		url : "/shop/view/addCart",
	 		type : "post",
	 		data : data,
	 		success : function(result){
	 			
	 			if(result ==1){
	 				alert("카드 담기 성공");
		 			$(".numBox").val("1");
	 			}else{
	 			     alert("회원만 사용할 수 있습니다.")
	 			     $(".numBox").val("1");
	 			}
	 		},
	 		error : function(){
	 			alert("카트 담기 실패");
	 		}
	 	  });
	  });
</script>




</body>
</html>