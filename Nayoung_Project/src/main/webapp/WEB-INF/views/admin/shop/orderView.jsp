<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰</title>
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

.orderInfo {
	border: 5px solid #eee;
	padding-top: 10px;
	padding-left: 450px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.gdsInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
	padding-left: 250px;
}

.gdsInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}

.deliveryChange {
	text-align: right;
}

.delivery1_btn, .delivery2_btn {
	font-size: 16px;
	background: #fff;
	height: 30px;
	width: 100px;
	padding: 0 0px;
	border-radius: 4px;

}
.deliveryForm{
padding-right: 50px;
}
</style>
	<%@include file="/WEB-INF/views/admin/include/nav.jsp"%>
	<%@include file="/WEB-INF/views/admin/include/adminpageVar.jsp"%>
	<div class="navi">
		<h1>Admin Page</h1>

		<div class="page-navi">
			<ul>
				<li><a href="/admin/adminPage?currentPage=1">회원 관리</a></li>
				<li><a href="/admin/goods/register">상품 등록</a></li>
				<li><a href="/admin/goods/list">상품 목록</a></li>
				<li><a id="a" href="/admin/shop/orderList">주문 목록</a></li>
			</ul>
		</div>
	</div>
	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">

		<div id="container_box">

			<div class="orderInfo">
				<c:forEach items="${orderView }" var="orderView" varStatus="status">

					<c:if test="${status.first }">
						<p>
							<span>주문자</span>${orderView.userId }</p>
						<p>
							<span>수령인</span>${orderView.oName }</p>
						<p>
							<span>주소</span>${orderView.oAddr1 }${orderView.oAddr2 }${orderView.oAddr3 }</p>
						<p>
							<span>가격</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderView.amount }" />
							원
						</p>
						<p>
							<span>상태</span>${orderView.delivery }</p>


						<div class="deliveryChange">
							<form role="form" method="post" class="deliveryForm">

								<input type="hidden" name="oCode" value="${orderView.oCode }">
								<input type="hidden" name="delivery" class="delivery" value="" />

								<button type="button" class="delivery1_btn">배송 중</button>
								<button type="button" class="delivery2_btn">배송 완료</button>

								<script>
									$(".delivery1_btn").click(function() {
										$(".delivery").val("배송 중");
										run();
									});

									$(".delivery2_btn").click(function() {
										$(".delivery").val("배송 완료");
										run();

									});

									function run() {
										$(".deliveryForm").submit();
									}
								</script>
							</form>
						</div>

					</c:if>
				</c:forEach>
			</div>

				<ul class="orderView">
					<c:forEach items="${orderView }" var="orderView">
						<li>
							<div class="thumb">
								<img src="${orderView.gdsThumbImg }" />
							</div>
							<div class="gdsInfo">
								<p>
									<span>상품명</span>${orderView.gdsName }<br> <span>개당
										가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderView.gdsPrice }" />
									원 <br> <span>구입 수량</span>${orderView.odQt }개<br> <span>최종
										가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderView.gdsPrice * orderView.odQt}" />
									원
								</p>
							</div>
						</li>
					</c:forEach>
				</ul>
		</div>


	</div>
	</section>
	<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>


</body>
</html>