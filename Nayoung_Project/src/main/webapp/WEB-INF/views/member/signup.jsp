<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="org.ny.member.model.vo.Member, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/main/main.css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body class="subpage">

	<style>
#joinBtn {
	color: black !important;
	height: 38px !important;
	box-shadow: inset 0 0 0 0px;
	height: 38px !important;
}

#table {
	width: 800px;
	font-size: 9pt !important;
}

#td1 {
	width: 20%;
}

#td2 {
	width: 45%;
}

#td3 {
	width: 35%;
}

#addrBtn{
height: 30px;
font-size: 9pt;
}
</style>
	<%@include file="/WEB-INF/views/include/menuVar.jsp"%>


	<!-- Three -->
	<section id="three" class="wrapper">
	<div class="inner">
		<header class="align-center">
		<h3>회원가입</h3>
		<p>Welcome to my project!</p>
		</header>

		<center>

			<form action="/insertMember" method="post" autocomplete=off>
				<!-- autocomplete= off 자동완성 기능 해제-->

				<table id="table">
					<tr>
						<td id="td1">아이디 :</td>
						<td id="td2"><input type="text" name="userId" id="userId"
							class="input" placeholder="아이디 입력(5~11자)" required></td>
						<td id="td3"><span id="chkResult1" class="chkResult"></span></td>
					</tr>
					<tr>
						<td>비밀번호 :</td>
						<td><input type="password" name="userPw" id="userPw"
							class="input" placeholder="비밀번호를 입력해주세요." required></td>
						<td><span id="chkResult2" class="chkResult"></span></td>
					</tr>
					<tr>
						<td>비밀번호 확인 :</td>
						<td><input type="password" id="userPwRe" class="input"
							placeholder="비밀번호 확인"></td>
						<td><span id="chkResult2-1" class="chkResult"></span></td>
					</tr>
					<tr>
						<td>이름 :</td>
						<td><input type="text" name="userName" id="userName"
							class="input" placeholder="이름을 입력해주세요." required></td>
						<td><span id="chkResult3" class="chkResult"></span></td>
					</tr>
					<tr>
						<td>연락처 :</td>
						<td><input type="text" name="userPhon" id="userPhon"
							class="input" placeholder="연락처를 입력해주세요." required></td>
						<td><span id="chkResult4" class="chkResult"></span></td>
					</tr>
					<tr>
						<td>E-mail :</td>
						<td><input type="text" name="userEmail" id="userEmail"
							class="input" placeholder="이메일을 입력해주세요." required></td>
						<td><span id="chkResult5" class="chkResult"></span></td>
					</tr>
					<tr>
						<td>주소 :</td>
						<td><input type="text" name="userAddr1" id="userAddr1"
							class="input" placeholder="우편번호" readonly="readonly"
							required> <br><br> <input type="text" name="userAddr2" id="userAddr2"
							class="input" placeholder="주소 입력" readonly="readonly"
							required><br> <input type="text" name="userAddr3"
							id="userAddr3" class="input" placeholder="상세주소 입력" required></td>
						<td><button type="button" class="btn btn-default"
								onclick="execPostCode();" id="addrBtn">
								<i class="fa fa-search"></i> 우편번호 찾기
							</button></td>
					</tr>

				</table>
				<center>
					<br>
					<button type="submit" id="joinBtn" class="btn btn-light">회원가입</button>
				</center>

			</form>
		</center>
	</div>
	</section>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	 	$("#userId").focusout(function() {

			var id = $("[name=userId]").val();

			$.ajax({
				url : "/idChk",
				data : {
					userId : id
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.result == 0) {
						$('#chkResult1').html('이미 사용중인 아이디 입니다.');
						$('#chkResult1').css('color', 'red');
						$("#userId").focus();
						return false;
					}else if(!id || id.length <5 || id.length > 11){ 
						$('#chkResult1').html('아이디는 5글자 이상 11글자 이하만 가능합니다.');
						$('#chkResult1').css('color', 'red');
						$("#userId").focus();
						return false;
					}else {
						$('#chkResult1').html('사용 가능한 아이디 입니다.');
						$('#chkResult1').css('color', 'green');

					}
				},
				error : function() {
					console.log("ajax실패");
				}
			});
		}); 
	 	
	 	var msg = $('.chkResult');
	 	
	 	 $("#joinBtn").click(function(){
	 		 
	 		 init();
	 		 
	 		if(!(/^[a-zA-Z0-9]{8,12}$/.test($("#userPw").val()))){
	 			$('#chkResult2').html('비밀번호는 영문 대소문자, 숫자 중 8~12글자로 입력하십시오.');
				$('#chkResult2').css('color', 'red');
				$("#userPw").focusout();
				return false;
	 		}else if(!(/[가-힣]+$/.test($("#userName").val()))){
	 			$('#chkResult3').html('이름은 한글(최소 1글자)만 가능합니다.');
				$('#chkResult3').css('color', 'red');
				$("#userName").focus();
				return false;
	 		}else if(!(/^((01[0|1|6|7|8|9])[1-9]+[0-9]{6,7})$/.test($("#userPhon").val()))){
	 			$('#chkResult4').html('연락처를 재확인 해주세요.');
				$('#chkResult4').css('color', 'red');
				$("#userPhon").focus();
				return false;
	 		}else if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/.test($("#userEmail").val())){
	 			$('#chkResult5').html('이메일을 재확인 해주세요.');
				$('#chkResult5').css('color', 'red');
				$("#userEmail").focus();
				return false;
	 		}else if($('#userPw').val() != $('#userPwRe').val()){
		 		 $('#chkResult2-1').html('비밀번호가 일치하지 않습니다.');
		 	 	 $('#chkResult2-1').css('color','red');
		 	 	 $('#chkResult2-1').focus();
		 	 	 return false;
		 	 }
	 		return true;
	 	}); 
	 	 
	 	 
	 	/* else if(!/^[0-9가-힣\s]+$/.test($("#userAddr").val())){ //  \s는 띄어쓰기 가능
	 			$('#chkResult6').html('주소 입력은 영어 사용이 불가합니다.');
				$('#chkResult6').css('color', 'red');
				$("#userAddr").focus();
				return false;
	 		} */
	 	
	 		function execPostCode() {
	 	         new daum.Postcode({
	 	             oncomplete: function(data) {
	 	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 	 
	 	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	 	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	 	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	 	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 	 
	 	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	 	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	 	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	 	                    extraRoadAddr += data.bname;
	 	                }
	 	                // 건물명이 있고, 공동주택일 경우 추가한다.
	 	                if(data.buildingName !== '' && data.apartment === 'Y'){
	 	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	 	                }
	 	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	 	                if(extraRoadAddr !== ''){
	 	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	 	                }
	 	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	 	                if(fullRoadAddr !== ''){
	 	                    fullRoadAddr += extraRoadAddr;
	 	                }
	 	 
	 	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	 	                console.log(data.zonecode);
	 	                console.log(fullRoadAddr);
	 	                
	 	                
	 	                $("[name=userAddr1]").val(data.zonecode);
	 	                $("[name=userAddr2]").val(fullRoadAddr);
	 	                
	 	                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	 	                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	 	                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	 	            }
	 	         }).open();
	 	     }

	 		
	 	
	 	function init(){
	 		msg.html("");
	 	}

	 	
	</script>



</body>
</html>