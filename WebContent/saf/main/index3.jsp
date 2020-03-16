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

<link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="../../common/assets/css/untitled.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">

</head>

<body id="page-top">
	
	<%
		/* Session  Configuration */
		String user_id = (String) session.getAttribute("userId");
		String user_name = (String) session.getAttribute("userName");
		String user_auth = (String) session.getAttribute("userAuth");
	%>

	<div id="wrapper">
		<nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198, 43, 43);">
			<div class="container-fluid d-flex flex-column p-0">
				<a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-fish"></i>
					</div>
					
					<div class="sidebar-brand-text mx-3">
						<span class="text-monospace">sMART AQUA FARM</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				
				<% if(user_auth.equals("sysadmin")){ %>
				<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">
						<i class="fas fa-tachometer-alt"></i>
						<span>모니터링</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="profile.html">
						<i class="fas fa-table"></i>
						<span>상태 기준 정보</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="table.html">
						<i class="fas fa-th-list"></i>
						<span>상태 기록</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="login.html">
						<i class="fas fa-record-vinyl"></i>
						<span>조치 기록</span>
						</a>
					</li>
					
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-chart-bar"></i>
						<span>통계</span></a>
					</li>
						
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-tint">
						</i><span>양식장 정보 관리</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">				
						<a class="nav-link" href="register.html">
						<i class="fas fa-water">
						</i><span>수조 정보</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
				
				
				
				<% } else if(user_auth.equals("admin")) { %>
					
					<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">
						<i class="fas fa-tachometer-alt"></i>
						<span>모니터링</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="profile.html">
						<i class="fas fa-table"></i>
						<span>상태 기준 정보</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="table.html">
						<i class="fas fa-th-list"></i>
						<span>상태 기록</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="login.html">
						<i class="fas fa-record-vinyl"></i>
						<span>조치 기록</span>
						</a>
					</li>
					
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-chart-bar"></i>
						<span>통계</span></a>
					</li>
						
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-tint">
						</i><span>양식장 정보 관리</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">				
						<a class="nav-link" href="register.html">
						<i class="fas fa-water">
						</i><span>수조 정보</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
					
				<% } else { %>
				
					<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">
						<i class="fas fa-tachometer-alt"></i>
						<span>모니터링</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="profile.html">
						<i class="fas fa-table"></i>
						<span>상태 기준 정보</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="table.html">
						<i class="fas fa-th-list"></i>
						<span>상태 기록</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="login.html">
						<i class="fas fa-record-vinyl"></i>
						<span>조치 기록</span>
						</a>
					</li>
					
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-chart-bar"></i>
						<span>통계</span></a>
					</li>
						
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-tint">
						</i><span>양식장 정보</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">				
						<a class="nav-link" href="register.html">
						<i class="fas fa-water">
						</i><span>수조 정보</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
					
				
				
				<% } %>
				
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
				</div>
			</div>
		</nav>
		
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						
						<!--  상단 페이지 제목 -->
						<h3 class="text-dark mb-0 navbar-brand">
							<strong>모니터링</strong>
						</h3>
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
								<div class="nav-item dropdown no-arrow">
									<a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
									<span class="d-none d-lg-inline mr-2 text-gray-600 small"><%=user_name %></span>
									<img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg">
									</a>
									
									<div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
										<a class="dropdown-item" role="presentation" href="../user/userInfo.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a>
									</div>
								</div>						
							</li>
							
							
							
							
						</ul>
					</div>
				</nav>
				
				
				<div class="container-fluid text-right text-sm-right text-md-right text-lg-right text-xl-right mb-4">
					<h5></h5>
					<% if (user_auth.equals("sysadmin")) { %>
				
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
				
					<% } else if(user_auth.equals("admin")) { %>
							System.out.println("적용 중" );
				
					<% } else { %>
							System.out.println("적용 중");
				
					<% } %>
				
				
				</div>
				
				<div class="row">
				<!--  Here -->
					     <div class=" card shadow mb-md-0 offset-md-1s ml-5">
                        <div class="card-header d-flex justify-content-between align-items-center"><i class="icon ion-ios-circle-filled danger-icon fa-lg"></i>
                            <h6 class="text-primary font-weight-bold m-0">1번 수조</h6>
                            <div class="dropdown no-arrow"><button class="btn btn-link btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false" type="button"><i class="fas fa-ellipsis-v text-gray-400"></i></button>
                                <div class="dropdown-menu shadow dropdown-menu-right animated--fade-in" role="menu"><a class="dropdown-item" role="presentation" href="#">&nbsp;조치하기</a></div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-5 offset-xl-0 d-xl-flex justify-content-xl-center align-items-xl-center"><i class="fas fa-glass-whiskey d-xl-flex justify-content-xl-center fa-6x water-tank-icon"></i></div>
                                <div class="col-xl-7 d-xl-flex">
                                    <div class="table-responsive table-borderless mt-2 mb-2">
                                        <table class="table table-bordered table-sm">
                                            <tbody>
                                                <tr>
                                                    <td class="text-left text-sm-left text-md-left text-lg-left text-xl-left flex-shrink-0">물고기종</td>
                                                    <td>넙치</td>
                                                </tr>
                                                <tr>
                                                    <td class="table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left">D.O.</td>
                                                    <td class="table-warning">7.0</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left text-sm-left text-md-left text-lg-left text-xl-left">수온</td>
                                                    <td>16.7</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left text-sm-left text-md-left text-lg-left text-xl-left">pH</td>
                                                    <td>7.0</td>
                                                </tr>
                                                <tr>
                                                    <td class="table-danger text-left text-sm-left text-md-left text-lg-left text-xl-left">암모니아</td>
                                                    <td class="table-danger">5.0</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left text-sm-left text-md-left text-lg-left text-xl-left">아질산</td>
                                                    <td>5.0</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					
				<!-- /Here -->
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
		<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
	</div>



	<script src="../../assets/js/jquery.min.js"></script>
	<script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/js/theme.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	
</body>

<script>
var xhr = new XMLHttpRequest();

var temp; // debugg temp Variable (must be removed)



function goSelectedAdmin() {

	var getSelectValue = document.getElementById("selectAdmin");
	var get_user_id = getSelectValue.value;

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var JsonObj = eval("(" + xhr.responseText + ")");
			var result = JsonObj.result;
			temp = result;

			var search_farm = document.getElementById("selectFarm");
			console.log(search_farm.length);
			for (i = search_farm.length - 1; i >= 0; i--) {
				
				search_farm.options.remove(i);
				
			}
		
			
			for (i = 0; i < result.length; i++) {

				// farm_id : [0][0]
				// farm_name : [0][1];
				var objOption = document.createElement("option");
				objOption.value = result[i][0].farm_id;
				objOption.textContent = result[i][1].farm_name;

				search_farm.options.add(objOption);
			}
			
			
		} else {
			return "False";
		}
	}
	xhr.open("Post", "../../getFarmName", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("user_id=" + get_user_id);
}

</script>

</html>