<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : farmwtSearch.jsp
    ■ DESCRIPTION           : 상태 기준 정보 페이지
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "rec.*" %>
<%@ page import="sun.font.SunFontManager.FamilyDescription"%>
<jsp:useBean id="StrUtil" class="main.StringUtil"/>
<jsp:useBean id="farmDao" class="farm.farmDAO"/>
<jsp:useBean id="recDao" class="rec.recDAO"/>
<!DOCTYPE html>
<html>

<%
	// 한글 패치
	request.setCharacterEncoding("UTF-8");
	
	int farmid = Integer.parseInt(request.getParameter("farmid"));

	
	// 변수 받아오기
	// 양식장ID / 양식장 명 받아오기
	String farmName = farmDao.farmidToName(farmid);
	
	// 페이징에 필요한 변수
	int pageListSize = 7; // 한페이지에 나오는 리스트 개수
	int pageSize = 10; // 한번에 표현할 페이지 개수
	int nowPage = 1; // 현재 페이지 저장할 변수
	int listTotalSize; // rownum 조건을 붙이지 않은 검색 결과 개수 저장 용도
	
	//페이지에 보여질 리스트의 시작과 끝 번호(rownum 시작 / 끝)
	int listStart;
	int listEnd;
	
	if(request.getParameter("nowPage") != null){
    	nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
	
	listStart = (nowPage * pageListSize) - pageListSize + 1;
	listEnd = listStart + pageListSize - 1;
	
	// 검색어 관련 변수(수조이름 / 어종 / 상태기준정보명 / 측정일시(검색용도, 시작/끝/통합))
	String tankId = StrUtil.nullToBlank(request.getParameter("tankId"));
	String fishName = StrUtil.nullToBlank(request.getParameter("fishName"));
	String state = StrUtil.nullToBlank(request.getParameter("state"));
	String sensorSDate = StrUtil.nullToBlank(request.getParameter("sensorSDate"));
	String sensorEDate = StrUtil.nullToBlank(request.getParameter("sensorEDate"));
	String sensorDate;
	
	// sensorSDate랑 sensorEDate가 공백이면 sensorDate에 공백 저장
	if(sensorSDate.equals("") && sensorEDate.equals("")){
		sensorDate = "";
	} else{
		sensorDate = "sensorDate >= to_date('" + sensorSDate + "','YYYY-MM-DD') "
					+ "and sensorDate < to_date('" + sensorEDate + "','YYYY-MM-DD') + 1";
	}
	
	

	
	// 검색어를 저장하기 위한 변수
	recDTO indto = new recDTO();
	
	indto.setFarmId(farmid);
	indto.setTankId(tankId);
	indto.setRemark(fishName);
	indto.setState(state);
	indto.setSensorDate(sensorDate);
%>

<script>
	// select 박스 선택
	// 화면 초기화시 (화면로딩후 시작후 바로)
	function goInit(){
		var frm = document.farmSelectedForm;
		var state = frm.state;
		state.value = "<%=state%>";
	}
	
	// paging 할때 검색어 유지를 하려고 따로 검색값 저장 해둠
	var searchList = {tankId:"<%=tankId %>", fishName:"<%=fishName %>", state:"<%=state%>", sensorSDate:"<%=sensorSDate%>", sensorEDate:"<%=sensorEDate%>"}
	
	window.onload = function(){
		printClock();
		goInit();
	}
	// wtRec.jsp & wtUpdateForm.jsp 에 쓰는, 조건 미입력시 전체 검색, searchForm reset 후 FarmID로만 검색
	// ************************************************************************************************************/
	 function wtSearchAll(){
	 	var obj = document.farmSelectedForm;
	 	// form 안에 있는 값들 초기화 해서 submit
	 	wtSearchReset();
	 	
	 	obj.target = "_self";
	 	obj.method = "POST";
	 	obj.submit();
	 }

	 //************************************************************************************************************
</script>
		
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=a0c69c2ee60d5a7f34c321b94a34e501">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=06ed58a0080308e1635633c2fd9a56a3">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=06ed58a0080308e1635633c2fd9a56a3">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=50a8e9fe65cba9461984a61467997ba4">
</head>

<body id="page-top">
    <nav class="navbar navbar-light navbar-expand bg-white shadow topbar static-top">
        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
            <h3 class="text-dark ml-4 mt-2 navbar-brand"><strong>SmartAquaFarm&nbsp;</strong></h3>
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
                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">sysadmin</span><img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg?h=0ecc82101fb9a10ca459432faa8c0656"></a>
                        <div
                            class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="userInfo.html"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a></div>
        </div>
        </li>
        </ul>
        </div>
    </nav>
    <div id="wrapper">
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198,43,43);">
            <div class="container-fluid d-flex flex-column p-0">
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="../main/index.jsp"><i class="fas fa-tachometer-alt"></i><span>모니터링</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="상태기준정보.html"><i class="fas fa-table"></i><span>상태 기준 정보</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="상태기록검색.html"><i class="fas fa-th-list"></i><span>상태 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="조치기록등록.html"><i class="fas fa-record-vinyl"></i><span>조치 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="register.html"><i class="fas fa-chart-bar"></i><span>통계</span></a><a class="nav-link" href="create-1.html"><i class="fas fa-tint"></i><span>양식장 정보 관리</span></a><a class="nav-link" href="farmwtUpdateForm.html"><i class="fas fa-water"></i><span>수조 정보</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div class="text-center" id="content">
                <!-- Start: 양식장이름 -->
                <div class="container-fluid">
                    <h2 class="mt-5"><strong>상태기록보기(<%=farmName %>)</strong></h2>
                </div>
                <!-- End: 양식장이름 -->
                <!-- Start: 검색부분 -->
                <div class="container mt-4 mb-4">
                    <form>
                        <div class="form-row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-3 row-cols-xl-3 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center">
							<div class="col-xl-3 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center">
								<label style="width: 150px; margin-top: 4px;"><strong>수조명&nbsp;</strong></label> 
								<input class="form-control form-control-sm mr-2" type="text" name="tankId" value="<%=tankId %>" maxlength="10">
							</div>
							<div class="col-xl-3 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center">
								<label style="width: 130px; margin-top: 4px;"><strong>&nbsp; &nbsp;어종&nbsp;</strong></label> 
								<input class="form-control form-control-sm mr-2" type="text" name="fishName" value="<%=fishName %>">
							</div>
							<div class="col-xl-4 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center">
								<label style="width: 299px; margin-top: 4px;"><strong>측정기간&nbsp;</strong></label> 
								
								<input type="date" name="sensorSDate" value="<%=sensorSDate%>" style="text-align:center; width:140px; height:30px;"> ~ 
								<input type="date" name="sensorEDate" value="<%=sensorEDate%>" style="text-align:center; width:140px; height:30px;">

							</div>
							<div class="col-xl-1 text-center" style="margin: 0px; margin-bottom: 0px; margin-top: 0px; padding-right: 5px; margin-right: 0px;">
								<button class="btn btn-primary btn-sm" type="button" style="width: 60px;" onclick="wtSearch()" >조회</button>
								<button class="btn btn-primary btn-sm" type="button" style="width: 60px;" id="btnReset" onclick="wtSearchReset()">초기화</button>
							</div>
						</div>
                    </form>
                </div>
                <!-- End: 검색부분 -->
                <!-- Start: 테이블 -->
                <div class="container">
                    <div class="table-responsive table-bordered" style="height: 239px;">
                        <table class="table table-bordered">
                            <tbody class="shadow-sm">
<%
			System.out.print("indto : ");
			System.out.println(indto.getFarmId());
			
			// 검색결과를 저장하기 위한 변수
			ArrayList<recDTO> recADto = new ArrayList<recDTO>();
			
			// 출력할 List 뽑아오기
			recADto = recDao.RecList(indto);

			/* 
			// 검색 결과 개수 뽑기
			listTotalSize = recDao.recTableListSize(); */
%>
                                <tr class="table-primary">
                                    <td class="text-dark"><strong>측정일시</strong></td>
                                    <td class="text-dark"><strong>수조이름</strong></td>
                                    <td class="text-dark"><strong>어종</strong></td>
                                    <td class="text-dark"><strong>상태</strong></td>
                                    <td class="text-dark"><strong>DO</strong><br><strong>(mg/L)</strong></td>
                                    <td class="text-dark"><strong>수온</strong></td>
                                    <td class="text-dark"><strong>염도</strong><br><strong>(psu)</strong></td>
                                    <td class="text-dark"><strong>pH</strong></td>
                                    <td class="text-dark"><strong>NH4</strong><br><strong>(mg/L)</strong></td>
                                    <td class="text-dark"><strong>NO2</strong><br><strong>(mg/L)</strong></td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- End: 테이블 -->
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