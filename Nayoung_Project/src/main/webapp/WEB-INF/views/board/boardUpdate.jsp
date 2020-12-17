<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body class="subpage">

	<style>
#fileDel {
	box-shadow: 0 0 0 0px #6cc091;
	color: #6cc091 !important;
	border-radius: 30px;
	padding: 0 1em;
	text-align: center;
	height: 25px;
}

#updateBtn {
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

#board {
	color: #6cc091;
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

#radio{
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




		<form name="updateForm" action="/boardUpdate" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="bCode" value="${detail.BCODE }">
			제목 : <input id="input" type="text" name="bTitle"
				value="${detail.BTITLE }" required> <br> 작성자 : <input
				id="input" type="text" name="bWriter" value="${detail.BWRITER }"
				readonly> <br> 내용 :
			<textarea id="textarea" rows="10" cols="80" name="bContent" required>${detail.BCONTENT }</textarea>
			<br> 
			비밀글 여부 : <input id="demo-priority-low" type="radio" name="bSecret" value="Y"
				id="secret" checked><label for="demo-priority-low">Y</label>
			<!-- checked는 체크 되었는지 안되어 있는 -->
			<input id="demo-priority-normal" type="radio" name="bSecret" value="N" class="radio"
				id="secret"><label for="demo-priority-normal">N</label> <br>
			<div class="bPw">비밀번호 입력 : &nbsp;</div>
			<input type="password" name="bPw" id="bPw" required> <br>
			<input type="hidden" name="bPw" value="null" id="bPw2">


			<!-- 파일  -->
			<input type="hidden" id="fCodeDel" name="fCodeDel[]" value="">
			<!-- 필수 String [] 매개 변수 'fileNoDel []'이 없습니다.-->
			<input type="hidden" id="fNameDel" name="fNameDel[]" value="">


			<div id="fileIndex">
				<c:forEach var="file" items="${file }" varStatus="var">
					<div>
						<input type="hidden" id="fCode" name="${var.index}"
							value="${file.FCODE }"> <input type="hidden"
							id="fileName" name="fileName" value="${var.index}">
						<!-- var.index는 fCode -->
						<a href="#" id="fileName" onclick="return false;">${file.ORGFILENAME }(${file.FILESIZE }kb)</a>
						<button id="fileDel"
							onclick="fn_del('${file.FCODE}','${var.index}');" type="button"
							class="btn">삭제</button>
						<br>
						<!-- varStatus는 for문의 돌아가는 상태를 알 수 있게 체크  var.index는 0부터의 순서 -->
						<br>
					</div>
				</c:forEach>
			</div>

			<div>
				<button id="fileBtn" type="button" class="btn fileAdd_btn">파일추가</button>
				<br> <br>
				<center>
					<button id="updateBtn" type="submit" class="btn">저장</button>
					&nbsp;&nbsp;
					<button id="updateBtn" type="button" class="btn"
						onclick="backBtn(this,'${detail.BCODE}')">취소</button>
				</center>
				<br>
			</div>

		</form>
		<center>
			<a id="board" href="/boardList?currentPage=1">「게시판 목록으로」</a>
		</center>

	</div>
	</section>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>



	<script>
		$(document).ready(
				function() {
					var formObj = $("form[name='updateForm']");

					$(document).on("click", "#fileDel", function() {
						$(this).parent().remove();
					});

					fn_addFile();

					$("input:radio[name=bSecret]").click(
							function() {
								if ($('input:radio[name=bSecret]:checked')
										.val() == 'Y') {
									$('#bPw').attr("disabled", false); //attr은 속성
									$("#bPw").removeClass("readonly");
									//radio 버튼의 value가 Y라면 활성화
								} else if ($(
										'input:radio[name=bSecret]:checked')
										.val() == 'N') {
									$('#bPw2').show();
									$('#bPw').attr("disabled", true); //disabled true는 input 속성을 비활성화 처리

								}
							});

				})

		/* 파일 추가버튼, 삭제 버튼 function */
		function fn_addFile() {
			var fileIndex = 1;

			$(".fileAdd_btn")
					.on(
							"click",
							function() {
								$("#fileIndex")
										.append(
												"<div><input type='file' name='file_"
														+ (fileIndex++)
														+ "'>"
														+ "<button class='btn' type='button' id='fileDelBtn'>"
														+ "삭제"
														+ "</button></div>");
							});
			$(document).on("click", "#fileDelBtn", function() {
				$(this).parent().remove();
			});
		}

		/* arry로 담은 변수 input value에 담아주는 과정 */
		var fCodeArry = new Array();
		var fNameArry = new Array();

		function fn_del(fCode, index) {
			fCodeArry.push(fCode);
			fNameArry.push(index);
			$("#fCodeDel").attr("value", fCodeArry);
			$("#fNameDel").attr("value", fNameArry);
		}

		$('form').submit(function() {
			if (!$('input[type=radio]:checked').val()) {
				alert("비밀글 여부를 체크해주세요!");
				return false;
			}
		});

		function backBtn(obj, bCode) {
			location.href = "/boardSelect?bCode=" + bCode;
		}
	</script>

</body>
</html>