<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	//앞으로 ex)로그인 성공이나 실패했을 때 나오는 창은 jsp파일을 따로 만들지 않고
	//controller에서 model.addAttribute을 사용해 처리할 예정
		alert('${msg}');
		location.href="${loc}";
	</script>
</body>
</html>