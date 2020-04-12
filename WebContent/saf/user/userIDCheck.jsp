<%--
	 ■ SYSTEM				: 
	 ■ SOURCE FILE NAME		: userIDCheck.jsp
	 ■ DESCRIPTION			: 사용자 id 중복확인  Form
	 ■ COMPANY				: 목포대학교 융합소프트웨어공학과 
	 ■ PROGRAMMER			: 김성현
	 ■ DESIGNER				: 
	 ■ PROGRAM DATE			: 2019.08.19
	 ■ EDIT HISTORY			: 
	 ■ EDIT CONTENT			: 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="user.usertableDAO"%>

<%
   // 한글 패치
   request.setCharacterEncoding("UTF-8");

   // ID값 가져오기
   String userID = request.getParameter("userID");
   usertableDAO dao = new usertableDAO();
   System.out.println("userID : "+userID);
%>

<script>
//* userIDCheck.jsp 에서 id중복확인
//************************************************************************ START LINE
function popupIdCheck(){
	var frm = document.IDCheck;
	frm.target = "_self";
	
	frm.action="userIDCheck.jsp";
	frm.submit();
}
//************************************************************************ END LINE
//* userIDCheck.jsp 에서 id중복확인
//************************************************************************ START LINE
function setId(userID){
	// 이 창을 연 기존 창의 객체 참조
	opener.document.userInsertForm.userID.value = userID;
	// 기존 창의 id 값 수정
	opener.document.userInsertForm.idDuplication.value = "1";
	// 중복체크한 아이디는 수정불가하도록
	opener.document.userInsertForm.id.readOnly = 'true';
	self.close();
}
//************************************************************************ END LINE
//* userIDCheck.jsp 에서 창 닫기
//************************************************************************ START LINE
function selfClose() {
	self.close();
}
//************************************************************************ END LINE
</script>
<html>
<head>
<title>스마트 모니터링 시스템</title>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SAF</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=3084c6cd1f3ae724aad24503a81c5be2">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=7feee93f573b1ef2766af1d8290eeb33">
</head>

<link rel="stylesheet" href="../common/style.css">
<script type="text/javascript" src="../common/main.js"></script>
</head>
<body>

   <body>
   <form name="IDCheck">
	   <input type="hidden" name="userID">
	    <div class="container-fluid">
	        <h1 class="text-center mt-2"><strong>ID 검색</strong></h1>
	    </div>
	    
	    <!-- Start: 검색부분 -->
	    <div class="container-fluid text-center mt-4">
	    <input type="text" name="userID" class="mr-2" value="<%= userID %>">	
	    <button class="btn btn-primary btn-sm" type="button" onclick="popupIdCheck()"><strong>검색</strong></button></div>
	    <!-- End: 검색부분 -->
	    
	</form>
<%
      // 중복이 아닐 시
      if (dao.userIDCheck(userID)) {
%>
	    
	    <!-- Start: 안내문구 -->
	    <div class="container-fluid d-xl-flex justify-content-xl-center mt-4 mb-4">
	    <span class="text-left">
	    <strong>입력하신 <font color="red"><%= userID%></font>은(는) 사용이 가능합니다.</strong><br>
	    <strong>다른 ID를 사용하려면 ID를 검색하세요</strong></span></div>
	    <!-- End: 안내문구 -->
<%
      } else { // 중복일시
%>   
	    <!-- Start: 안내문구 -->
	    <div class="container-fluid text-left d-xl-flex justify-content-xl-center mt-4 mb-4">
	    <span class="text-center"><strong>입력하신 <font color="red"><%=userID%></font>은(는) 사용이 불가능합니다.&nbsp;&nbsp;</strong><br>
	     새로운 아이디를 검색하세요.</span></div>
	    <!-- End: 안내문구 -->
<%
      }
%>	    
	    <!-- Start: 사용하기/취소버튼 -->
	    <div class="container-fluid text-center">
	    <button class="btn btn-primary mr-2" type="button" onclick="setId('<%=userID%>')">사용하기</button>
	    <button class="btn btn-primary" type="button" onclick="selfClose()">취소</button></div>
	    <!-- End: 사용하기/취소버튼 -->
	    
    	<script src="../../common/func/util.js"></script>
	    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
	    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>

</body>

</html>