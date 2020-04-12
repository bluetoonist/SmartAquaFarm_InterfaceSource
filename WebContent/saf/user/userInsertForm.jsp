<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : userInsertForm.jsp
    ■ DESCRIPTION           : 사용자 등록 페이지
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

%>

<script>
//* 아이디 빈칸확인 - userInsertForm.jsp
//************************************************************************ START LINE
function checkValue() {
	// 이름 빈칸 확인
	if (!document.userInsertForm.userName.value) {
		alert("이름을 입력하세요.");
		return;
	}
	// ID 빈칸 확인
	if (!document.userInsertForm.userID.value) {
		alert("ID를 입력하세요.");
		return;
	}
	// ID 중복체크 확인 - 인터페이스 붙힌 후 기능 구현 예정
	if (document.userInsertForm.idDuplication.value == 0) {
		alert("ID 중복체크를 해주세요.");
		return;
	}
	// 비밀번호 빈칸 확인
	if (!document.userInsertForm.userPW.value) {
		alert("비밀번호를 입력하세요.");
		return;
	}
	// 비밀번호 일치 확인
	if (document.userInsertForm.userPW.value != document.userInsertForm.userPWChk.value) {
		alert("비밀번호를 동일하게 입력하세요.");
		return;
	}

	// 폼 찾기
	var form = document.userInsertForm;

	// 사용자 추가확인창
	if (confirm("사용자를 추가하시겠습니까?")) {
		// 확인을 누를 경우
		form.method = "post";
		form.action = "userInsertPrc.jsp";
		form.target = "_self";
		form.submit();
	}
}
//************************************************************************ END LINE
// * 아이디 체크 - userInsertForm.jsp
// ************************************************************************ START LINE
function idCheck() {
	// ID 빈칸 확인
	if (!document.userInsertForm.userID.value) {
		alert("ID를 입력하세요");
		return;
	}
	// 팝업창 URL
	var url = "userIDCheck.jsp?userID=" + document.userInsertForm.userID.value;
	// 팝업창(userIDCheck.jsp)
	window
			.open(
					url,
					"confirm",
					"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400px, height=300px");
}

//************************************************************************ END LINE
</script>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - Brand</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=e352b4b3401049979e7ebdd84c3caf81">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=7feee93f573b1ef2766af1d8290eeb33">
</head>

<body id="page-top">
    <div id="wrapper">
        <!-- Start: 메뉴바 -->
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198,43,43);">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-fish"></i></div>
                    <div class="sidebar-brand-text mx-3"><span class="text-monospace">sMART AQUA FARM</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                
          		<!-- Navigator Menu -->
               <ul class="nav navbar-nav text-light" id="accordionSidebar">
	               <li class="nav-item" role="presentation"><a class="nav-link active" href="../main/index.jsp">
	                  <i class="fas fa-tachometer-alt"></i>
	                  <span>모니터링</span>
	                  </a>
	               </li>
	               
	               <li class="nav-item" role="presentation">
	                  <a class="nav-link" href="../growinfo/growInfoList.jsp">
	                  <i class="fas fa-table"></i>
	                  <span>상태 기준 정보</span>
	                  </a>
	               </li>
	               
	               <li class="nav-item" role="presentation">
	                  <a class="nav-link" href="../watertank/stateRec.jsp">
	                  <i class="fas fa-th-list"></i>
	                  <span>상태 기록</span>
	                  </a>
	               </li>
	               
	               <li class="nav-item" role="presentation">
	                  <a class="nav-link" href="../watertank/repairRec.jsp">
	                  <i class="fas fa-record-vinyl"></i>
	                  <span>조치 기록</span>
	                  </a>
	               </li>
	               
	               
	               <li class="nav-item" role="presentation">
	                  <a class="nav-link" href="alert('준비중');">
	                  <i class="fas fa-chart-bar"></i>
	                  <span>통계</span></a>
	               </li>
	                  
	               <li class="nav-item" role="presentation">
	                  <a class="nav-link" href="../user/farmListForm.jsp">
	                  <i class="fas fa-tint">
	                  </i><span>양식장 정보 관리</span>
	                  </a>
	               </li>
	               
	               <li class="nav-item" role="presentation">            
	                  <a class="nav-link" onclick="moveFarmWtSearchPage();">
	                  <i class="fas fa-water">
	                  </i><span>수조 정보</span>
	                  </a>
	               </li>
            </ul>
  		<!--  End Menu Navigator -->
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <!-- End: 메뉴바 -->
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <h3 class="text-dark mb-0 navbar-brand"><strong>사용자 등록</strong></h3>
                        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <div class="input-group-append"></div>
                            </div>
                        </form>
                        <ul class="nav navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown no-arrow mx-1" role="presentation"></li>
                            <li class="nav-item dropdown no-arrow mx-1" role="presentation">
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow" role="presentation">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
                                <span class="d-none d-lg-inline mr-2 text-gray-600 small"><%=user_name %></span>
                                <img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg"></a>
                                    <div
                                        class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
                                        <a class="dropdown-item" role="presentation" href="userInfo.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a></div>
                    </div>
                    </li>
                    </ul>
            </div>
            </nav>
            <div class="container text-right">
            <button class="btn btn-primary mr-2 mb-2" type="button" onclick="checkValue()">등록</button>
            <button class="btn btn-primary mb-2" type="button" onclick="location.href='userManagement.jsp'">취소</button></div>
            
            <form name="userInsertForm">
	            <div class="container">
	                <div class="card"></div>
	                <div class="row mb-2">
	                    <div class="col">
	                        <div class="table-responsive table-bordered text-truncate">
	                            <table class="table table-bordered">
	                                <thead>
	                                    <tr></tr>
	                                </thead>
	                                <tbody>
	                                	<tr>
	                                        <td class="table-primary text-center"><strong>회원 이름</strong></td>
	                                        <td>
	                                            <div class="row">
	                                                <div class="col"><input type="text" name="userName" class="form-control" placeholder="회원 이름"></div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td class="table-primary text-center"><strong>사용자 ID</strong></td>
	                                        <td>
	                                            <div class="row">
	                                                <div class="col-xl-10"><input type="text" class="form-control" placeholder="사용자 ID" name="userID"></div>
	                                                <div class="col text-right">
	                                                <button class="btn btn-primary btn-block" type="button" name="idDuplication" onclick="idCheck()">중복확인</button></div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td class="table-primary text-center"><strong>사용자 PW</strong></td>
	                                        <td>
	                                            <div class="row">
	                                                <div class="col"><input type="password" name="userPW" class="form-control" placeholder="비밀번호"></div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td class="table-primary text-center"><strong>사용자 PW 확인</strong></td>
	                                        <td>
	                                            <div class="row">
	                                                <div class="col"><input type="password" name="userPWChk" class="form-control" placeholder="비밀번호 확인"></div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td class="table-primary text-center"><strong>연락처</strong></td>
	                                        <td>
	                                            <div class="row">
	                                                <div class="col"><input type="text" class="form-control" placeholder="연락처 " name="usertel"></div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td class="table-primary text-center"><strong>직책</strong></td>
	                                        <td class="text-center"><select name="userAuth" class="custom-select">

<% 
											if(user_auth.equals("admin")){ 
%>
											<option value="user">회원</option>
<% 
											}else { 
%>	                                        
	                                        <option value="sysadmin">전체관리자</option>
	                                        <option value="admin">일반관리자</option>
	                                        <option value="user">사용자</option></select>
<% 
										} 
%>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </form>
            
        </div>
        <footer class="bg-white d-xl-flex align-items-xl-end sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Mokpo National University&nbsp; 2020</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>

</html>