<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 수정</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>

<body class="subpage">

	<style>

.select_img img {
	width: 500px;
	margin: 20px 0;
}

.btn{
height: 45px;
}

#gdsImgSize{
width: 300px;
height: 300px;
}
.gdsInfo label{
float: left;
width: 80px;
}
.gdsInfo{
padding-bottom: 10px;
}
.gdsInfo input{
width: 500px !important;
box-shadow: 0 0 0 1px #6cc091 !important;
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

		<form role="form" method="post" autocomplete="off"
			enctype="multipart/form-data">
			<input type="hidden" name="gdsCode" value="${goods.gdsCode }">
			<div class="gdsInfo">
				<label for="gdsCate">상품 분류</label> <input type="text" id="gdsCate"
					name="gdsCate" value="${goods.gdsCate }" placeholder="마스크 / 손 소독제 / 위생 용품" required>
			</div>

			<div class="gdsInfo">
				<label for="gdsName">상품명</label> <input type="text" id="gdsName"
					name="gdsName" value="${goods.gdsName }" placeholder="상품명 입력" required>
			</div>

			<div class="gdsInfo">
				<label for="gdsPrice">상품 가격</label> <input type="text" id="gdsPrice"
					name="gdsPrice" value="${goods.gdsPrice }" placeholder="숫자만 입력" required>
			</div>

			<div class="gdsInfo">
				<label for="gdsStock">상품 수량</label> <input type="text" id="gdsStock"
					name="gdsStock" value="${goods.gdsStock }" placeholder="숫자만 입력" required>
			</div>


			<div>
				<label for="gdsDetail">상세 설명</label>
				<textarea required rows="5" cols="50" name="gdsDetail" id="gdsDetail">${goods.gdsDetail }</textarea>
			</div>

			<div>
				<label for="gdsImg">대표 이미지</label> <input type="file" id="gdsImg"
					name="file">
				<div class="select_img">
					<img id="gdsImgSize" src="${goods.gdsImg }" /> <input type="hidden" name="gdsImg"
						value="${goods.gdsImg }" /> <input type="hidden"
						name="gdsThumbImg" value="${goods.gdsThumbImg }" />
				</div>
			</div>

			<div><center>
				<button type="submit" id="update_Btn" class="btn">완료</button>
				<button type="button" id="back_Btn" class="btn">취소</button>
			</center></div>
		</form>
	</div>
	</section>
	<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>


	<script>
		$('#back_Btn').click(function() {
			history.back(); //location과 같은 기능
			//location.href="/admin/goods/view?gdsCode=" + ${goods.gdsCode};
		});

		$("#gdsImg")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});

		//ck에디터
		var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/admin/goods/ckUpload"
		};

		CKEDITOR.replace("gdsDetail", ckeditor_config);

		//상품 수량과 가격에 숫자만 입력하도록 정규표현식
		var regExp = /[^0-9]/gi;

		//가격과 수량을 입력할 때마다 numCheck함수 호출 ! 현재 선택자$(this)를 같이 보냄
		$('#gdsPrice').keyup(function() {
			numCheck($(this));
		});
		$('#gdsStock').keyup(function() {
			numCheck($(this));
		});

		function numCheck(selector) {//현재 선택된 선택자를 selector에 저장한 뒤, selector에 입력된 값을 정규표현식에 맞게 변경
			var tempVal = selector.val();
			selector.val(tempVal.replace(regExp, ""));
		}
		
		$('#update_Btn').click(function(){
			 if(CKEDITOR.instances.gdsDetail.getData() == '' || CKEDITOR.instances.gdsDetail.getData().length ==0){	
					alert('내용을 입력해주세요.');
					return false;
					} 		
			 return true;
		});
	</script>



</body>
</html>