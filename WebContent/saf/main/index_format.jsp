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
				<!-- 상단 -->
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
				
				
				
				
				<div class="row" id="watertank_layout_grid">
				
                	</div>
					
					
					
					
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
		<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
	</div>

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
			
			for (i = search_farm.length - 1; i >= 0; i--) {	
				search_farm.options.remove(i);
			}
		
			for (i = 0; i < result.length; i++) {
				// farm_id : [0][0] 양식장 ID 인덱스
				// farm_name : [0][1]; 양식장 이름 인덱스
				if( i == 0  ){
					var objOption = document.createElement("option");
					objOption.value = 0
					objOption.textContent = "양식장을 선택하세요";
					search_farm.options.add(objOption);
					
				} 
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

function goSelectedFarm() {
	
	
	var getSelectValue = document.getElementById("selectFarm");
	var get_farm_id = getSelectValue.value;

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var JsonObj = eval("(" + xhr.responseText + ")");
			
			// watertank REC Data Dynamic Loading Logic
			var result = JsonObj.result;
			temp = result;
			
			var creDiv = document.getElementById("watertank_layout_grid");
			
			// Check WaterTank Count value
			// if check_wt_number == "0"
			// remove all display before watertank
			var check_wt_number = result[0][0].all_waterTank_count;
			
			if (check_wt_number == 0) {
				var deleteValue = creDiv.getElementsByClassName("row").length
				
					
				for(i=deleteValue-1; i>=0 ; i--) {
					creDiv.getElementsByClassName("row")[i].remove();
				}
				creDiv.textContent = "검색된 수조가 없습니다.";
				return;
			
			} else {
			creDiv.textContent = "";
			
			for(i=1; i<result.length; i++) {
			
				//second Loop Max
				var secLoopMaxValue = result[i].length;
				
				for(j=0;  j<secLoopMaxValue; j++) {
					// Data Format Declare
					var watertank_number = result[i][0].watertank_number;						
					var watertank_state = result[i][1].watertank_state;
					var watertank_state_signal = result[i][2].watertank_state_signal;
					var fish_category = result[i][3].물고기종;
					var watertank_do = result[i][4].DO;
					var watertank_wtrec = result[i][5].WTREC;
					var watertank_phrec = result[i][6].PHREC;
					var watertank_nh4rec = result[i][7].NH4REC;
					var watertank_no2rec = result[i][8].NO2REC;
					var watertank_recseq = result[i][9].RECSEQ;
					var data_end_format = result[i][10].value;
					
					var html = "";
					html += "<div class=\" card shadow mb-md-0 offset-md-1s ml-5\">";
					
				    html += "<div class=\"card-header d-flex justify-content-between align-items-center\">";
				    html += "    <i class=\"icon ion-ios-circle-filled danger-icon fa-lg\"></i>";
				    html += "    <h6 class=\"text-primary font-weight-bold m-0\">"+watertank_number+"</h6>";
				    html += "    <div class=\"dropdown no-arrow\">";
				    html += "        <button class=\"btn btn-link btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\" type=\"button\">";
				    html += "                <i class=\"fas fa-ellipsis-v text-gray-400\"></i>";
				    html += "            </button>";
				    
				    html += "        <div class=\"dropdown-menu shadow dropdown-menu-right animated--fade-in\" role=\"menu\">";
				    html += "            <a class=\"dropdown-item\" role=\"presentation\" href=\"#\">&nbsp;조치하기</a>";
				    html += "        </div>";
				    html += "    </div>";
				    html += " </div>";

				    html += "<div class=\"card-body\">";
				    html += "    <div class=\"row\">";
				    html += "        <div class=\"col-xl-5 offset-xl-0 d-xl-flex justify-content-xl-center align-items-xl-center\">";
				    html += "            <i class=\"fas fa-glass-whiskey d-xl-flex justify-content-xl-center fa-6x water-tank-icon\"></i>";
				    html += "        </div>";

				    html += "        <div class=\"col-xl-7 d-xl-flex\">";
				    html += "            <div class=\"table-responsive table-borderless mt-2 mb-2\">";
				    html += "                <table class=\"table table-bordered table-sm\">";
				    html += "                    <tbody>";
				    html += "                        <tr>";
				    html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left flex-shrink-0\">"+watertank_number+ "</td>";
				    html += "                            <td>"+fish_category+"</td>"
				    html += "                        </tr>";
				    html += "                        <tr>";
				    html += "                            <td class=\"table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left\">DO</td>";
				    html += "                            <td class=\"table-warning\">"+watertank_do+"</td>"
				    html += "                        </tr>";
				    html += "                        <tr>";
				    html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left\">수온</td>";
				    html += "                            <td>"+watertank_wtrec+"</td>";
				    html += "                        </tr>";
				    html += "                        <tr>";
				    html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left\">pH</td>";
				    html += "                            <td>"+watertank_phrec+"</td>";
				    html += "                        </tr>";
				    html += "                        <tr>";
				    html += "                            <td class=\"table-danger text-left text-sm-left text-md-left text-lg-left text-xl-left\">암모니아</td>";
				    html += "                            <td class=\"table-danger\">"+watertank_nh4rec+"</td>";
				    html += "                        </tr>";
				    html += "                        <tr>";
				    html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left\">아질산</td>";
				    html += "                            <td>"+watertank_no2rec+"</td>"
				    html += "                        </tr>";
				    html += "                    </tbody>";
				    html += "                </table>";
				    html += "            </div>";				 
				    html += "        </div>";
				    html += "    </div>";
				    html += "	</div>";
				    html += "</div>";
					
				}
				creDiv.insertAdjacentHTML("beforeend",html);

			} 
		} // End Else Syntax
	} else {
		return false;	
	
		}
	}	//End onreadystateChange
	
	
	xhr.open("Post", "../../LogDataRequest", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("farm_id=" + get_farm_id);
	
}// End goSelectedFarm


</script>

<script src="../../common/assets/js/jquery.min.js"></script>
<script src="../../common/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../../common/assets/js/theme.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>

</body>

</html>