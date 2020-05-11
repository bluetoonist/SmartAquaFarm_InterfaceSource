<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : farmwtUpdateForm.jsp
    ■ DESCRIPTION           : 양식장 수조 정보 업데이트 페이지
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>

<%@ page import="user.*"%>
<%@ page import="farm.*"%>
<%@ page import="growInfo.*"%>
<%@ page import="watertank.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- bean setup  -->
<jsp:useBean id="user_dto" scope="page" class="user.usertableDTO" />
<jsp:useBean id="user_dao" scope="page" class="user.usertableDAO" />


<%
	//한글 패치
	request.setCharacterEncoding("UTF-8");

	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	//farmDAO는 mgr1로 사용
	farmDAO mgr1 = new farmDAO();
	//waterTankDAO는 mgr2로 사용
	waterTankDAO mgr2 = new waterTankDAO();
	//growInfoDAO는 mgr3로 사용
	growInfoDAO mgr3 = new growInfoDAO();
	//usertableDAO는 mgr4로 사용
	usertableDAO mgr4 = new usertableDAO();

	//전페이지에서 가져온 수조번호 값
	String tankID = request.getParameter("tankID"); //tankID 값 요청(int)해서 받기

	//전페이지에서 가져온 양식장 아이디 값
	int FarmID = Integer.parseInt(request.getParameter("FarmID"));

	//취소 버튼 누를때 formname 비교 하기 위해서
	String formname = "formUpdate";

	//수정할 DB에 있는 값 불러오기
	ArrayList<waterTankDTO> wtselectlist = mgr2.waterTankSelect(tankID, FarmID);

	//양식장 이름 출력에 사용
	String farmname = mgr1.farmSelect(FarmID);

	//어종 셀렉트박스 출력 부분 
	ArrayList<growInfoDTO> fishname_list = mgr3.fishSelect(FarmID);

	//담당자
	ArrayList<usertableDTO> userAddlist = mgr4.usertableSelect(user_id);

	String tankid = null;
	String lastuptdate = null;
	String lastuptid = null;
	String fishname = null;
	String userid = null;
	String dosensor = null;
	String phsensor = null;
	String psusensor = null;
	String wtsensor = null;
	String nh4sensor = null;
	String no2sensor = null;

	/* farmDAO에서 받아온 wtselectlist 출력 */
	for (int i = 0; i < wtselectlist.size(); i++) {

		//만약 DB에 있는 값이 NULL이면 아무것도 출력 안되게 하려고 적음
		tankid = wtselectlist.get(i).getTankId();
		lastuptdate = wtselectlist.get(i).getLastUptdate();
		lastuptid = wtselectlist.get(i).getLastUptId();
		fishname = wtselectlist.get(i).getRemark();
		userid = wtselectlist.get(i).getUserId();
		dosensor = wtselectlist.get(i).getDoSensor();
		phsensor = wtselectlist.get(i).getPhSensor();
		psusensor = wtselectlist.get(i).getPsuSensor();
		wtsensor = wtselectlist.get(i).getWtSensor();
		nh4sensor = wtselectlist.get(i).getNh4Sensor();
		no2sensor = wtselectlist.get(i).getNo2Sensor();

		if (userid == null) {
			userid = "";
		}
		if (dosensor == null) {
			dosensor = "";
		}
		if (phsensor == null) {
			phsensor = "";
		}
		if (psusensor == null) {
			psusensor = "";
		}
		if (wtsensor == null) {
			wtsensor = "";
		}
		if (nh4sensor == null) {
			nh4sensor = "";
		}
		if (no2sensor == null) {
			no2sensor = "";
		}
%>

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
	
</script>
</head>

<body id="page-top">
    
        
    <!--  header  -->
    <nav class="navbar navbar-light navbar-expand shadow topbar static-top" style="margin-bottom: 0px;">
        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
            <h3 class="text-dark mb-0 navbar-brand"><strong>SmartAquaFarm</strong></h3>
            <h3 class="text-dark mb-0 navbar-brand"><strong>수조 정보</strong></h3>
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
		<nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198, 43, 43);">
			<div class="container-fluid d-flex flex-column p-0">
			
				<hr class="sidebar-divider my-0">
				<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="../main/index.jsp"> <i class="fas fa-tachometer-alt"></i> <span>모니터링</span>
					</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link" href="../growinfo/growInfoList.jsp"> <i class="fas fa-table"></i> <span>상태 기준 정보</span>
					</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link" href="../watertank/stateRec.jsp"> <i class="fas fa-th-list"></i> <span>상태 기록</span>
					</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link" href="../watertank/repairRec.jsp"> <i class="fas fa-record-vinyl"></i> <span>조치 기록</span>
					</a></li>


					<li class="nav-item" role="presentation"><a class="nav-link" href="alert('준비중');"> <i class="fas fa-chart-bar"></i> <span>통계</span></a></li>

					<li class="nav-item" role="presentation"><a class="nav-link" href="../user/farmListForm.jsp"> <i class="fas fa-tint"> </i><span>양식장 정보 관리</span>
					</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link" onclick="moveFarmWtSearchPage();"> <i class="fas fa-water"> </i><span>수조 정보</span>
					</a></li>

				</ul>
				<!--  End Menu Navigator -->
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
				</div>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
		

				<div class="container-fluid">
					<h5 class="text-dark d-xl-flex justify-content-xl-center align-items-xl-center mb-0 navbar-brand">
						<strong><%=tankid%></strong>
					</h5>
					<h3 class="text-dark d-xl-flex justify-content-xl-center align-items-xl-center mb-0 navbar-brand">
						
						<button class="btn btn-primary btn-sm mr-2" type="button" onclick="goUpdate();">
							<strong>수정</strong>
						</button>
                        
                        <button class="btn btn-primary btn-sm mr-2" type="button" onclick="farmCancel('<%=formname%>'); ">
                            <strong>취소</strong>
                        </button>
                        
                        
						<button class="btn btn-primary btn-sm" type="button" onclick="gofarmdelete(); ">
							<strong>삭제</strong>
						</button>
						<br>
					</h3>
					<h3 class="text-dark d-xl-flex justify-content-xl-center align-items-xl-center mb-0 navbar-brand">
						<br>
					</h3>
				</div>

				<form name="farmSelect" target="return false;">
					<input type="hidden" name="farmid" value="<%=FarmID%>" /> <input type="hidden" name="tankID" value="<%=tankID%>" /> <input type="hidden" name="formname"
						value="<%=formname%>"
					/>
					<!-- 값 수정 -->
					<input type="hidden" name="userid" value="admin1" /> <input type="hidden" name="selectFish" value="넙치" />

					<div class="container text-truncate text-center">
						<div class="table-responsive table-bordered text-truncate">
							<table class="table table-bordered" style="text-align: center;">
								<thead>
									<tr></tr>
								</thead>
								<tbody>
									<tr></tr>
                                    
                                    <!--  양식장 번호 표시 영역 LINE -->
									<tr>
										<td class="table-primary border rounded-0" rowspan="1" colspan="2">
											<strong> 양식장 번호</strong>
                                            
										</td>
										<td rowspan="1" colspan="2">
											<input type="text" name="tankid" size="20" value=<%=FarmID%> style="text-align:center; border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
										</td>
									</tr>
                                    <!-- 양식장 표시 영역 End -->
                                    
                                    
                                    <!-- 어종 표시 영역 LINE -->
									<tr rowspan="1" colspan="2">
										<td class="table-primary" rowspan="1" colspan="2">
											<strong>어종</strong>
										</td>

										<td class="flex-shrink-0">
											<select class="form-control-sm pl-2" style="padding-top: 1;">
												<optgroup label="어종을 선택하세요">
													<%
														for (int j = 0; j < fishname_list.size(); j++) {
																
													%>
													<option value="<%=fishname_list.get(j).getRemark()%>">
														<%=fishname_list.get(j).getRemark()%></option>
													<%
														}
													%>
												</optgroup>
											</select>
											<br>
										</td>
                                      </tr>
                                       <!-- End -->
                                      
                                      
                                       <!-- 담당자 표시  LINE -->
                                       <tr rowspan="1" colspan="2">
										<td class="table-primary" rowspan="1" colspan="2">
											<%
												if (user_id != null) {
											%>
											<strong>담당자</strong>
										</td>
                                        
                                        
										<td id="wait_Data">
											<input type="hidden" name="userid" maxlength="10" value="<%=user_id%>" />
											<button class="btn btn-primary btn-sm" type="button" onclick="gofarmwtUserForm_in('<%=FarmID%>')">
												<strong>조회</strong>
											</button>
										</td>
										<%
											} else {
										%>
										<strong>담당자</strong>
										</td>
                                        <!--  End line -->
                                        
                                        <!--  담당자 조회 버튼 표시 영역 LINE -->
										<td id="wait_Data">
											<button class="btn btn-primary btn-sm" type="button" onclick="gofarmwtUserForm_in('<%=FarmID%>')">
												<strong>조회</strong>
											</button>
										</td>
										<%
											} //size
										%>
									</tr>
                                    <!-- End -->
                                      
                                     <!-- 수질 환경 측정 데이터 표시 영역  -->
									<tr>
										<td class="table-primary" rowspan="6">
											<strong> <br><br><br><br><br> 장비명</strong>
										</td>
										<td class="table-primary">
											<strong>DO</strong>
										</td>
										<td colspan="2">
											<input type="text" name="dosensor" size="20" value=<%=dosensor%> style=" text-align:center; border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
									</tr>
									<tr>
										<td class="table-primary">
											<strong>pH</strong>
										</td>
										<td colspan="2">
											<input type="text" name="phsensor" size="20" value=<%=phsensor%> style="text-align:center; border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
									</tr>
									<tr>
										<td class="table-primary">
											<strong>PSU</strong>
										</td>
										<td colspan="2">
											<input type="text" name="psusensor" size="20" value=<%=psusensor%> style="text-align:center; border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
									</tr>
									<tr>
										<td class="table-primary">
											<strong>수온</strong>
										</td>
										<td colspan="2">
											<input type="text" name="wtsensor" size="20" value=<%=wtsensor%> style=" text-align:center; border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
									</tr>
									<tr>
										<td class="table-primary">
											<strong>NH4</strong>
										</td>
										<td colspan="2">
											<input type="text" name="nh4sensor" size="20" value=<%=nh4sensor%> style=" text-align:center; border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
									</tr>
									<tr>
										<td class="table-primary">
											<strong>NO2</strong>
										</td>
										<td colspan="2">
											<input type="text" name="no2sensor" size="20" value=<%=no2sensor%> style=" text-align:center;  border: none; background: transparent; width: 100%;" maxlength="10">
										</td>
									</tr>
                                    
                                     <!-- 수질 환경 측정 데이터 표시 영역  END LINE-->
								</tbody>
							</table>
						</div>
					</div>
					<%
						}
					%>
				</form>
			</div>
			<footer class="bg-white d-xl-flex align-items-xl-end sticky-footer">
				<div class="container my-auto">
					<div class="text-center my-auto copyright">
						<span>Copyright © Mokpo National University&nbsp; 2020</span>
					</div>
				</div>
			</footer>
		</div>
		<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
	</div>
	<script src="../../common/func/util.js"></script>
	<script src="../../common/func/monitoring.js">
		
	</script>
	<script src="../../common/assets/js/jquery.min.js"></script>
	<script src="../../common/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../common/assets/js/theme.js"></script>
	<script src="assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	<script src="assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>
</html>