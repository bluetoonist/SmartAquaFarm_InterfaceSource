
<%@ page import="farm.*"%>

<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.Stream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--  Bean Setup -->
<jsp:useBean id="farm_dao" class="farm.farmDAO" />
<jsp:useBean id="farm_dto" class="farm.farmDTO" />

<jsp:useBean id="user_dao" class="user.usertableDAO" />
<jsp:useBean id="user_dto" class="user.usertableDTO" />

<%
	/* Session  Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
	
	// update 시 수정할 사용자의 id 값
	String id = request.getParameter("userid");
	
	user_dto = user_dao.getuser(id);
	
	String name = user_dto.getUserName();
	String ID = user_dto.getUserId();
	String PW = user_dto.getUserPw();
	String auth = user_dto.getUserAuth();
	String tel = user_dto.getUserTel(); // 전화번호
	String FarmID = user_dto.getFarmId(); // 양식장 id

	String farmname = farm_dto.getFarmName();
	String address = farm_dto.getAddress();

%>
<script>
//* 정보수정 비번확인 - userInfo.jsp
//************************************************************************ START LINE
function checkData() {
	var form = document.turnData;

	// 사용자 추가확인창
	if (confirm("사용자 정보를 변경하시겠습니까?")) {
		// 확인을 누를 경우
		form.flag.value = "updateData"
		form.method = "post";
		form.action = "userUpdatePrc.jsp";
		form.target = "_self";
		form.submit();
	} else {
		// 취소를 누를 경우
		return false;
	}
}
//* 정보수정 비번확인 - userInfo.jsp
//************************************************************************ START LINE
function checkValueUpdate() {

	if(document.userPW.nowuserPW.value != <%=PW %>){
		alert("현재 비밀번호를 맞게 입력하세요.");
		return false;
	}
	
	// 비밀번호 빈칸 확인
	if (!document.userPW.userPW.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	// 비밀번호 일치 확인
	if (document.userPW.userPW.value != document.userPW.userPWChk.value) {
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}

	// 폼 찾기
	var form = document.userPW;

	// 사용자 추가확인창
	if (confirm("사용자 비밀번호를 변경하시겠습니까?")) {
		// 확인을 누를 경우
		form.flag.value = "UpdatePW"
		form.method = "post";
		form.action = "userUpdatePrc.jsp";
		form.target = "_self";
		form.submit();
	} else {
		// 취소를 누를 경우
		return false;
	}
}
//************************************************************************ END LINE
//* userUpdateForm.jsp에서 삭제 버튼 누를때 사용
//************************************************************************ START LINE
// 선택된 사용자의 권한, 이름, 양식장 id
// 넘어가는 데이터 권한, 양식장 id
function goDelete(Auth, Name, FarmID) { // 삭제 버튼 클릭시
	var frm = document.turnData;
	if(Auth == "admin") { //전체 관리자 일 경우
		if (confirm(Name + "를 삭제할 시 관련된 양식장 정보가 모두 삭제됩니다. 삭제 하시겠습니까?")) {
			frm.flag.value = "userDelete";
			frm.method = "post";
			frm.target = "_self";
			frm.action = "userUpdatePrc.jsp";
			frm.submit();
		}
		else {
			return;
		}
	}
	if(Auth == "user") { //일반 관리자일 경우
		if (confirm(Name + "의 정보를 삭제하시겠습니까?")) {
		frm.flag.value = "userDelete";
		frm.method = "post";
		frm.target = "_self";
		frm.action = "userUpdatePrc.jsp";
		frm.submit();
		}
		else {
			return;
		}
	}
	}

//************************************************************************ END LINE
</script>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - Brand</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=3005b66ff8f82552f0df07549640937c">
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
                <div class="container-fluid text-right mb-2">
                	<button class="btn btn-danger btn-sm" type="button" onclick="goDelete('<%= auth %>','<%= name %>','<%= FarmID %>');">회원정보 삭제</button>
                </div>
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <h3 class="text-dark mb-0 navbar-brand"><strong>회원 정보</strong></h3>
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
                                <div class="nav-item dropdown no-arrow">
                                <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
                                <span class="d-none d-lg-inline mr-2 text-gray-600 small"><%=user_name %></span>
                                <img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg"></a>
                                    <div
                                        class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
                                        <a class="dropdown-item" role="presentation" href="userInfo.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a></div>
                    </div>
                    </li>
                    </ul>
            </div>
            </nav>
            
                    <div class="col-xl-12">
                        <!-- Start: 회원정보수정란 -->
                        <form name="turnData"><!--  user id update form tag line -->
                        <input type="hidden" name="flag">
                        <input type="hidden" name="FarmID" value="<%=FarmID %>">
	                        <div class="card shadow mb-3">
	                            <div class="card-header py-3">
	                                <p class="text-primary m-0 font-weight-bold">회원 정보</p>
	                            </div>
	                            <div class="card-body">
<<<<<<< HEAD
                                    <div class="form-row">
                                        <div class="col">
                                            <div class="form-group"><label for="username"><strong>회원 이름</strong><br></label>
                                            <input class="form-control" type="text" placeholder="회원이름" name="username" value="<%= name %>">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group"><label for="username"><strong>회원 직책</strong><br></label>
                                            <input class="form-control" type="text"  name="auth" 
<%
                                            	if(auth.equals("user")){
%>
                                            		value="사용자"
<%
                                            	}else if(auth.equals("admin")){
%>
                                            		value="일반관리자"
<%
                                            	}
%> readonly >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col">
                                            <div class="form-group"><label for="first_name"><strong>회원 아이디</strong></label>
                                            <input class="form-control" type="text" placeholder="회원 아이디" value="<%=ID %>" name="userid"  readonly >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col">
                                            <div class="form-group"><label for="first_name"><strong>회원 전화번호</strong></label>
                                            <input class="form-control" type="text" name="usertel" maxlength="13"
<%
											if(tel == null){
%><%
											}else{
%>					
											value="<%=tel %>"
<%
											}
%>
                                            >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group"><button class="btn btn-primary btn-sm" onclick="checkData();"  type="submit">저장하기</button></div>
=======
	                                <form> <!--  user id update form tag line -->
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="username"><strong>회원 이름</strong><br></label>
	                                            <input class="form-control" type="text" placeholder="회원이름" name="username" value="<%= name %>">
	                                            </div>
	                                        </div>
	                                        <div class="col">
	                                            <div class="form-group"><label for="username"><strong>회원 직책</strong><br></label>
	                                            <input class="form-control" type="text" placeholder="<%=auth %>" name="auth" readonly >
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="first_name"><strong>회원 아이디</strong></label>
	                                            <input class="form-control" type="text" placeholder="회원 아이디" value="<%=ID %>" name="userid"  readonly >
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="first_name"><strong>회원 전화번호</strong></label>
	                                            <input class="form-control" type="text" name="usertel" maxlength="13" 
<%
	                                            	if(tel == null){
	                                            		
%><%
	                                            	}else{
%>
	                                           		 value="<%=tel %>"
<%
	                                            	} 
%>>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="form-group"><button class="btn btn-primary btn-sm" onclick="checkData();"  type="submit">저장하기</button></div>
	                                </form><!--  user id update form tag end line -->
>>>>>>> branch 'master' of https://github.com/bluetoonist/SmartAquaFarm_InterfaceSource.git
	                            </div>
	                        </div>
                        </form> <!--  user id update form tag end line -->
                        <!-- End: 회원정보수정란 -->
                        
                          <!-- Start: 비밀번호변경란 -->
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <p class="text-primary m-0 font-weight-bold">비밀번호 변경</p>
                            </div>
                            
                            <form name="userPW">
	                            <input type="hidden" name="flag">
	                            <input type="hidden" name="userid" value="<%=id%>">
	                            <div class="card-body">
	                                    <div class="form-group"><label for="address"><strong>현재 비밀번호</strong></label>
	                                    <input class="form-control" type="text" name="nowuserPW" placeholder="현재 비밀번호" name="address"></div>
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="city"><strong>변경 비밀번호</strong></label>
	                                            <input class="form-control" type="text" name="userPW" placeholder="변경 비밀번호" name="city"></div>
	                                        </div>
	                                    </div>
	
	                                    <div class="form-group"><label for="address"><strong>변경 비밀번호 확인</strong></label>
	                                    <input class="form-control" type="text" name="userPWChk" placeholder="변경 비밀번호 확인" name="address"></div>
	                                    <div class="form-group"><button class="btn btn-primary btn-sm" onclick="checkValueUpdate();" >저장하기</button></div>
                                </form>
                                
                            </div>
                        </div>
                        <!-- End: 비밀번호변경란 -->
                        
                    </div>
                </div>
            </div>
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