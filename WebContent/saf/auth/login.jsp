<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>스마트 양식장</title>
	<link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=e352b4b3401049979e7ebdd84c3caf81">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=7feee93f573b1ef2766af1d8290eeb33">	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">

</head>

<body class="bg-gradient-primary">
    <div class="login-dark" style="background-color: #214a80; background-image: url(&quot;../../common/assets/img/sea-169980_1920.jpg?h=b72cd4f12e9e2467dba2146641922a90&quot;);background-size: cover;background-repeat: repeat;">
        
        <form method="post" style="background-color: rgb(255,255,255); color:black;" action="./loginPrc.jsp">
            <h2 class="sr-only">Login Form</h2>
            
            <div class="illustration">
             <i class="icon ion-ios-locked-outlinㄴe" style="color: rgb(33,74,128);"></i>
            </div>
            
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