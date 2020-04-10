<%--
	 ■ SYSTEM				: 
	 ■ SOURCE FILE NAME		: userFarmDeletePrc.jsp
	 ■ DESCRIPTION			: 양식장 삭제 Prc
	 ■ COMPANY				: 목포대학교 융합소프트웨어공학과 
	 ■ PROGRAMMER			: 김성현
	 ■ DESIGNER				: 
	 ■ PROGRAM DATE			: 2019.08.19
	 ■ EDIT HISTORY			: 
	 ■ EDIT CONTENT			: 
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