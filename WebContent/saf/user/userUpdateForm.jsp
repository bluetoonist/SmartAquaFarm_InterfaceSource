<%--
	■ SYSTEM				: 
	■ SOURCE FILE NAME		: userUpdateForm.jsp
	■ DESCRIPTION			: 사용자 정보 수정  Form
	■ COMPANY				: 목포대학교 융합소프트웨어공학과 
	■ PROGRAMMER			: 김성현 
	■ DESIGNER				: 
	■ PROGRAM DATE			: 2019.08.30
	■ EDIT HISTORY			: 
	■ EDIT CONTENT			: 
--%>
<%-- CLASS DECLARE --%>

<%@ page import="farm.farmDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.Stream"%>

<%@ page import="farm.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="farm_dao" class="farm.farmDAO" />
<jsp:useBean id="farm_dto" class="farm.farmDTO" />

<jsp:useBean id="user_dao" class="user.usertableDAO" />
<jsp:useBean id="user_dto" class="user.usertableDTO" />

<%-- 전화번호, 양식장 id 가져오기 --%>

<%
	/* Session  Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
	
	user_dto = user_dao.getuser(user_id);
	
	String tel = user_dto.getUserTel(); // 전화번호
	String FarmID = user_dto.getFarmId(); // 양식장 id

	ArrayList<farmDTO> fm_dto = farm_dao.getuserData(FarmID,user_id);

	String farmname = farm_dto.getFarmName();
	String address = farm_dto.getAddress();
	// 사용자 소속양식장 추가 배열
	//ArrayList userlist = dao.
%>
<script>

	function goDelete(Auth, Name, FarmID) {
		var del = document.userUpdateForm;
		if(confirm(Name+" 를 삭제하시겠습니까?")){
			del.method = "post";
			del.action = "userDeletePrc.jsp";
			del.target = "_self";
			del.submit();
		}		
	} 
	
	function checkValueUpdate(){
		var form = document.userUpdateForm;
		if(!form.userPW.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(!form.userPWChk.value){
			alert("비밀번호확인을 입력하세요");
			return false;
		}
		if(form.userPW.value != form.userPWChk.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
	
		if(confirm("사용자 정보를 변경하시겠습니까?")){
			form.method="post";
			form.action="userUpdatePrc.jsp";
			form.submit();
		}else{
			return false;
		}
	}

</script>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>스마트 양식장</title>
<link rel="stylesheet" href="../../common/css/style.css">
</head>

<body>

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
		<h2>사용자 정보 수정</h2>
		<a onclick="MoveMyPage()">안녕하세요 <%=user_name%>님 </a>
	</div>
	<div></div>

	

		

	<article>
	
		<!-- PRICING-TABLE CONTAINER -->
		<div class="pricing-table group">
			<h1 class="heading">사용자 정보 수정</h1>
		</div>
	
		<div class=user_update_form>
			<form class=userUpdateForm name="userUpdateForm">
				<input type="button" class="button" value="삭제" onclick="goDelete(); return false;"/>
				<input type="button" class="button" value="수정" onclick="checkValueUpdate(); return false;"/>
				<input type="button" class="button" value="취소" onclick="location.href='../main/index.jsp'"/>
				<br>
				<br>
				<!-- Start FormBox -->
				<span class=formBox1>
					<div class=up_text>ID</div> 
				<br>
				<hr>
					<div class=down_text><input type="text" style="float:left; width:99%;" name="id" readonly value="<%= user_id %>" /></div>
				</span>
				<!-- End FormBox -->
				<br>
				<br>
				<br>	
				<br>
				<!-- Start FormBox -->
				<span class=formBox1>
					<div class=up_text>비밀번호</div>
				<br>
				<hr>
					<div class=down_text><input type="password" name="userPW" maxlength="20" style="float:left; width:99%;" placeholder="비밀번호를 입력하세요."/></div>
				</span>
				<!-- End FormBox -->
				<br>
				<br>
				<br>
				<br>
				<!-- Start FormBox -->
				<span class=formBox1>
					<div class=up_text>비밀번호 확인</div>
				<br>
				<hr>
					<div class=down_text><input type="password" name="userPWChk" maxlength="20" style="float:left; width:99%;" placeholder="비밀번호 확인을 입력하세요."/></div>
				</span>
				<!-- End FormBox -->
				<br>
				<br>
				<br>
				<br>
				<!-- Start FormBox -->
				<span class=formBox1>
					<div class=up_text>이름</div>
				<br>
				<hr>
					<div class=down_text><input type="text" name="name" style="float:left; width:99%;" value="<%=user_name%>" maxlength="20" /></div>
				</span>
				<!-- End FormBox -->
				<br>
				<br>
				<br>
				<br>
				<!-- Start FormBox -->
				<span class=formBox1>
					<div class=up_text>연락처</div>
				<br>
				<hr>
					<div class=down_text><input type="text" name="usertel" maxlength="13" value="<%= tel %>"
					 style="float:left; width:99%;" onkeypress="OnlyNumber()" /></div>
				</span>
				<!-- End FormBox -->
				<br>
				<br>
				<br>
				<br>
				<!-- Start FormBox -->
				<span class=formBox1>
					<div class=up_text>직책</div>
				<br>
				<hr>
					<div class=down_text><%= user_auth %></div>
				</span>
				<!-- End FormBox -->
		</form>
		</div>
	</article>
	</main>
	</form>

</body>
</html>