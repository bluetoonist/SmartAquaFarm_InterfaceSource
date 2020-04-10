<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : farmwtInsertForm.jsp
    ■ DESCRIPTION           : 양식장 수조 정보 등록 양식 페이지
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>

<%@ page import="farm.*"%>
<%@ page import="user.*"%>
<%@ page import="watertank.*"%>
<%@ page import="growInfo.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//한글 패치
	request.setCharacterEncoding("UTF-8");

	/* Session Configuration*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
	
	//usertableDAO는 mgr1로 사용
	usertableDAO mgr1 = new usertableDAO();
	//growInfoDAO는 mgr2로 사용
	growInfoDAO mgr2 = new growInfoDAO();
	//farmDAO는 mgr3로 사용
	farmDAO mgr3 = new farmDAO();
	
	int selectFarm = Integer.parseInt(request.getParameter("farmid"));
	
	//담당자 조회 부분
	ArrayList<usertableDTO> userAddlist = mgr1.usertableSelect(user_id);
	// 어종 선택 부분 
	ArrayList<growInfoDTO> fishname_list = mgr2.fishSelect(selectFarm);
	
	String farmname = mgr3.farmSelect(selectFarm);
	
	String sel_userid = request.getParameter("sel_userid");
	if(sel_userid == null){
		sel_userid = "";
	}
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css">
	<link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css">
	<link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css">
	<link rel="stylesheet" href="../../common/assets/css/untitled.css">
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198,43,43);">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-fish"></i></div>
                    <div class="sidebar-brand-text mx-3"><span class="text-monospace">sMART AQUA FARM</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="../main/index.jsp"><i class="fas fa-tachometer-alt"></i><span>모니터링</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#"><i class="fas fa-table"></i><span>상태 기준 정보</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#"><i class="fas fa-th-list"></i><span>상태 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#"><i class="fas fa-record-vinyl"></i><span>조치 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#"><i class="fas fa-chart-bar"></i><span>통계</span></a>
                    <a class="nav-link" href="register.html"><i class="fas fa-tint"></i><span>양식장 정보 관리</span></a>
                    <a class="nav-link" onclick="moveFarmWtSearch();"><i class="fas fa-water"></i><span>수조 정보</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <h3 class="text-dark mb-0 navbar-brand"><strong>수조 정보 등록</strong></h3>
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
							
							
							<!--  USER Management  -->
							<li class="nav-item dropdown no-arrow" role="presentation">
								<div class="nav-item dropdown no-arrow"> <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
									<span class="d-none d-lg-inline mr-2 text-gray-600 small"><%=user_name %></span>
									<img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg"></a>
									
									<div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
										<a class="dropdown-item" role="presentation" href="../user/userInfo.jsp">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
										
										<div class="dropdown-divider"></div> <a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a>
									</div>
								</div>						
							</li>							
						</ul>
            </div>
            </nav>
            
            <br>
            <h3 align="center"><%=farmname %></h3>
            <br>
             <!-- Start: 등록버튼 -->
            <div class="container-fluid text-right mb-4">

            <button class="btn btn-primary" onclick="farmwtInsert()">등록</button>

            </div>
            <!-- End: 등록버튼 -->
            <form name="farmSelect">
            <input type="hidden" name="farmid" value="<%=selectFarm%>">
	            <div class="container-fluid text-center">
	                <div class="table-responsive table-bordered">
	                    <table class="table table-bordered" style="text-align:center;">
	                        <thead>
	                            <tr></tr>
	                        </thead>
	                        <tbody>
	                            <tr></tr>
	                            <tr>
	                                <td class="table-primary border rounded-0" rowspan="1" colspan="2"><strong>수조번호</strong></td>
	                                <td rowspan="1" colspan="2">   
	                                <input type="text" name="tankid" size="20" placeholder="수조번호" style="border:none; background: transparent; width:100%;" maxlength="10"></td>
	                            </td>
	                            </tr>
	                             <tr>
	                                <td class="table-primary"><strong>어종</strong></td>
	                                
	                                <td class="flex-shrink-0">
	                                <select name="selectFish" class="form-control-sm pl-2" style="padding-top: 1;">
		                                <optgroup label="어종을 선택하세요">
	<%
													for (int j = 0; j < fishname_list.size(); j++) {
													System.out.println(fishname_list.get(j));
	%>
													<option value="<%=fishname_list.get(j).getRemark()%>">
													<%=fishname_list.get(j).getRemark()%></option>
	<%
													}
	%>										</optgroup>
										</select>
	                                <br></td>
	                                
	                                
	                             <td class="table-primary">
	
								<strong>담당자</strong></td>
								<td id="wait_Data">
									<button class="btn btn-primary btn-sm" type="button" onclick="gofarmwtUserForm_in('<%=selectFarm %>')">

									 	<strong>조회</strong>
									</button>
								</td>
	
	                   </tr>
	                            <tr>
	                                <td class="table-primary" rowspan="6"><strong>장비명</strong></td>
	                                <td class="table-primary"><strong>DO</strong></td>
	                                <td colspan="2">
	                                <input type="text" name="dosensor" size="20" placeholder="DO" style="border:none; background: transparent; width: 100%;" maxlength="10">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="table-primary"><strong>pH</strong></td>
	                                <td colspan="2">
	                                <input type="text" name="phsensor" size="20" placeholder="pH" style="border:none; background: transparent; width: 100%;" maxlength="10">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="table-primary"><strong>PSU</strong></td>
	                                <td colspan="2">
	                                <input type="text" name="psusensor" size="20" placeholder="PSU" style="border:none; background: transparent; width: 100%;" maxlength="10">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="table-primary"><strong>수온</strong></td>
	                                <td colspan="2">
	                                <input type="text" name="wtsensor" size="20" placeholder="수온" style="border:none; background: transparent; width: 100%;" maxlength="10">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="table-primary"><strong>NH4</strong></td>
	                                <td colspan="2">
	                                <input type="text" name="nh4sensor" size="20" placeholder="NH4" style="border:none; background: transparent; width: 100%;" maxlength="10">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="table-primary"><strong>NO2</strong></td>
	                                <td colspan="2">
	                                <input type="text" name="no2sensor" size="20" placeholder="NO2" style="border:none; background: transparent; width: 100%;" maxlength="10">
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
            </form>
            <div class="card"></div>
            <!-- Start: Dropdown Card -->
            <div class="card shadow d-xl-flex mb-4"></div>
            <!-- End: Dropdown Card -->
        </div>
        <footer class="bg-white d-xl-flex align-items-xl-end sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Mokpo National University&nbsp; 2020</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    
	<script src="../../common/func/util.js"></script>
	<script src="../../common/func/monitoring.js"> </script>
	<script src="../../common/assets/js/jquery.min.js"></script>
	<script src="../../common/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../common/assets/js/theme.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	<script src="../../common/func/util.js"></script>
</body>

</html>