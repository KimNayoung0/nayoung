<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>

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
th {
	width: 100px;
}

.oriImg {
	width: 500px;
	height: auto;
}

.gdsDetail img {
	max-width: 600px;
	height: auto;
}

.thumbImg {
	float: left;
}

.goodsInfo {
	height: 400px;
	padding: 0 12em;
}
.goodsInfo_info{

    padding-left: 500px;
    padding-top: 30px;

}
.goodsInfo_info div{
padding-bottom: 10px;
}

.btn{
height: 45px;
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
				<li><a id="a" href="/admin/goods/list">상품 목록</a></li>
				<li><a href="/admin/shop/orderList">주문 목록</a></li>
			</ul>
		</div>
	</div>
	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">


		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="gdsCode" value="${goods.gdsCode }">
			<!-- 수정하려고 gdsCode 가져옴 -->
			<div class="goodsInfo">
				<div class="goodsInfo_img">
					<img src="${goods.gdsThumbImg }" class="thumbImg" />
				</div>
				
				<div class="goodsInfo_info">
					<div>
						<label for="gdsCate">상품 분류</label> <span>${goods.gdsCate }</span>
					</div>

					<div>
						<label for="gdsName">상품명</label> <span>${goods.gdsName }</span>
					</div>

					<div>
						<label for="gdsPrice">상품 가격</label> <span><fmt:formatNumber
								value="${goods.gdsPrice }" pattern="###,###,###" /></span>
					</div>

					<div>
						<label for="gdsStock">상품 수량</label> <span><fmt:formatNumber
								value="${goods.gdsStock }" pattern="###,###,###" /></span>
					</div>
				</div>
			</div>

			<center>
				<div>
					<label for="gdsDetail"><h5>[상세 설명]</h5></label>
					<div class="gdsDetail">${goods.gdsDetail }</div>
				</div>

				<div>
					<br>
					<button type="button" id="modify_Btn" class="btn">수정</button>
					<button type="button" id="delete_Btn" class="btn">삭제</button>
				</div>
		</form>




		</center>
	</div>
	</section>
	<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>
	<script>
		var formObj = $("form[role = 'form']");

		$('#modify_Btn').click(function() {
			formObj.attr("action", "/admin/goods/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$('#delete_Btn').click(function() {

			var con = confirm("정말로 삭제하시겠습니까?");

			if (con) {
				formObj.attr("action", "/admin/goods/delete");
				formObj.submit();
			}
		});
	</script>




</body>
</html>
