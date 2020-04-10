<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="farm.*" %>
<%@ page import="user.*" %>
<%@ page import="java.util.*" %>
<%

	request.setCharacterEncoding("UTF-8");
	
	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	usertableDAO dao = new usertableDAO();
	usertableDTO dto = new usertableDTO();
	farmDAO farmdao = new farmDAO();
	farmDTO farmdto = new farmDTO();
	
	ArrayList<farmDTO> list = new ArrayList<farmDTO>();
	ArrayList<usertableDTO> userlist = new ArrayList<usertableDTO>();
	
	// 회원 정보 가져오기
	dto = dao.getuser(user_id);

	String pw = dto.getUserPw();
    String tel = dto.getUserTel();      // 전화번호
    String FarmID = dto.getFarmId();   // 양식장 id
    
    //리스트 불러오기
    list = farmdao.getFarm(user_auth, FarmID);
    userlist = dao.select_user(user_auth);
    
%>
<script>
//* 정보수정 비번확인 - userInfo.jsp
//************************************************************************ START LINE
function checkValueUpdate() {

	if(document.userPW.nowuserPW.value != <%=pw %>){
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
		form.flag.value = "Password"
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
// * 정보수정 비번확인 - userInfo.jsp
//************************************************************************ START LINE
function checkUpdate() {
	// 폼 찾기
	var form = document.userUpdateForm;

	// 비밀번호 빈칸 확인
	if (!document.userUpdateForm.username.value) {
		alert("회원이름을 입력하세요.");
		return false;
	}
		
	// 사용자 추가확인창
	if (confirm("사용자 정보를 변경하시겠습니까?")) {
		// 확인을 누를 경우
		form.flag.value = "nametel";
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
// * 삭제버튼 - userInfo.jsp
//************************************************************************ START LINE
function delfarm(param1,param2){

	var frm = document.farmManagement;
	frm.farmId.value = param1;
	frm.farmName.value = param2;
	frm.method = "post";
	frm.target = "_self";
	frm.action = "userFarmDeletePrc.jsp";
	frm.submit();
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
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">sysadmin</span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.jpeg?h=0ecc82101fb9a10ca459432faa8c0656"></a>
                                    <div
                                        class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="./userInfo.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a></div>
                    </div>
                    </li>
                    </ul>
            </div>
            </nav>
            <div class="container-fluid text-right">
<%
			if(!user_auth.equals("user")){
%>
 			<a class="btn btn-primary text-center text-white mb-3" role="button" href="./userManagement.jsp">사용자관리</a></div>
<%
			}
%>
             
            <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-lg-8 col-xl-10">
                        <div class="row mb-3 d-none">
                            <div class="col">
                                <div class="card text-white bg-primary shadow">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="m-0">Peformance</p>
                                                <p class="m-0"><strong>65.2%</strong></p>
                                            </div>
                                            <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                        </div>
                                        <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card text-white bg-success shadow">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="m-0">Peformance</p>
                                                <p class="m-0"><strong>65.2%</strong></p>
                                            </div>
                                            <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                        </div>
                                        <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <!-- Start: 회원정보수정란 -->
                    <form name="userUpdateForm">
                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <p class="text-primary m-0 font-weight-bold">회원 정보</p>
                            </div>
                            <div class="card-body">
                            
	                            	<input type="hidden" name="flag">
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="username"><strong>회원 이름</strong><br></label>
	                                            <input class="form-control" type="text" placeholder="<%=dto.getUserName() %>" name="username"></div>
	                                        </div>
	                                        <div class="col">
	                                            <div class="form-group"><label for="username"><strong>회원 직책</strong><br></label>
	                                            <input class="form-control" type="text" placeholder="<%= user_auth %>" disabled=""></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="first_name"><strong>회원 아이디</strong></label>
	                                            <input class="form-control" type="text" placeholder="<%= dto.getUserId() %>"  disabled=""></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-row">
	                                        <div class="col">
	                                            <div class="form-group"><label for="first_name"><strong>회원 전화번호</strong></label>
	                                            <input class="form-control" type="text" placeholder="<%= dto.getUserTel() %>" name="usertel"></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-group"><button class="btn btn-primary btn-sm" onclick="checkUpdate();" type="submit">저장하기</button></div>
	                            </div>
	                        </div>
                        </form>
                        <!-- End: 회원정보수정란 -->
                        
                        <!-- Start: 소속양식장 관리 -->
                        <form name="farmManagement">
                        <input type="hidden" name="farmId">
                        <input type="hidden" name="farmName">
                        <div class="card shadow mt-3 mb-3">
                            <div class="card-header py-3">
                                <p class="text-primary m-0 font-weight-bold">소속 양식장 관리</p>
                            </div>
                            <div class="card-body">

                            <select name="userID">
<%
							for(int i=0; i<userlist.size(); i++){
								dto = userlist.get(i);  
%>
	                            <option value="<%=dto.getUserId() %>" selected=""><%=dto.getUserId() %></option>
<%
							}
%>
                            </select>

                            <button class="btn btn-primary btn-sm ml-2" type="submit">검색</button>
                            
                                <div class="row mt-2">
                                    <div class="col">
                                        <ul class="list-group">
<%
										for (int i = 0; i < list.size(); i++) { 
											farmdto = list.get(i);   
%>                                                          
                                            <li class="list-group-item">
                                                <div class="row">
                                                    <div class="col-xl-10"><span><%= farmdto.getFarmName() %> (<%= farmdto.getAddress() %>)</span></div>
                                                    <div class="col text-right"><button class="btn btn-danger btn-sm ml-2" onclick="delfarm('<%=farmdto.getFarmId()%>','<%=farmdto.getFarmName()%>')" >삭제</button></div>
                                                </div>
                                            </li>
<%
										}
%>
                                        </ul>
                                    </div>
                                </div><button class="btn btn-primary btn-sm mt-3" type="submit">저장하기</button></div>
                        	</div>
                        </form>
                        <!-- End: 소속양식장 관리 -->

                        <!-- Start: 비밀번호변경란 -->
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <p class="text-primary m-0 font-weight-bold">비밀번호 변경</p>
                            </div>
                            
                            <form name="userPW">
	                            <input type="hidden" name="flag">
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
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top">
    <i class="fas fa-angle-up"></i></a></div>
    <script src="../../common/func/util.js"></script>
	<script src="../../common/func/monitoring.js"> </script>
	<script src="../../common/assets/js/jquery.min.js"></script>
	<script src="../../common/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../common/assets/js/theme.js"></script>
    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>

</html>