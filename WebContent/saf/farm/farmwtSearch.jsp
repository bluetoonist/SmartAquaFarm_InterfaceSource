<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="watertank.*" %>
<%@ page import="farm.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- bean setup  -->
<jsp:useBean id="user_dto" scope="page" class="user.usertableDTO" />
<jsp:useBean id="user_dao" scope="page" class="user.usertableDAO" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>스마트 양식장</title>
<link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="../../common/assets/css/untitled.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<script>
//farmwtSearch.jsp에서 수조번호 클릭시 수정화면으로 이동하는 기능
//************************************************************************ START LINE
	function goRead(tankid,FarmID) {
		var farm = document.farmSearch;
		if (tankid != null) {
			//farm.tankID.value = tankid;
			alert(tankid + "수조가 선택되었습니다.");
			farm.target = "_self";
			farm.method = "post";
			farm.action = "farmwtUpdateForm.jsp?tankID="+tankid+"&FarmID="+FarmID;
			farm.submit();
		}
	}
//************************************************************************ END LINE
// farmwtSearch.jsp에서 조회버튼 클릭시 검색조건 또는 검색창이 null일 경우 경고창
//************************************************************************ START LINE
	function searchCheck(){	
			if(farmSearch.searchinput.value == '' && farmSearch.search.value == 'null') {
				alert("조건 선택 및 검색 단어를 입력하세요.");
				farmSearch.target = "_self"; 							//새창이 열리지않고 현재창이 바뀜
				farmSearch.method = "post";
	          farmSearch.searchinput.focus();				//Enter 눌러도 넘어감
	          return;
			}
			else if(farmSearch.searchinput.value == '' && farmSearch.search.value != 'null') {			//검색창 값이 null일 경우
				alert("검색 단어를 입력하세요.");
				farmSearch.target = "_self";				//새창이 열리지않고 현재창이 바뀜
				farmSearch.method = "post";
	          farmSearch.searchinput.focus();				//Enter 눌러도 넘어감
	          return;
	      }
	      else if(farmSearch.search.value == 'null' && farmSearch.searchinput.value != ''){			//검색조건이 선택되지 않았을(null) 경우
	      	alert("조건을 선택하세요.");
	      	farmSearch.target = "_self";
	      	farmSearch.method = "post";
	      	farmSearch.search.focus();				//Enter 눌러도 넘어감
	          return;
	      } 
	      else {											//둘 다 null이 아닐 경우
	      	farmSearch.target = "_self";
	      	farmSearch.method = "post";
	      	farmSearch.action = "farmwtSearch.jsp";  
	      	farmSearch.submit();
	      }
	}
//************************************************************************ END LINE
// farmwtSearch.jps에서 등록 버튼 클릭시 등록화면으로 이동하는 기능
//************************************************************************ START LINE
	function gofarmwtInsertForm() {
	
		var farm = document.farmSearch;
		
		farm.target = "_self";
		farm.method = "post";
		farm.action="farmwtInsertForm.jsp";
		farm.submit();
	}
//************************************************************************ END LINE
</script>
</head>

<body id="page-top">
	<%
		request.setCharacterEncoding("UTF-8");
		/* farmDAO 객체 생성 */
		ArrayList<farmDTO> farmnamelist = null;
		farmDAO farm_dao = new farmDAO();
		waterTankDAO wt_dao = new waterTankDAO();
		
		/* Session Infor*/
		String user_id = (String) session.getAttribute("userId");
		String user_name = (String) session.getAttribute("userName");
		String user_auth = (String) session.getAttribute("userAuth");
	
		// 쿼리스트링 farmid
		String Farmid = null;
		
		Farmid = request.getParameter("farmid"); 
		
		
		// 정수형 양식장 ID (String)request.getAttribute("farmid");
		int FarmID = 0;
		
		// Farmid가 null이면 index.jsp 페이지로 이동
		if (Farmid == null) {
%>
				<script>
				 MoveFarmSearchToIndexPage();
				</script>
<%
		// 그 밖에 Farmid는 숫자로 변환
		} else {
			FarmID = Integer.parseInt(Farmid);
		}
		
		System.out.println("FarmID : "+FarmID);
		
		farmnamelist = farm_dao.farmSelect(user_id);
		
 		String farmName = null;
		String search = ""; // 검색 조건 변수
		String searchinput = ""; // 검색창 변수
		ArrayList<waterTankDTO> wtlist = null; // 양식장 정보 리스트 변수
		
		if (user_auth.equals("user")) { // 권한 : 사용자일 경우
			search = request.getParameter("search"); //검색 조건 값 받아옴
			searchinput = request.getParameter("searchinput"); //검색창 값 받아옴

			wtlist = wt_dao.waterTankSearch(user_id, search, searchinput);
			farmnamelist = farm_dao.farmSelect(user_id);

		} else  { // 권한 : admin, sysadmin일 경우 		 

			search = request.getParameter("search"); //검색 조건 값  
			searchinput = request.getParameter("searchinput"); //검색창 값
			
 			wtlist = wt_dao.waterTankSearch(FarmID, search, searchinput);
			farmnamelist = farm_dao.farmSelect(Farmid); 

		} 
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
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="../main/index.jsp">
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
						<a class="nav-link active" onclick="moveFarmWtSearchPage()">
						<i class="fas fa-water">
						</i><span>수조 정보</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
				
				<% } else if(user_auth.equals("admin")) { %>
					
					<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="index.html">
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
						<a class="nav-link active" href="moveFarmWtSearchPage()">
						<i class="fas fa-water">
						</i><span>수조 정보</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
					
				<% } else { %>
				
					<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link" href="index.html">
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
						<a class="nav-link active" href="moveFarmWtSearchPage()">
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
							<strong>수조정보</strong>
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
				
					
			<!-- Start: 드랍다운 및 검색 -->
			
		<form name="farmSearch">
		<input type="hidden" name="farmid" value="<%=FarmID %>" />
			<!-- 조건 리스트 -->

<%
					if (search == "null") {
						search = "";
					}
					if (searchinput == null) { // 검색창이 null일 경우 공백으로 출력되게함
						searchinput = "";
					}
%>
			<p>
            <div class="container-fluid text-right text-sm-right text-md-right text-lg-right text-xl-right d-xl-flex justify-content-xl-center align-items-xl-center mb-4">
                
                <select name="search" id="search" class="form-control-sm ml-2 mb-2 mt-2 mr-2">
	                <option selected value='null'>조건선택</option>
					<option value='tankid'>수조 번호</option>
					<option value='lastuptdate'>수정 일시</option>
					<option value='lastuptid'>수정자</option>
					<option value='userid'>담당자</option>
                </select>
                
                <input type="text" id="searchinput" name="searchinput" class="mr-2 form-control-sm" value=<%=searchinput %>>
                <button class="btn btn-primary" type="button" style="opacity: 1;filter: blur(0px);" onclick="searchCheck()">선택</button>
                
            </div>
            <!-- End: 드랍다운 및 검색 -->
			<!-- Start: 테이블 -->
            <div class="container-fluid text-center">
            <!-- Start: 등록버튼 -->
            <div class="container-fluid text-right mb-4">
<%
				if (user_auth.equals("사용자")) { // 권한 : 사용자일때 등록 버튼은 보이지 않도록 한다.
%>

<%
				} else { // 권한 : admin, sysadmin일때 등록 버튼이 보이도록 한다.
%> 
            <button class="btn btn-primary" onclick="gofarmwtInsertForm()">등록</button>
<%
			}
%>
            </div>
            <!-- End: 등록버튼 -->
                <div class="table-responsive table-bordered d-inline">
                    <table class="table table-bordered">
                        <thead>
                            <tr></tr>
                        </thead>
                        <tbody class="text-center">
                            <tr></tr>
                            <tr>
                                <td class="table-primary border rounded-0" rowspan="2"><strong>수조정보</strong></td>
                                <td class="table-primary" rowspan="2"><strong>수정일시</strong></td>
                                <td class="table-primary" rowspan="2"><strong>수정자</strong></td>
                                <td class="table-primary" rowspan="2"><strong>어종</strong></td>
                                <td class="table-primary" rowspan="2"><strong>담당자</strong></td>
                                <td class="table-primary" rowspan="1" colspan="6"><strong>장비명</strong></td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>DO</strong></td>
                                <td class="table-primary"><strong>pH</strong></td>
                                <td class="table-primary"><strong>염도</strong></td>
                                <td class="table-primary"><strong>수온</strong></td>
                                <td class="table-primary"><strong>NH4</strong></td>
                                <td class="table-primary"><strong>NO2</strong></td>
                            </tr>
<%
							if (wtlist.isEmpty()) { // 리스트가 비어있을 경우 출력되는 값(if_1)
%>
							<tr>
								<td colspan="11"><br> <br> <br> 조회 내용이 없습니다. <br> <br> <br></td>
							</tr>
<%
							} else { // 리스트 값이 비어있지 않은 경우 출력되는 값
		
							for (int i = 0; i < wtlist.size(); i++) { //farmDAO에서 받아온 wtlist 출력               
								waterTankDTO vo = (waterTankDTO) wtlist.get(i);
	
								//waterTankTableDTO에 저장된 값 변수에 다시 저장
								String tankid = vo.getTankId(); // 수조번호
								String lastuptdate = vo.getLastUptdate(); // 수정일시
								String lastuptid = vo.getLastUptId(); // 수정자
								String fishname = vo.getRemark(); // 어종이름
								String userid = vo.getUserId(); // 사용자ID
								String dosensor = vo.getDoSensor(); // 장비명 : DO
								String phsensor = vo.getPhSensor(); // 장비명 : pH
								String psusensor = vo.getPsuSensor(); // 장비명 : 염도
								String wtsensor = vo.getWtSensor(); // 장비명 : 수온
								String nh4sensor = vo.getNh4Sensor(); // 장비명 : NH4
								String no2sensor = vo.getNo2Sensor(); // 장비명 : NO2
	
								// 화면에 출력되는 값이 null일 경우 공백으로 출력되게 함
%>
                    <tr onclick="goRead('<%= tankid %>','<%= FarmID %>')" style="cursor : pointer;" >
<%
					if (user_auth.equals("사용자")) { // 권한 : 사용자(user)일 경우(if_2)
%>
					<td><a style="text-decoration: none"><%=tankid%></a></td>
					<!-- 사용자는 조회만 가능하도록 함 -->

<%
						} else {
%>
					<td><%=tankid%></td>
					<!-- admin,sysadmin은 조회,수정,등록이 가능하도록함. 수조번호 선택시 farmwtUpdateForm으로 이동(tankID값과 같이 넘어간다.)   -->
<%
						} // if_2 end
%>
					<td><%=lastuptdate%></td>
					<td><%=lastuptid%></td>
					<td><%=fishname%></td>
					<td><%=userid%></td>
					<td><%=dosensor%></td>
					<td><%=phsensor%></td>
					<td><%=psusensor%></td>
					<td><%=wtsensor%></td>
					<td><%=nh4sensor%></td>
					<td><%=no2sensor%></td>
					<!-- 양식정보 수정시 선택한 수조번호를 넘기기 위함 -->
				</tr>
				<%
						} // for end
					} // if_1 end
				%>
                   
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- End: 테이블 -->
					
					
				</div>
				<!-- END LINE -->
				</div>
				
		</form>
	<!-- partial -->
<script src="../../common/func/util.js"></script>
<script src="../../common/func/monitoring.js"> </script>
<script src="../../common/assets/js/jquery.min.js"></script>
<script src="../../common/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../../common/assets/js/theme.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="../../common/func/util.js"></script>
</body>
</html>