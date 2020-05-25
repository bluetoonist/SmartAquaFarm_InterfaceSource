<%@ page import="java.util.*"%>
<%@ page import="farm.farmDTO"%>
<%@ page import="user.usertableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- bean setup  -->
<jsp:useBean id="user_dto" scope="page" class="user.usertableDTO" />
<jsp:useBean id="user_dao" scope="page" class="user.usertableDAO" />

<jsp:useBean id="farm_dto" scope="page" class="farm.farmDTO" />
<jsp:useBean id="farm_dao" scope="page" class="farm.farmDAO" />


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Dashboard - Brand</title>

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

    <%
    	/* Session  Configuration */
    	String user_id = (String) session.getAttribute("userId");
    	String user_name = (String) session.getAttribute("userName");
    	String user_auth = (String) session.getAttribute("userAuth");
    %>
    
    <!--  header  -->
    <nav class="navbar navbar-light navbar-expand shadow topbar static-top" style="margin-bottom: 0px;">
        <div class="container-fluid">
        <button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
            <h3 class="text-dark mb-0 navbar-brand"><strong>SmartAquaFarm</strong></h3>
            <h3 class="text-dark mb-0 navbar-brand"><strong>수조 정보</strong></h3>
            <ul class="nav navbar-nav flex-nowrap ml-auto">
                <li class="nav-item dropdown no-arrow mx-1" role="presentation"></li>
                <li class="nav-item dropdown no-arrow mx-1" role="presentation">
                    <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                </li>
                
                <div class="d-none d-sm-block topbar-divider"></div>
                <li class="nav-item dropdown no-arrow" role="presentation">
                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small"><%=user_name %></span><img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg?h=0ecc82101fb9a10ca459432faa8c0656"></a>
                        <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="../user/userInfo.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a></div>
        </div>
        </li>
        </ul>
        </div>
    </nav>
    <!--  header line  -->
    

    <div id="wrapper">
    
    	<!-- Start: 메뉴바 -->
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198, 43, 43);">
            <div class="container-fluid d-flex flex-column p-0">
            
                <hr class="sidebar-divider my-0">

                <!-- Navigator Menu -->
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="../main/index.jsp">
                            <i class="fas fa-tachometer-alt"></i> <span>모니터링</span>
                        </a></li>

                    <li class="nav-item" role="presentation"><a class="nav-link" href="../growinfo/growInfoList.jsp">
                            <i class="fas fa-table"></i> <span>상태 기준 정보</span>
                        </a></li>

                    <li class="nav-item" role="presentation"><a class="nav-link" href="../watertank/stateRec.jsp">
                            <i class="fas fa-th-list"></i> <span>상태 기록</span>
                        </a></li>

                    <li class="nav-item" role="presentation"><a class="nav-link" href="../watertank/repairRec.jsp">
                            <i class="fas fa-record-vinyl"></i> <span>조치 기록</span>
                        </a></li>


                    <li class="nav-item" role="presentation"><a class="nav-link" href="alert('준비중');">
                            <i class="fas fa-chart-bar"></i> <span>통계</span>
                        </a></li>

                    <li class="nav-item" role="presentation"><a class="nav-link" href="../user/farmListForm.jsp">
                            <i class="fas fa-tint"> </i><span>양식장 정보 관리</span>
                        </a></li>

                    <li class="nav-item" role="presentation"><a class="nav-link" onclick="moveFarmWtSearchPage();">
                            <i class="fas fa-water"> </i><span>수조 정보</span>
                        </a></li>

                </ul>
                <!--  End Menu Navigator -->

                <div class="text-center d-none d-md-inline">
                    <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
                </div>
            </div>
        </nav>
		<!-- End: 메뉴바 -->
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
        


                <div class="container-fluid text-right text-sm-right text-md-right text-lg-right text-xl-right mb-4">
                    <h5></h5>
                    <%
                    	if (user_auth.equals("sysadmin")) {
                    %>

                    <strong class="mr-2">선택</strong>

                    <select class="form-control-sm ml-2 mb-2 mt-2" id="selectAdmin" onchange="goSelectedAdmin()">
                        <option class="option_menu" value="init" selected>관리자를 선택하세요</option>
                        <%
                        	String select_user_id = null;
                        		String select_user_name = null;
                        		ArrayList<usertableDTO> user_select = user_dao.select_user(user_auth);

                        		for (int i = 0; i < user_select.size(); i++) {
                        			select_user_id = user_select.get(i).getUserId();
                        			select_user_name = user_select.get(i).getUserName();
                        %>
                        <option value="<%=select_user_id%>"><%=select_user_name%><hr>
                        </option>
                        <%
                        	}
                        %>

                    </select>
                    <select class="form-control-sm ml-2 mb-2 mt-2" id="selectFarm" onchange="goSelectedFarm()">
                        <opiton value="0">양식장을 선택하세요</opiton>


                    </select>

                    <%
                    	} else if (user_auth.equals("admin")) {
                    %>
                    <select class="form-control-sm ml-2 mb-2 mt-2" id="selectFarm" onchange="goSelectedFarm()">
                        <option class="option_menu" value="init" selected>양식장을 선택하세요</option>
                        <%
                        	int select_farm_id = 0;
                        		String select_farm_name = null;

                        		ArrayList<farmDTO> farm_select = farm_dao.getuserFarmData(user_id);
                        		for (int i = 0; i < farm_select.size(); i++) {
                        			select_farm_id = farm_select.get(i).getFarmId();
                        			select_farm_name = farm_select.get(i).getFarmName();
                        %>

                        <option value="<%=select_farm_id%>"><%=select_farm_name%>
                        </option>

                        <%
                        	}
                        %>
                    </select>
                    <%
                    	} else {
                    %>
                    <select class="form-control-sm ml-2 mb-2 mt-2" id="selectFarm" onchange="goSelectedFarm()">
                        <option class="option_menu" value="init" selected>양식장을 선택하세요</option>
                        <%
                        	int select_farm_id = 0;
                        		String select_farm_name = null;

                        		ArrayList<farmDTO> farm_select = farm_dao.getuserFarmData(user_id);
                        		for (int i = 0; i < farm_select.size(); i++) {
                        			select_farm_id = farm_select.get(i).getFarmId();
                        			select_farm_name = farm_select.get(i).getFarmName();
                        %>

                        <option value="<%=select_farm_id%>"><%=select_farm_name%>
                        </option>
                        <%
                        	}
                        %>
                    </select>
                    <%
                    	}
                    %>
                </div>

                <div class="row offset-lg-1" style="margin-left: 0.3%;" id="watertank_layout_grid"></div>


            </div>
            <!-- END LINE -->
        </div>

    </div>
    <footer class="bg-white sticky-footer">
        <div class="container my-auto">
            <div class="text-center my-auto copyright">
                <span>Copyright © Mokpo National University&nbsp; 2020</span>
            </div>
        </div>
    </footer>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    </div>

    <script src="../../common/func/util.js"></script>
    <script src="../../common/func/monitoring.js">
					
				</script>

    <script src="../../common//assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>

</body>

</html>