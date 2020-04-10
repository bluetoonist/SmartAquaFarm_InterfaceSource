<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : userFarmDeletePrc.jsp
    ■ DESCRIPTION           : 사용자의 양식장 삭제 프로시져
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="farm.*"%>

<jsp:useBean id="dao" class="user.usertableDAO" />

<%
	request.setCharacterEncoding("UTF-8");

	/* Session  Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	String farmID = request.getParameter("farmId");
	String farmName = request.getParameter("farmName");

	
	
	
	
	// 전화번호, 양식장 id 가져오기
	usertableDTO dto = dao.getuser(user_id);

	String FarmID = dto.getFarmId(); // 양식장 id


	if (user_auth.equals("sysadmin")) {
		dao.sysdelFarm(farmID);
	} else {
		dao.delFarm(farmID, user_id);
	} 

	response.sendRedirect("./userInfo.jsp");
%>
<script>
	location.href = "userInfo.jsp";
</script>