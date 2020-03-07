<%--
	■ SYSTEM				: 
	■ SOURCE FILE NAME		: userUpdatePrc.jsp
	■ DESCRIPTION			: 사용자 정보 수정 Prc
	■ COMPANY				: 목포대학교 융합소프트웨어공학과 
	■ PROGRAMMER			: 김성현 
	■ DESIGNER				: 
	■ PROGRAM DATE			: 2019.08.19
	■ EDIT HISTORY			: 
	■ EDIT CONTENT			: 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="farm_dao" class="farm.farmDAO" />
<jsp:useBean id="farm_dto" class="farm.farmDTO" />

<jsp:useBean id="user_dao" class="user.usertableDAO" />
<jsp:useBean id="user_dto" class="user.usertableDTO" />

<%
	request.setCharacterEncoding("UTF-8");

	/* Session  Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
	
	user_dto.setUserPw(request.getParameter("userPW"));
	user_dto.setUserName(request.getParameter("name"));
	user_dto.setUserTel(request.getParameter("usertel"));
	user_dto.setUserAuth(user_auth);
	user_dto.setUserId(request.getParameter("id"));
	
	user_dao.updateMember(user_dto);
	
	String msg = "수정이 완료되었습니다."; //입력 된거 확인시키려고

%>

<script language="javascript">
	alert("<%=msg%>");
	location.href = "./userInfo.jsp";
</script>