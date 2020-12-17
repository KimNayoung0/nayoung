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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body class="subpage">

	<style>
#goodsList {
	display: inline-block;
	margin: 10px;
}

ul {
	list-style: none;
}

div#container_box ul li {
	margin: 10px 0;
}

div#container_box ul li img {
	width: 250px;
	height: 250px;
}

div#container_box ul li::after {
	content: "";
	display: block;
	clear: both;
}

div#container_box div.thumb {
	float: left;
	width: 500px;
	padding-left: 200px;
}

div#container_box div.gdsInfo {
	float: right;
	width: 700px;
	padding-right: 450px;
}

div#container_box div.gdsInfo {
	font-size: 20px;
	line-height: 2;
}

div#container_box div.gdsInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

div#container_box div.gdsInfo .delete {
	text-align: right;
}

div#container_box div.gdsInfo .delete button {
	font-size: 22px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.delBtn {
	float: right;
	width: 300px;
	text-align: right;
}

.delBtn button {
	font-size: 15px;
	padding: 0 4px;
	border: 1px solid #eee;
	box-shadow: 0 0 0 2px !important;
	height: 30px;
	border-radius: 3px;
}

.checkBox {
	float: left;
	width: 30px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}

.listResult {
	padding: 20px;
	background: #eee;
}

.listResult .sum {
	float: left;
	width: 45%;
	font-size: 22px;
}

.listResult .orderOpne {
	float: right;
	width: 45%;
	text-align: right;
}

.listResult .orderOpne button {
	font-size: 18px;
	padding: 5px 10px;
	background: #fff;
}

.listResult::after {
	content: "";
	display: block;
	clear: both;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
	margin-left: 50px;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	background: #fff;
	margin-right: 20px;
	border-radius: 4px;
	height: 50px;
	font-size: 15px;
}

.inner ul li {
	padding-bottom: 20px;
}

#img {
	float: left !important;
}

#gdsThumbInfo {
	height: 350px;
}

.gdsInfo p {
	padding-top: 50px;
}

#gdsDelBtn {
	box-shadow: 0 0 0 0 !important;
	height: 35px;
	background-color: #6cc091;
	color: white !important;
	padding: 0 1em !important;
	border-radius: 4px;
	float: right;
	margin-top: 30px;
}

#orderInfo_Name {
	float: left;
}

.inputArea input {
	width: 700px !important;
	box-shadow: 0 0 0 1px #6cc091 !important;
}

#addrBtn {
	height: 30px;
	font-size: 9pt;
}

#oAddr1 {
	float: left;
}

#oAddr2, #oAddr3 {
	margin-left: 130px;
}

.chBox {
	zoom: 2.0;
}
</style>


	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>
	<!-- Three -->
	<section id="three" class="wrapper"> <header
		class="align-center">
	<h3>Cart</h3>
	<p>Welcome to my project!</p>
	</header>

	<div class="inner">
		<center>

			<ul>
				<li>
					<div class="allCheck">
						<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
						<script>
							$("#allCheck").click(function() {
								var chk = $("#allCheck").prop("checked");
								if (chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
						</script>

					</div>

					<div class="delBtn">
						<button type="button" class="selectDelete_btn">선택 삭제</button>
						<script>
							$(".selectDelete_btn").click(function() {
								var confirm_val = confirm("정말 삭제하시겠습니까?");
									if (confirm_val) {
										var checkArr = new Array(); //배열 생성
										$("input[class='chBox']:checked").each(function() {
											checkArr.push($(this).attr("data-cCode"));
										});

													$.ajax({
																url : "/shop/deleteCart",
																type : "post",
																data : {
																	chbox : checkArr
																},//선택한 상품의 cCode
																success : function(
																		result) {
																	if (result == 1) {
																		location.href = "/shop/cartList";
																	} else {
																		alert("삭제 실패");
																	}
																}
															});
												}
											});
						</script>
					</div>
				</li>
				<br>
			
				<c:set var="sum" value="0" />
				<c:forEach items="${cartList }" var="cartList">
					<li id="gdsThumbInfo">
						<div class="checkBox">

						<input type="checkBox" name="chBox" class="chBox" data-cCode="${cartList.cCode}" id="${cartList.cCode}"> 
						<label for="${cartList.cCode}"></label>

							<!-- data-cCode는 커스텀 속성*** 커스텀 속성은 data-[사용자 문자]로 구성되어 있으며, [사용자 문자]는 아무 문자나 사용할 수 있습니다. -->
							<script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false);
								});
							
							</script>
						</div>

						<div class="thumb">
							<img id="img" src="${cartList.gdsThumbImg }" />
						</div>
						<div class="gdsInfo">
							<p>
								<span>상품명 : </span>${cartList.gdsName}<br> <br> <span>개당
									가격 : </span>
								<fmt:formatNumber pattern="###,###,###"
									value="${cartList.gdsPrice}" />
								원<br> <br> <span>구입 수량 : </span>${cartList.cQt} 개<br />
								<br> <span>최종 가격 : </span>
								<fmt:formatNumber pattern="###,###,###"
									value="${cartList.gdsPrice * cartList.cQt}" />
								원
							</p>

							<div class="delete">
								<button type="button" id="gdsDelBtn"
									class="delete_${cartList.cCode}_btn"
									data-cCode="${cartList.cCode }">삭제</button>
								<script>
									$(".delete_${cartList.cCode}_btn")
											.click(
													function() {
														var confirm_val = confirm("정말 삭제하시겠습니까?");

														if (confirm_val) {
															var checkArr = new Array();

															checkArr
																	.push($(
																			this)
																			.attr(
																					"data-cCode"));

															$
																	.ajax({
																		url : "/shop/deleteCart",
																		type : "post",
																		data : {
																			chbox : checkArr
																		},
																		success : function(
																				result) {
																			if (result == 1) {
																				location.href = "/shop/cartList";
																			} else {
																				alert("삭제 실패");
																			}
																		}
																	});
														}
													});
								</script>
							</div>

						</div>
					</li>

					<c:set var="sum"
						value="${sum + (cartList.gdsPrice * cartList.cQt)}" />
				</c:forEach>
			</ul>


			<div class="listResult">
				<div class="sum">
					총 합계 :
					<fmt:formatNumber pattern="###,###,###" value="${sum}" />
					원
				</div>
				<div class="orderOpne">
					<button type="button" class="orderOpne_btn">주문 정보 입력</button>
					<script>
						$(".orderOpne_btn").click(function() {
							$(".orderInfo").slideDown();
							$(".orderOpne_btn").slideUp();
						});
					</script>

				</div>
			</div>
		</center>
		<div class="orderInfo">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" name="amount" value="${sum}">

				<div class="inputArea">
					<label id="orderInfo_Name" for="">수령인</label> <input type="text"
						name="oName" id="oName" required />
				</div>

				<div class="inputArea">
					<label id="orderInfo_Name" for="">수령인 연락처</label> <input
						type="text" name="oPhon" id="oPhon" required />
				</div>

				<div class="inputArea">
					<label id="orderInfo_Name" for="">우편번호</label> <input type="text"
						name="oAddr1" id="oAddr1" readonly="readonly" placeholder="우편번호"
						required />&nbsp;
					<button type="button" class="btn btn-default"
						onclick="execPostCode();" id="addrBtn">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
					<br> <br> <input type="text" name="oAddr2" id="oAddr2"
						readonly="readonly" placeholder="주소 입력" required /><br> <input
						type="text" name="oAddr3" id="oAddr3" placeholder="상세주소 입력"
						required />
				</div>

				<div class="inputArea">
					<center>
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button>
					</center>
					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderOpne_btn").slideDown();
						});
					</script>

				</div>

			</form>

		</div>





	</div>
	</section>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>


	<script>
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=oAddr1]").val(data.zonecode);
					$("[name=oAddr2]").val(fullRoadAddr);

					/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
					document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				}
			}).open();
		}
	</script>





</body>
</html>