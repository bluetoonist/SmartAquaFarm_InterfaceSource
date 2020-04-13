<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : userManagement.jsp
    ■ DESCRIPTION           : 사용자 관리 페이지
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="farm.*" %>
<%@ page import="user.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Arrays" %>
<%
	//한글 패치
	request.setCharacterEncoding("UTF-8");
	
	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
	
	usertableDAO dao = new usertableDAO();
	usertableDTO dto = new usertableDTO();
	farmDAO farmdao = new farmDAO();
	farmDTO farmdto = new farmDTO();
	
	// 전체 관리자일 경우 리스트 목록
	ArrayList userlist = dao.sysuserselect(user_auth);
	// 일반 관리자일 경우 리스트 목록
	ArrayList userlist2 = dao.adminuserselect(user_auth);
%>
<script>
//* 읽기 수정으로 이동(id 클릭 시) - userManagement.jsp
//************************************************************************ START LINE
function goReadUser(userid) {
	var farm = document.userManagement;
	farm.userid.value = userid;
	
	farm.method = "post";
	farm.action = "userUpdateForm.jsp";
	farm.submit();

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
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=7feee93f573b1ef2766af1d8290eeb33">
    	
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    
</head>

<body id="page-top">
    <div id="wrapper">
        <!-- Start: 메뉴바 -->
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198,43,43);">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-fish"></i></div>
                    <div class="sidebar-brand-text mx-3"><span class="text-monospace">SMART AQUA FARM</span></div>
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
                        <h3 class="text-dark mb-0 navbar-brand"><strong>사용자 관리</strong></h3>
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
                                <img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg">
                                </a>
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
            <div class="container-fluid text-right mb-2"><button class="btn btn-primary" onclick="location.href='userInsertForm.jsp'">추가</button></div>
            <form name="userManagement">
            <input type="hidden" name="userid">
	            <div class="container-fluid">
	                <div class="table-responsive table-bordered">
	                    <table class="table table-bordered">
	                        <thead>
	                            <tr>
	                                <th class="table-primary text-center">ID</th>
	                                <th class="table-primary text-center">이름</th>
	                                <th class="table-primary text-center">연락처</th>
	                                <th class="table-primary text-center">직책</th>
	                                <th class="table-primary text-center">소속양식장</th>
	                                <th class="table-primary text-center">가입일</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                           
	<%
						//userDAO에서 받아온 userlist 출력
						for (int i = 0; i < userlist.size(); i++) {
							dto = (usertableDTO) userlist.get(i);
							
							// farmid를 이름으로 바꿈
							String farmid = dto.getFarmId();
							ArrayList<farmDTO> farmnm =  dao.changename(farmid);
	                        
	
							
	%>						 <tr onclick="goReadUser('<%=dto.getUserId()%>')" style="cursor : pointer;" >
			                    <td class="text-center"><%=dto.getUserId()%></td>
								<td class="text-center"><%=dto.getUserName()%></td>
								<td class="text-center"><%=dto.getUserTel()%></td>
								<td class="text-center"><%=dto.getUserAuth()%></td>
								<td class="text-center">
<%										int j=0;
                                    for(j=0; j<farmnm.size(); j++){
                                    	if(j == farmnm.size()-1){
%>
                                    	<%= farmnm.get(j).getFarmName() %> 
<%     		
                                    	}else{
%>	
                                  		<%= farmnm.get(j).getFarmName() %>,
<%
                                		}
                                    }
%>                               
                            	</td>
								<td class="text-center"><%=dto.getRegDate()%></td>
	                        </tr>
<% 
						}
%>             
	                        </tbody>
	                    </table>
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