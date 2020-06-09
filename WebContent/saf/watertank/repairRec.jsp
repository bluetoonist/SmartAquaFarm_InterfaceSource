<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="watertank.*"%>
<%@ page import="farm.*"%>
<%@ page import="main.*"%>
<%@ page import="repair.*"%>
<!DOCTYPE html>
<html>

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

<%
		int FarmID = 0;
		// 한글 패치
		request.setCharacterEncoding("UTF-8");
		
		// 변수 받아오기
		// 양식장ID / 양식장 명 받아오기
		try {
			FarmID = Integer.parseInt(request.getParameter("farmid"));
			System.out.println(FarmID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		farmDAO fmdao = new farmDAO();
		repairDAO rpdao = new repairDAO();
		StringUtil strUtil = new StringUtil();

		
		String farmName = fmdao.farmidToName(FarmID);
		
		// 검색어 관련 변수(수조이름 / 상태기준정보명 / 상태 / 측정일시)
		String tankId = strUtil.nullToBlank(request.getParameter("tankId"));
		String fishName = strUtil.nullToBlank(request.getParameter("fishName"));
		String state = strUtil.nullToBlank(request.getParameter("state"));
		String sensorSDate = strUtil.nullToBlank(request.getParameter("sensorSDate"));
		String sensorEDate = strUtil.nullToBlank(request.getParameter("sensorEDate"));
		String lastUptSDate = strUtil.nullToBlank(request.getParameter("lastUptSDate"));
		String lastUptEDate = strUtil.nullToBlank(request.getParameter("lastUptEDate"));
		String sensorDate;
		String lastUptDate;
		
		// sensorSDate랑 sensorEDate가 공백이면 sensorDate에 공백 저장
		// 날짜 당일까지 포함하려고 이렇게 하였음.
		if(sensorSDate.equals("") && sensorEDate.equals("")){
			sensorDate = "";
		} else{
			sensorDate = "sensorDate >= to_date('" + sensorSDate + "','YYYY-MM-DD') "
						+ "and sensorDate < to_date('" + sensorEDate + "','YYYY-MM-DD') + 1";
		}
		
		// regSDate랑 regEDate가 공백이면 regDate에 공백 저장
		if(lastUptSDate.equals("") && lastUptEDate.equals("")){
			lastUptDate = "";
		} else{
			lastUptDate = "lastUptDate >= to_date('" + lastUptSDate + "','YYYY-MM-DD') "
						+ "and lastUptDate < to_date('" + lastUptEDate + "', 'YYYY-MM-DD') + 1";
		}
		
		// 검색결과를 저장하기 위한 변수
		ArrayList<repairDTO> repairADto = null;
		
		System.out.println("faimid : " + FarmID);
		System.out.println("tankId : " + tankId);
		System.out.println("fishName : " + fishName);
		System.out.println("state : " + state);
		System.out.println("sensorDate : " + sensorDate);
		System.out.println("lastUptDate : " + lastUptDate);
		
		
		// 검색어를 저장하기 위한 변수
		repairDTO indto = new repairDTO();
		indto.setFarmId(FarmID);
		indto.setTankId(tankId);
		indto.setRemark(fishName);
		indto.setState(state);
		indto.setSensorDate(sensorDate);
		indto.setLastUptdate(lastUptDate);
%>

<script>
	// select 박스 선택
	// 화면 초기화시 (화면로딩후 시작후 바로)
	function goInit(){
		var frm = document.farmSelectedForm;
		var state = frm.state;
		state.value = "<%=state%>";
	}
	
	window.onload = function()
	{
		printClock();
		goInit();
	}
	/************************************************************************************************************
	* stateRec.jsp & repairRec.jsp 에 쓰는 검색 버튼 클릭 시 validate
	* ************************************************************************************************************/
	function wtSearch(){
		var obj = document.farmSelectedForm;
		var tankID = obj["tankId"];
		var fishName = obj["fishName"];
		var state = obj["state"];
		var sensorSDate = obj["sensorSDate"];
		var sensorEDate = obj["sensorEDate"];
		// wtUpdateForm.jsp에 있는 처리일자
		var lastUptSDate = obj["lastUptSDate"];
		var lastUptEDate = obj["lastUptEDate"];
		
		// 조건을 입력 안하고 검색시 모든 리스트 출력	
		if(noConditionCheck(tankID,fishName,state,sensorSDate,sensorEDate,lastUptSDate,lastUptEDate)){
			wtSearchAll();
			return;
		}
		
		// toDate만 입력한 경우 alert
		if ( (!checkNull(sensorSDate) && checkNull(sensorEDate)) || (checkNull(sensorSDate) && !checkNull(sensorEDate)) ){
			alert("측정일시를 모두 입력해 주세요");
			return;
		}
		
		// sensorSDate가 sensorEDate보다 클 경우 toDate 재입력 유도
		if( sensorSDate.value > sensorEDate.value ){
			alert("측정일시 시작날짜와 끝날짜를 정확히 입력해 주세요.");
			sensorSDate.value = "";
			sensorEDate.value = "";
			sensorSDate.focus();
			return;
		}
		
		// wtUpdateForm에만 lastUptSDate, lastUptEDate가 있어서 체크용도로 만듬
		if( lastUptSDate != undefined && lastUptEDate != undefined){
			// lastUptSDate가 lastUptEDate보다 클 경우 toDate 재입력 유도
			if( lastUptSDate.value > lastUptEDate.value ){
				alert("처리일시 시작날짜와 끝날짜를 정확히 입력해 주세요.");
				lastUptSDate.value = "";
				lastUptEDate.value = "";
				lastUptSDate.focus();
				return;
			}
			
			// wtUpdateForm.jsp용 처리일자 체크
			if ( (!checkNull(lastUptSDate) && checkNull(lastUptEDate)) || (checkNull(lastUptSDate) && !checkNull(lastUptEDate)) ){
				alert("처리일시를 모두 입력해 주세요");
				return;
			}
		}
		
		//searchForm 이름의 Form에 있는 값을 submit
		obj.target = "_self";
		obj.method = "POST";
		obj.submit();
	}
	
	/************************************************************************************************************
	 * wtRec.jsp & wtUpdateForm.jsp 에 쓰는, 조건 미입력시 전체 검색, searchForm reset 후 FarmID로만 검색
	* ************************************************************************************************************/
	function wtSearchReset(){
		var obj = document.farmSelectedForm; 
		obj["tankId"].value = "";
		obj["fishName"].value = "";
		obj["state"].value = "";
		obj["sensorSDate"].value = "";
		obj["sensorEDate"].value = "";
		// wtUpdateForm에만 lastUptSDate, lastUptEDate가 있어서 체크용도로 만듬
		if( obj["lastUptSDate"] != undefined && obj["lastUptEDate"] != undefined){
			obj["lastUptSDate"].value = "";
			obj["lastUptEDate"].value = "";
		}
	}
	
	/************************************************************************************************************
	* wtUpdateForm.jsp에 쓰이는 리스트 클릭 시 이벤트
	* ************************************************************************************************************/
	function wtCautionRepairContentsUpdate(farmName, tankID, repairSeq, recSeq){
		
			var url = "wtCautionUpdateForm.jsp?farmName="+farmName+"&tankID="+tankID+"&rp_s="+repairSeq+"&rc_s="+recSeq; 
			window.open(url, "CONTENTS", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500px, height=500px");
	}
	
</script>

</head>

<body id="page-top">
    <nav class="navbar navbar-light navbar-expand bg-white shadow topbar static-top">
        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
            <h3 class="text-dark ml-4 mt-2 navbar-brand"><strong>SmartAquaFarm</strong></h3>
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
                            class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
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
                    <li class="nav-item" role="presentation"><a class="nav-link" href="userInfo.html"><i class="fas fa-table"></i><span>상태 기준 정보</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="상태기준정보.html"><i class="fas fa-th-list"></i><span>상태 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="repairRec.html"><i class="fas fa-record-vinyl"></i><span>조치 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="register.html"><i class="fas fa-chart-bar"></i><span>통계</span></a><a class="nav-link" href="register.html"><i class="fas fa-tint"></i><span>양식장 정보 관리</span></a><a class="nav-link" href="farmwtUpdateForm.html"><i class="fas fa-water"></i><span>수조 정보</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div class="text-center" id="content">
                <!-- Start: 양식장이름 -->
                <div class="container-fluid">
                    <h2 class="text-dark mt-5"><strong><%=farmName %></strong></h2>
                </div>
                <!-- End: 양식장이름 -->
                <!-- Start: 검색부분 -->
                <div class="container mt-4 mb-4">
                    <form method="POST" name="farmSelectedForm">
                        <!-- Start: 수조명/어종/상태  input 그룹 -->
                        <div class="form-row row-cols-1 row-cols-sm-3 row-cols-md-3 row-cols-lg-3 row-cols-xl-3 d-xl-flex justify-content-xl-center mb-2">
                            
                            <div class="col-xl-2 offset-xl-0 d-xl-flex justify-content-xl-start">
                            <label class="text-center text-sm-center text-md-center text-lg-center text-xl-center mt-1 mr-2" style="width: 100px;">
                            <strong>수조명&nbsp;</strong></label>
                            <input class="form-control form-control-sm" type="text" name="tankId" value="<%=tankId %>" maxlength="10"/></div>
                            
                            <div class="col-xl-2 d-xl-flex justify-content-xl-center">
                            <label class="text-center text-sm-center text-md-center text-lg-center text-xl-center mt-1 mr-2" style="width: 100px;">
                            <strong>어종&nbsp;</strong></label>
                            <input class="form-control form-control-sm" type="text" name="fishName" value="<%=fishName %>" /></div>
                            
                            <div class="col-xl-3 d-xl-flex justify-content-xl-center">
                            <label class="text-center text-sm-center text-md-center text-lg-center text-xl-center mt-1 mr-2" style="width: 100px;">
                            <strong>상태명</strong></label>
	                            <select class="form-control form-control-sm">
		                            <optgroup label="상태(이상명)">
			                            <option value="R">위험</option>
										<option value="Y">경고</option>
										<option value="G">안전</option>
		                            </optgroup>
	                            </select>
                            </div>
                        </div>
                        <!-- End: 수조명/어종/상태  input 그룹 -->
                        <div class="form-row row-cols-xl-2 d-xl-flex justify-content-xl-center">
                            <div class="col-xl-4 d-xl-flex justify-content-xl-center">
                            <label class="text-center text-sm-center text-md-center text-lg-center text-xl-center mt-1 mr-2" style="width: 300px;">
                            
                            <strong>측정일시</strong></label>
                            
	                            <input type="date" name="sensorSDate" value="<%=sensorSDate%>" style="text-align:center; width:140px; height:30px;">
	                            <span><strong>&nbsp;~&nbsp;&nbsp;</strong></span>
	                                
                                <input type="date" name="sensorEDate" value="<%=sensorEDate%>" style="text-align:center; width:140px; height:30px;">
                            </div>
                            <div class="col-xl-4 d-xl-flex justify-content-xl-center">
                            <label class="text-center text-sm-center text-md-center text-lg-center text-xl-center mt-1 mr-2" style="width: 300px;">
                            
                            <strong>처리일시</strong></label>
                           
	                            <input type="date" name="lastUptSDate" value="<%=lastUptSDate %>" style="text-align:center; width:140px; height:30px;">
	                            <span><strong>&nbsp;~&nbsp;</strong></span>
                            
                                <input type="date" name="lastUptEDate" value="<%=lastUptEDate%>"  style="text-align:center; width:140px; height:30px;">
                            </div>
                            <div class="col-xl-10 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center mt-2">
	                            <button class="btn btn-primary btn-sm mr-2 mb-1" type="button" onclick="wtSearch()">조회</button>
	                            <button class="btn btn-primary btn-sm mr-2 mb-1" type="button" onclick="wtSearchReset()">초기화</button>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!-- End: 검색부분 -->
                <!-- Start: 테이블 -->
                <div class="container" style="height: 145px;">
                    <div class="table-responsive table-bordered" style="height: 500px;">
                        <table class="table table-bordered table-sm">
                            <tbody class="shadow-sm">
                                <tr class="table-primary">
                                    <td class="text-dark" style="width: 105px;min-width: 105px;"><strong>수조이름</strong></td>
                                    <td class="text-dark" style="width: 105px;min-width: 105px;"><strong>어종</strong></td>
                                    <td class="text-dark" style="width: 110px;min-width: 110px;"><strong>측정일시</strong></td>
                                    <td class="text-dark" style="width: 180px;min-width: 180px;"><strong>상태</strong></td>
                                    <td class="text-dark" style="width: 110px;min-width: 110px;"><strong>처리일시</strong></td>
                                    <td class="text-dark" style="width: 70px;min-width: 70px;"><strong>처리자</strong></td>
                                    <td class="text-dark" style="width: 200px;min-width: 200px;"><strong>조치내용</strong></td>
                                </tr>
               
<%
				repairADto = rpdao.repairRec(indto);
				if(repairADto.isEmpty())
				{
%>    
                <tr>
					<td colspan="7"> 측정된 Data가 없습니다.</td>
				</tr>        
<%
				}
				else
				{
					for(int i=0; i<repairADto.size(); i++)
					{
						repairDTO dto = repairADto.get(i);
%>     
						<tr class="recTableMain listMouseEvent-pointer" onclick="wtCautionRepairContentsUpdate('<%=farmName%>','<%=dto.getTankId()%>',<%=dto.getRepairSeq()%>,<%=dto.getRecSeq()%>)">
							<td><%=dto.getTankId() %></td>
							<td><%=dto.getRemark() %></td>
							<td><%=dto.getSensorDate() %></td>
							<td><%=dto.getState() %><br>&nbsp;<%=dto.getYrCode() %></td>
							<td><%=dto.getLastUptdate() %></td>
							<td><%=dto.getLastUptId() %></td>
							<td><%=dto.getRepairContents() %></td>
						</tr>
<%
					} // for i 끝
				}	// if 종료
%> 

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
        <script src="../../common/func/util.js"></script>
    <script src="../../common/func/monitoring.js"></script>
    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>
</html>