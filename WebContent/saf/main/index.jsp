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
<html lang="en">

<head>
<meta charset="UTF-8">
<title>스마트 양식장</title>
<link rel="stylesheet" href="../../common/css/style.css">

</head>


<body>
	<%
		/* Session  Configuration */
		String user_id = (String) session.getAttribute("userId");
		String user_name = (String) session.getAttribute("userName");
		String user_auth = (String) session.getAttribute("userAuth");
	%>

	<!-- partial:index.partial.html -->
	<span class="bckg"></span>
	<header>
		<h1>Smart Aqua Farm</h1>
		<!-- (왼쪽) 네비게이션 메뉴 -->
		<!--  기능 추가 사항을 위해 권한별로 나누어 놓음 -->
		<!--  '전체 관리자' 일 때 메뉴  -->
		<nav>
			<%
				if (user_auth.equals("sysadmin")) {
			%>
			<ul>
				<li><a href="../main/index.jsp" onmouseover="changed_Menu(0)" data-title="모니터링">모니터링</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(1)" data-title="상태 기준 정보">상태 기준 정보</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(2)" data-title="상태기록">상태기록</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(3)" data-title="조치기록">조치기록</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(4)" data-title="통계">통계</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(5)" data-title="양식장 정보 관리">양식장 정보 관리</a></li>
				<li><a href="../farm/farmwtSearch.jsp" onmouseover="changed_Menu(6)" data-title="수조 정보">수조 정보</a></li>
				<li><a href="../auth/logoutPrc.jsp" onmouseover="changed_Menu(7)" data-title="로그 아웃">로그 아웃</a></li>
			</ul>
			<!--  '일반 관리자' 일 때 메뉴  -->
			<%
				} else if (user_auth.equals("admin")) {
			%>
			<ul>
				<li><a href="../main/index.jsp" data-title="모니터링">모니터링</a></li>
				<li><a href="javascript:void(0);" data-title="상태 기준 정보">상태 기준 정보</a></li>
				<li><a href="javascript:void(0);" data-title="상태기록">상태기록</a></li>
				<li><a href="javascript:void(0);" data-title="조치기록">조치기록</a></li>
				<li><a href="javascript:void(0);" data-title="통계">통계</a></li>
				<li><a href="javascript:void(0);" data-title="양식장 정보 관리">양식장 정보 관리</a></li>
				<li><a href="../farm/farmwtSearch.jsp" data-title="수조 정보">수조 정보</a></li>
				<li><a href="../auth/logoutPrc.jsp" data-title="로그 아웃">로그 아웃</a></li>
			</ul>
			<!--  '사용자' 일 때 메뉴  -->
			<%
				} else {
			%>

			<ul>
				<li><a href="../main/index.jsp" onmouserover="changed_Menu()" data-title="모니터링">모니터링</a></li>
				<li><a href="javascript:void(0);" data-title="상태 기준 정보">상태 기준 정보</a></li>
				<li><a href="javascript:void(0);" data-title="상태기록">상태기록</a></li>
				<li><a href="javascript:void(0);" data-title="조치기록">조치기록</a></li>
				<li><a href="javascript:void(0);" data-title="통계">통계</a></li>
				<li><a href="javascript:void(0);" data-title="양식장 정보">양식장 정보</a></li>
				<li><a href="../farm/farmwtSearch.jsp" data-title="수조 정보">수조 정보</a></li>
				<li><a href="../auth/logoutPrc.jsp" data-title="로그 아웃">로그 아웃</a></li>
			</ul>
			<%
				}
			%>

		</nav>
	</header>

	<main> <!-- 수조 상태를 나타낼 화면 -->
	<div class="title">
		<h2>모니터링</h2>
		<a onclick="MoveMyPage()">안녕하세요 <%=user_name%>님
		</a>


	</div>
	<div></div>

	<article>

		<div class="wrapper">
			<!-- PRICING-TABLE CONTAINER -->
			<div class="pricing-table group">
				<h1 class="heading">양식장 수조 현황</h1>
			</div>

			<div class="wrapper_monitor_layout">
				<%
					if (user_auth.equals("sysadmin")) {
				%>

				<div class="selectBox_">
					선택하세요 :
					<select class="selectView" id="selectAdmin" onchange="goSelectedAdmin()">

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

					<select class="selectView" id='selectFarm' onchange="goSelectedFarm()">
						<option value="0">양식장을 선택하세요</option>
					</select>


				</div>
				<%
					} else if (user_auth.equals("admin")) {
				%>
				<div class="selectBox_">
					양식장을 선택하세요 :

					<select class="selectView" id='selectFarm' onchange="goSelectedFarm()">
						<%	String Farm_id = null;
							String Farm_name = null;
							ArrayList<farmDTO> bean_ = new ArrayList<farmDTO>();
							bean_ = farm_dao.getuserData(null, user_id);

								for (int i = 0; i < bean_.size(); i++) {
									Farm_id = Integer.toString(bean_.get(i).getFarmId());
									Farm_name = bean_.get(i).getFarmName();
						%>
						<option value=<%=Farm_id%>>
							<%=Farm_name%>
						</option>
						<%
						
							}
						%>

					</select>

				</div>


				<%
					} else if (user_auth.equals("user")) {
						ArrayList<farmDTO> bean_ = new ArrayList<farmDTO>();
						bean_ = farm_dao.getuserData(null, user_id);

						for (int i = 0; i < bean_.size(); i++) {
							String Farm_id = Integer.toString(bean_.get(i).getFarmId());
							String Farm_name = bean_.get(i).getFarmName();
				%>

				<div class="selectBox_">
					양식장 이름 :
					<%=Farm_name%><br>
					<div>

						<%
							}
							}
						%>

					</div>
				</div>

				<div class="watertank_moniter_view " id="watertank_layout_grid">
					<!--  ===================== Example 01 ====================================== -->
		
					<!--  =========================================================== -->

				</div>


				<!-- End Wrapper Class  -->
	</article>
	</main>

	<!-- partial -->
	<script src="../../common/Js/script.js"></script>

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

				for (i = search_farm.length - 1; i >= 1; i--) {
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
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
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
				
				console.log(check_wt_number);
				if (check_wt_number == 0) {
					var deleteValue = creDiv.getElementsByClassName("watertank_layout").length
 					
					for(i=deleteValue-1; i>=0 ; i--) {
						creDiv.getElementsByClassName("watertank_layout")[i].remove();
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
						console.log(watertank_state_signal);
						var html = "";
						html += " <div class=\'watertank_layout\'>";
						
						html += " <div class=\'left\'>"; // left Frame  
							html += "<div class=\"left_label\">";
								if(watertank_state == "G") {
									html += " &nbsp;<img src=\"../../common/image/icon/alarm_green.png\" width=\"12px\" height=\"12px\">" +watertank_state +":"+watertank_state_signal;	
								}else if(watertank_state == "Y") {
										html += " &nbsp;<img src=\"../../common/image/icon/alarm_yellow.png\" width=\"12px\" height=\"12px\">"+watertank_state +":"+watertank_state_signal;
								}else {
									html += " &nbsp;<img src=\"../../common/image/icon/alarm_red.png\" width=\"12px\" height=\"12px\">"+watertank_state +":"+watertank_state_signal;
								}
								
							html += " </div>";
							
								if(watertank_state == "G") {
									html += "<div class=\"left_below\" style=\"background-image: linear-gradient(to top, green 35%, transparent 40%);\">";
								}else if(watertank_state =="Y") {
									html += "<div class=\"left_below\" style=\"background-image: linear-gradient(to top, yellow 35%, transparent 40%);\">";
								} else {
									html += "<div class=\"left_below\" style=\"background-image: linear-gradient(to top, red 35%, transparent 40%);\">";
								}
							
								html += "<br> <br> <br> <br> <br> <img src=\"../../common/image/bowl.png\">";
							html += "</div>";
						html += "</div>"; // End Left Frame
						
						html += "<div class=\"right\">"; // right Frame;
						
							html += "<div class=\"right_label\">";
								html += "<form>";
									html += "수조 번호 : "+watertank_number +" <input type=\"button\" value=\"조치\" />";
								html += "</form>";
							html += "</div>";
							
							html += "<div class=\"right_below\">";
							
								html += "<br>";
								html += "<br>&nbsp; 물고기종 : "+fish_category;
								html += "<br>&nbsp; DO : "+watertank_do;
								html += "<br>&nbsp; 수온 : "+watertank_wtrec;
								html += "<br>&nbsp; PH : "+watertank_phrec;
								html += "<br>&nbsp; 암모니아 : "+watertank_nh4rec;
								html += "<br>&nbsp; 아질산 : "+watertank_no2rec;
						
						html += "</div>"; // End Right Frame
							
							
						html += " </div>"//  End class watertank_layout;
						
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
		console.log(get_farm_id);
	}// End goSelectedFarm

</script>


</html>