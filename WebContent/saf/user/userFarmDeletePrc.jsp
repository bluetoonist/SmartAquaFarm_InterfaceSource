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
	/* Session  Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	// 한글 패치
	request.setCharacterEncoding("EUC-KR");

	// 전화번호, 양식장 id 가져오기
	usertableDTO dto = dao.getuser(user_id);

	String FarmID = dto.getFarmId(); // 양식장 id

	String fid = request.getParameter("FarmID");

	if (user_auth.equals("sysadmin")) {
		dao.sysdelFarm(fid);
	} else {
		dao.delFarm(fid, user_id);
	}

	response.sendRedirect("./userInfo.jsp");
%>
<script>
	location.href = "userInfo.jsp";
</script>