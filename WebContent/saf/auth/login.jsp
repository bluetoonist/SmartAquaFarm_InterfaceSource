<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<!-- test -->
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="../../common/css/login.css">
<script src="../../common/Js/script.js"></script>
</head>
<!-- test msg -->
<body>
	<div class="login-page">
		<div class="login-page">
			<div class="form">
				<form class="login-form" action="./loginPrc.jsp" method="post">
					<p class="sign-in">
						스마트 아쿠아팜 <br> <br> 아이디와 비밀번호를 입력하세요.
					</p>
					<input type="text" placeholder="username" name="username" />
					<input type="password" placeholder="password" name="password" />
					<a href="/" class="forgot-password">비밀번호를 잊어버리셨나요?</a>
					<button type="submit">로그인</button>
				</form>
			</div>
		</div>
	</div>
	
</body>

</html>