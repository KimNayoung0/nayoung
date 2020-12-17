<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

table {
	text-align: center;
}

#container_box table {
	width: 1000px;
}

#container_box table th {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding: 10px;
	border-bottom: 2px;
	background-color: #eee;
}

#container_box table tr:hover {
	background: #eee;
}

#container_box table td {
	padding: 10px;
	text-align: center;
}

#container_box table img {
	width: 150px;
	height: auto;
}

.memberInfo{
margin-top: 15px;
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
		<center>

			<div id="container_box">

				<table>
					<tr class="memberInfo">
						<th>상품 코드</th>
						<th>상품</th>
						<th>분류</th>
						<th>상품명</th>
						<th>가격</th>
						<th>재고량</th>
						<th>등록일</th>
				
					</tr>
					<c:forEach items="${gList }" var="gList" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td><img src="${gList.gdsThumbImg }"></td>
							<td>${gList.gdsCate }</td>
							<td><a href="/admin/goods/view?gdsCode=${gList.gdsCode }">${gList.gdsName }</a>
							</td>
							<td><fmt:formatNumber value="${gList.gdsPrice }"
									pattern="###,###,###" /></td>
							<td>${gList.gdsStock }</td>
							<td><fmt:formatDate value="${gList.gdsDate }"
									pattern="yyyy-MM-dd" /></td>
							
						</tr>
					</c:forEach>
				</table>

			</div>


		</center>
	</div>
	</section>
	<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>




</body>
</html>