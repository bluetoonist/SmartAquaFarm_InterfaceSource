<%@ page import="java.util.*"%>

<%@ page import="farm.farmDTO"%>
<%@ page import="farm.farmDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	/* Session  Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

    
    /* Search FarmID , FarmName*/
	ArrayList<farmDTO> f_dto = new ArrayList<farmDTO>();
	farmDAO f_dao = new farmDAO();
    
    /* get FarmID , FarmName*/
	f_dto = f_dao.getFarm(user_auth, "21");
    
    
    
%>


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
<script>
var xhr = new XMLHttpRequest();
var temp;
function changedFarmValue(){
	var select_farmIndex = document.getElementsByClassName("mr-2");			
	_farmIndex = select_farmIndex[4].selectedIndex;
	
	farmID = select_farmIndex[4][_farmIndex].value;
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				var JsonObj = eval( "(" + xhr.responseText + ")" );
				
					
				var obj = document.getElementsByClassName("mr-2")
				insert_fish_data = obj[5].getElementsByTagName("optgroup")
				
				remove_number = insert_fish_data[0].getElementsByTagName("option").length;

				for(i=remove_number-1; i>=0 ; i--) {
					insert_fish_data[0].getElementsByTagName("option")[i].remove()

				}
				
				for(i=0; i< JsonObj.result.length; i++) {
					var fish_group_code = JsonObj.result[i][0].fish_group_code;
					var fish_name = JsonObj.result[i][1].fish_name;
										
					insert_option_string  = "<option value="+fish_group_code+">"+fish_name+"</option>"				
					insert_fish_data[0].insertAdjacentHTML("beforeend",insert_option_string);
					
				}
			}
		}
	
	xhr.open("Post", "../../fishIDResponse", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("farm_id=" + farmID);
			
}
	
	
</script>


</head>


<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198, 43, 43);">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-fish"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">
                        <span class="text-monospace">SMART AQUA FARM</span>
                    </div>
                </a>
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
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid">
                        <button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button">
                            <i class="fas fa-bars"></i>
                        </button>
                        <h3 class="text-dark mb-0 navbar-brand">
                            <strong>양식장 정보 관리</strong>
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
                            <li class="nav-item dropdown no-arrow" role="presentation">
                                <div class="nav-item dropdown no-arrow">
                                    <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
                                        <span class="d-none d-lg-inline mr-2 text-gray-600 small">sysadmin</span>
                                        <img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.jpeg?h=0ecc82101fb9a10ca459432faa8c0656">
                                    </a>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
                                        <a class="dropdown-item" role="presentation" href="#">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" role="presentation" href="#">
                                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃
                                        </a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid text-center">
                    <header></header>
                    <span class="text-dark mr-2"><strong>양식장 선택</strong></span>

                    <!--  양식장 선택 -->
                    <select class="mr-2" onchange="changedFarmValue()">
                        <optgroup label="양식장">
                            <%                           
                            	for (int i = 0; i < f_dto.size(); i++) {
                            	   int farm_id = f_dto.get(i).getFarmId();
                            	   String farm_name = f_dto.get(i).getFarmName(); 	
                            	   %>
                                <option value="<%=farm_id%>"><%=farm_name %></option>		
                                    <%
                            	}
                            %>
                        </optgroup>
                    </select>
                    <!--  End Line -->
                    <!--  어종 선택  -->
                    <select class="mr-2" >
                        <optgroup label="어종 선택">
                            <option value="12" selected="">넙치</option>
                            <option value="13">광어</option>
                            <option value="14">우럭</option>
                        </optgroup>
                    </select>
                    <!-- End Line -->

                    <button class="btn btn-primary btn-sm" type="button" style="margin-bottom: 5px;">추가</button>
                </div>
                <div class="container-fluid">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>양식장 이름</th>
                                    <th>양식 어종 정보명</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Cell 1</td>
                                    <td>Cell 2</td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <footer class="bg-white d-xl-flex align-items-xl-end sticky-footer">
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
    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>

</html>