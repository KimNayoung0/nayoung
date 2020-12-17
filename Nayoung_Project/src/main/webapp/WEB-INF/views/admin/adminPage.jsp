<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
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

#search {
	width: 500px;
}
</style>



	<%@include file="include/nav.jsp"%>
	<%@include file="include/adminpageVar.jsp"%>
	<div class="navi">
		<h1>Admin Page</h1>

		<div class="page-navi">
			<ul>
				<li><a id="a" href="/admin/adminPage?currentPage=1">회원 관리</a></li>
				<li><a href="/admin/goods/register">상품 등록</a></li>
				<li><a href="/admin/goods/list">상품 목록</a></li>
				<li><a href="/admin/shop/orderList">주문 목록</a></li>
			</ul>
		</div>
	</div>

	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">
		<center>
			
			<div>
				<table>

					<tr>
						<form action="/admin/adminPage" method="post">
							<input type="hidden" name="currentPage" value="1">
							<td colspan=6><center>
									<input type="text" name="keyword" placeholder="아이디를 입력해주세요."
										id="search">
								</center></td>
							<td colspan=1><center>
									<a href=""><input type="submit" value="검색"
										class="btn btn-success"></a>
								</center></td>
						</form>

					</tr>

					<tr>
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>폰 번호</th>
						<th>이메일</th>
						<th>주소</th>
						<th>가입 날짜</th>
					</tr>
					<c:forEach items="${list }" var="mList" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td>${mList.userId }</td>
							<td>${mList.userName }</td>
							<td>${mList.userPhon }</td>
							<td>${mList.userEmail }</td>
							<td>${mList.userAddr1 }${mList.userAddr2 }${mList.userAddr3 }</td>
							<td>${mList.regDate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan=7><center>${pageNavi }</center></td>
					</tr>
				</table>


			</div>




		</center>
	</div>
	</section>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>





</body>
</html>