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
						����Ʈ ������� <br> <br> ���̵�� ��й�ȣ�� �Է��ϼ���.
					</p>
					<input type="text" placeholder="username" name="username" />
					<input type="password" placeholder="password" name="password" />
					<a href="/" class="forgot-password">��й�ȣ�� �ؾ�����̳���?</a>
					<button type="submit">�α���</button>
				</form>
			</div>
		</div>
	</div>
	
</body>

</html>