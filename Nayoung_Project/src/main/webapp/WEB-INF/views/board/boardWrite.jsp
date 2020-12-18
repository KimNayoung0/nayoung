<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 작성</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body class="subpage">
	<style>
#board {
	color: #6cc091;
}

.writeBtn {
	box-shadow: 0 0 0 3px #6cc091;
	color: #6cc091 !important;
	border-radius: 30px;
	padding: 0 1em;
	text-align: center;
	height: 25px;
}

#fileBtn {
	box-shadow: 0 0 0 0px;
	color: white !important;
	background-color: #6cc091;
	padding: 0 1em;
	text-align: center;
	height: 30px;
}

#fileDelBtn {
	box-shadow: 0 0 0 0px;
	color: white !important;
	background-color: gray !important;
	padding: 0 1em;
	text-align: center;
	height: 30px;
}

#input, #textarea {
	box-shadow: 0 0 0 1px #6cc091;
}

#bPw {
	box-shadow: 0 0 0 1px #6cc091;
	width: 200px !important;
}

.bPw {
	float: left;
}

#radio {
	border: solid 1px #8dcca9 !important;
	height: 1.65em !important;
	width: 1.65em !important;
}
</style>

	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>
	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">

		<header class="align-center">
		<h3>게시물</h3>
		<p>Welcome to my project!</p>
		</header>


		<form name="writeFrm" action="/insertBoard" method="post"
			enctype="multipart/form-data"  autocomplete="off">

			제목 : <input id="input" type="text" name="bTitle" required><br>
			작성자 : <input id="input" type="text" name="bWriter"
				value="${sessionScope.member.userId }" readonly><br> 파일
			첨부 : <input type="file" name="file">
			<button id="fileBtn" type="button" class="btn fileAdd_btn">파일추가</button>
			<br>
			<!-- 파일이름이랑 파일경로를 쓰는데 여기서 쓰면 오류남 vo에 없는 이름으로 써줘야된다. -->
			<div id="fileIndex"></div>

			내용 :
			<textarea id="textarea" rows="10" cols="80"
				name="bContent" required></textarea>
			<br> 비밀글 여부 : <input id="demo-priority-low" type="radio"
				name="bSecret" value="Y" id="secret" checked><label
				for="demo-priority-low">Y</label>
			<!-- checked는 체크 되었는지 안되어 있는 -->
			<input id="demo-priority-normal" type="radio" name="bSecret"
				value="N" class="radio" id="secret"><label
				for="demo-priority-normal">N</label><br>

			<div class="bPw">비밀번호 입력: &nbsp;</div>
			<input type="password" name="bPw" id="bPw" required> <input
				type="hidden" name="bPw" value="" id="bPw2"> <br>

			<center>
				<button type="submit" class="writeBtn">작성</button>
				<br> <br> <br> <a id="board"
					href="/boardList?currentPage=1">「게시판 목록으로」</a>
			</center>
		</form>




	</div>
	</section>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>








	<script>
		$(document).ready(function() {
			var formObj = $("form[name='writeFrm']");
			$(".writeBtn").on("click", function() {
				formObj.attr("action", "/insertBoard");
				formObj.attr("method", "post");
				
			});
			fn_addFile();
		})

		function fn_addFile() {
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn")
					.on(
							"click",
							function() {
								$("#fileIndex")
										.append(
												"<input type='file' name='file_"
														+ (fileIndex++)
														+ "'>"
														+ "</button>"
														+ "<button type='button' id='fileDelBtn' class='btn'>"
														+ "삭제" + "</button>");
							});
			$(document).on("click", "#fileDelBtn", function() {
				$(this).parent().remove();
			});
		}

		$("input:radio[name=bSecret]").click(function() {
			if ($('input:radio[name=bSecret]:checked').val() == 'Y') {
				$('#bPw').attr("disabled", false); //attr은 속성
				$("#bPw").removeClass("readonly");

				//radio 버튼의 value가 Y라면 활성화
			} else if ($('input:radio[name=bSecret]:checked').val() == 'N') {
				$('#bPw2').show();
				$('#bPw').attr("disabled", true); //disabled true는 input 속성을 비활성화 처리

			}
		});

		
		

	</script>

</body>
</html>