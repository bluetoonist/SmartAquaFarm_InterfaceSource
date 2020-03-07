<%@ page import="farm.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>스마트 양식장</title>
<link rel="stylesheet" href="../../common/css/style.css">
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		/* farmDAO 객체 생성 */
		farmDAO farmdao_obj = new farmDAO();
		ArrayList<farmDTO> farmnamelist =null;
		
		
		/* Session Infor*/
		String user_id = (String) session.getAttribute("userId");
		String user_name = (String) session.getAttribute("userName");
		String user_auth = (String) session.getAttribute("userAuth");
	
		// 쿼리스트링 farmid
		String Farmid = request.getParameter("farmid");
	
		// 정수형 양식장 ID
		int FarmID;
		
		// Farmid가 null이면 index.jsp 페이지로 이동
		if (Farmid == null) {
			
			%>
				<script>
				alert("양식장 아이디를 입력하세요");
				location.href = "../main/index.jsp";
				</script>
			<%
			
			
		// 그 밖에 Farmid는 숫자로 변환
		} else {
			FarmID = Integer.parseInt(Farmid);
		}
		
		farmnamelist = farmdao_obj.farmSelect(Farmid);
		System.out.println(farmnamelist);
		
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
				<li><a href="../main/index.jsp" onmouseover="changed_Menu(0)" data-title="모니터링">모니터링</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(1)" data-title="상태 기준 정보">상태 기준 정보</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(2)" data-title="상태기록">상태기록</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(3)" data-title="조치기록">조치기록</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(4)" data-title="통계">통계</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(5)" data-title="양식장 정보 관리">양식장 정보 관리</a></li>
				<li><a href="../farm/farmwtSearch.jsp" onmouseover="changed_Menu(6)" data-title="수조 정보">수조 정보</a></li>
				<li><a href="../auth/logoutPrc.jsp" onmouseover="changed_Menu(7)" data-title="로그 아웃">로그 아웃</a></li>
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

	<main>

		<div class="title">
			<h2>수조 정보</h2>
			<a href="javascript:void(0);">안녕하세요 <%=user_name%>님
			</a>
		</div>
		<div></div>

		<article>
		
		
			<!--  조건 검색 select box 조정 -->
			<span class="farmwtsearch_box">
            <!-- 셀렉트 박스 -->
            <h3> 전복 양식장</h3>
            <select name="search" id="search">
					<option selected value='null'>조건선택</option>
					<option value='tankid'>수조 번호</option>
					<option value='lastuptdate'>수정 일시</option>
					<option value='lastuptid'>수정자</option>
					<option value='userid'>담당자</option>
            </select>
            <input type="text" id="search_input" autofocus/>
            <input type="submit" id="search_click" value="검색"/> 
            
            </span>
			
		
		
		
			<!-- 수조 정보  -->
			<div class="table_frame">
				<table id="table_layout">

					<thead>
						<tr>
							<th rowspan=2>수조 번호</th>
							<th rowspan=2>수정 일시</th>
							<th rowspan=2>수정자</th>
							<th rowspan=2>어종</th>
							<th rowspan=2>담당자</th>
							<th></th>
							<th colspan=3>-장비명-</th>
							<th></th>
							<th></th>
						</tr>

						<tr>
							<th colspan=1>DO</th>
							<th colspan=1>PH</th>
							<th colspan=1>염도</th>
							<th colspan=1>수온</th>
							<th colspan=1>NH4</th>
							<th colspan=1>NO2</th>
						</tr>

					</thead>
					<!--  페이징 처리 부 -->
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>

							<td colspan=1>$320,800</td>
							<td colspan=1>PH</td>
							<td colspan=1>염도</td>

							<td>수온</td>
							<td>NH4</td>
							<td>NO2</td>
						</tr>


					</tbody>
				</table>
			</div>
		</article>
	</main>

	<!-- partial -->
	<script src="../../common/Js/script.js"></script>

</body>

</html>