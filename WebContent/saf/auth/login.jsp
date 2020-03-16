<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>

	<!--  font ì§ì  êµ¬í´ì ì¶ê°í  ê²  -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">

	<link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css">
	    

</head>

<body class="bg-gradient-primary">
    <div class="login-dark" style="background-color: #214a80;">
        <form method="post" style="background-color: rgb(255,255,255); color:black;" action="./loginPrc.jsp">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-locked-outline" style="color: rgb(33,74,128);"></i></div>
            <!--  ID InputCheck-->
            <div class="form-group">
            	<input class="form-control"  name="username" type="text" placeholder="아이디"></div>
            
            <!--  password InputCheck -->
            <div class="form-group">
            	<input class="form-control" name="password" type="password" name="password" placeholder="패스워드"></div>
            <div class="form-group">
            	<button class="btn btn-primary btn-block" type="submit">
            	<strong>로그인 </strong>
            </button></div><a class="forgot" href="#">
            <strong>비밀번호를 잊어버리셨나요 관리자에게 문의하세요 </strong>
            
            
		</form>
    </div>
    <script src="../../common/assets/js/jquery.min.js"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../common/assets/js/theme.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    
</body>

</html>