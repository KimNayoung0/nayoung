<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물</title>
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
ul {
	list-style: none;
}

.commentUpdateFrm {
	display: none;
}

#board {
	color: #6cc091;
}

#board:hover {
	color: gray;
}

#commentBtn {
	box-shadow: 0 0 0 0 !important;
	background-color: #6cc091 !important;
	height: 38px !important;
	color: white !important;
}

button {
	box-shadow: 0 0 0 0 !important;
	height: 38px !important;
	color: white !important;
}

#commentInput {
	width: 35% !important;
	float: left;
	border: 1px solid #bbb !important;
	border-radius: 5px;
}

#coContent {
	width: 35% !important;
	float: left;
	border: 1px solid #bbb !important;
	border-radius: 5px;
}
.board-up-del-btn a{
	box-shadow: 0 0 0 3px #6cc091;
	color: #6cc091 !important;
	border-radius: 30px;
	padding: 0 1em;
	text-align: center;
}

</style>


</head>
<body class="subpage">
	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>

	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">
		<header class="align-center">
		<h3>게시물</h3>
		<p>Welcome to my project!</p>
		</header>

		<input type="hidden" name="bCode" value="${b.BCODE }"> 제목 :
		${b.BTITLE }<br> 작성자 : ${b.BWRITER }<br> 내용 : ${b.BCONTENT }<br> 작성일 : ${b.BREGDATE }<br><br>
		<div class="board-up-del-btn">
			<c:if test="${sessionScope.member.userId eq b.BWRITER}">
				<!-- 본인이 작성한 글에만 수정 삭제 버튼이 활성화 되도록 -->
				<a href="/boardUpdateView?bCode=${b.BCODE }" type="button"
					class="btn">수정</a>&nbsp;&nbsp;
				<a type="button" class="btn" data-toggle="modal"
					data-target="#exampleModal">삭제</a>
			</c:if>
		</div>
		<hr>

		[파일 목록]
		<!--forEach는 List, 배열 요소를 순서대로 반복해서 처리할 수 있는 태그 입니다.-->
		<!-- file List에는 FILESIZE,ORGFILENAME, FCODE 처럼 대문자로 들어가있기때문에 그에 맞춰 jstl을 작성해줘야한다. -->

		<form name="readForm" role="form" method="post">
			<input type="hidden" name="fCode" id="fCode" value="">
		</form>

		<c:forEach var="file" items="${file }">

			<a href="#" onclick="fileDown('${file.FCODE}'); return false;">${file.ORGFILENAME }</a>(${file.FILESIZE }kb)<br>

		</c:forEach>



		<br> [댓글] <br>
		<form action="/insertComment" method="post">
			<input type="hidden" name="bCode" value="${b.BCODE }"> <input
				type="hidden" name="coWriter" value="${sessionScope.member.userId }">
			<input id="commentInput" type="text" name="coContent" required
				placeholder="댓글을 입력해주세요."> &nbsp;&nbsp;&nbsp;
			<button id="commentBtn" type="submit" class="btn btn-light">작성</button>
		</form>




		<c:forEach var="bcList" items="${bcList }">

			<ul>
				<li><span>- [${bcList.coWriter }] ${bcList.coContent } </span>
					<c:if test="${sessionScope.member.userId eq bcList.coWriter }">
						<button type="button" class="btn" onclick="commentUpdate(this);">수정</button>
						<button type="button" class="btn"
							onclick="commentDelete(this,'${bcList.coCode }','${b.BCODE }');">삭제</button>
					</c:if> <br></li>


				<li class="commentUpdateFrm">
					<form action="/commentUpdate" method="post">
						<input type="hidden" name="bCode" value="${bcList.bCode }">
						<!-- bCode와 coCode를 꼭 써줘야함!!!!!!!! 문제는 이거였어 ! -->
						<input type="hidden" name="coCode" value="${bcList.coCode }">
						<input type="text" id="coContent" name="coContent"
							value="${bcList.coContent }">
						<button type="submit" class="btn">수정 완료</button>
						<button type="button" class="btn"
							onclick="commentUpdateCancle(this)"
							class="btn btn-secondery btn-sm">취소</button>
					</form>
				</li>

			</ul>
		</c:forEach>

		<br>
		<center>
			<a id="board" href="/boardList?currentPage=1">「게시판 목록으로」</a>
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
					<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<a href="/boardDelete?bCode=${b.BCODE }" type="button"
						class="btn btn-primary">확인</a>
					<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>




	<script>
		//댓글 수정 버튼 클릭 시
		function commentUpdate(obj) {
			var btn = $(obj);
			btn.parent().next().show();
			btn.parent().hide();
			btn.prev().hide();

		}

		//댓글 삭제 버튼 클릭 시
		function commentDelete(obj, coCode, bCode) {

			location.href = "/deleteComment?coCode=" + coCode + "&bCode="
					+ bCode;
		}

		//댓글 수정 취소 시
		function commentUpdateCancle(obj) {
			var btn = $(obj);
			btn.parent().parent().prev().show();
			btn.parent().parent().hide();
			btn.parent().parent().prev().children('span').show();
		}

		function fileDown(FCODE) {
			var formObj = $("form[name='readForm']");
			$("#fCode").attr("value", FCODE);
			formObj.attr("action", "/fileDown");
			formObj.submit();

		}
	</script>
</body>
</html>