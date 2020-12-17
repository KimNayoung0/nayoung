<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>자유게시판</title>

<!-- 라이브러리 순서 매우중요 ! -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>



<style>
td {
	width: 150px;
}

#exampleModal {
	color: black;
}

#tableBar {
	background-color: #ececec;
}

#search {
	width: 850px;
}

.bTitle {
	color: #6cc091;
}

.writeBtn {
	float: right;
}

#search {
	float: left;
}

.search_td {
	padding-left: 80px !important;
}

#writeBtn {
	border-radius: 30px;
	background-color: #6cc091;
	color: #ffffff !important;
}

#pageNavi {
	color: #6cc091;
}
</style>


</head>
<body class="subpage">


	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>

	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">
		<header class="align-center">
		<h3>게시판</h3>
		<p>Welcome to my project!</p>
		</header>
		<center>


			<table class="table table-hover">

				<tr>
					<form action="/boardList" method="post">
						<input type="hidden" name="currentPage" value="1">
						<td colspan="5" align="center" class="search_td"><input
							type="text" name="keyword" placeholder="제목을 입력하세요." id="search">
							<a href=""><input type="submit" value="검색"
								class="btn btn-success"></a></td>

					</form>

				</tr>

				<tr id="tableBar">
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성 날짜</th>
					<th>조회수</th>
				</tr>

				<!-- form태그에서 값 받아 가는 건 action주소만이다. a태그로 줄 거면 ?붙여서 값 보내줘야됨 -->
				<!-- varStatus="i"는 i.count 무조건 12345 로 써주기 위해서 -->
				<c:forEach items="${list }" var="b" varStatus="i">
					<tr>
						<td>${i.count }</td>

						<td><a class="bTitle" href="/boardSelect?bCode=${b.bCode }"
							onclick="Password(this,event)" name="bTitle"> <input
								type="hidden" name="bCode" value="${b.bCode }"> <input
								type="hidden" name="bSecret" value="${b.bSecret }"> <input
								type="hidden" name="bPw" value="${b.bPw }">
								<c:if
									test="${b.bSecret eq 'Y'}">	
                                           	비밀글입니다.					
                        </c:if> <c:if test="${b.bSecret eq 'N'}">	
                                            ${b.bTitle}					
                        </c:if>
						</a></td>

						<td>${b.bWriter }</td>
						<td>${b.bRegDate }</td>
						<td>${b.bHit }</td>

					</tr>
				</c:forEach>


				<tr>
					<td colspan=6 id="pageNavi">
						<center>${pageNavi }</center>
					</td>
				</tr>
			</table>
			<div class="writeBtn">
				<a id="writeBtn" type="button" class="btn btn-light"
					href="/writeFrm" id="writeBtn">글 작성</a>
			</div>
		</center>

	</div>
	</section>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>





	<!-- Modal -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
				</div>
				<div class="modal-body">
					<form action="/boardSelect" method="post" id="form">
						비밀번호 입력 : <input type="password" id="modalInput"> <input
							type="hidden" name="bCode">
						<!-- bCode 들어감-->
						<input type="hidden" id="bPw" name="bPw">
						<!--value에 bPw 안들어감  -->
					</form>
				</div>
				<div class="modal-footer">
					<button id="modalBtn" class="btn btn-primary" onclick="ok();">확인</button>
					<button id="modalBtn" type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		/* 비밀글입니다 제목 클릭시 */
		function Password(element, e) {
			e.preventDefault(); //기본 이벤트를 무시함, a태그나 input의 submit을 무시
			if ($(element).find('input[name="bSecret"]').val() === 'Y') { //find 찾는다 비밀글 설정 값이 Y인 것을 
				$('#exampleModal').find('input[name="bCode"]').val(
						$(element).find('input[name="bCode"]').val())
				$('#exampleModal').find('input[name="bPw"]').val(
						$(element).find('input[name="bPw"]').val())
				$('#exampleModal').modal()
				//모달창에서 찾는다 이 게시물의 bCode를, 그리고 그 게시물에서 

			} else {
				window.location.href = $(element).prop('href')
			}
		}

		//모달창 넘어가는 코드

		function ok() {
			if ($('#exampleModal').find('input[name="bPw"]').val() == $(
					'#exampleModal').find('#modalInput').val()) {
				$('#form').submit()
			}

		}
	</script>


</body>
</html>
