<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : userInsertPrc.jsp
    ■ DESCRIPTION           : 사용자 등록 프로시져
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	// 객체화
	usertableDTO bean = new usertableDTO();
	
	bean.setUserId(request.getParameter("userID"));	// 사용자 ID
	bean.setUserPw(request.getParameter("userPW"));	// 사용자 pw
	bean.setUserName(request.getParameter("userName"));	// 사용자 이름
	bean.setUserTel(request.getParameter("usertel"));	// 사용자 번호
	bean.setUserAuth(request.getParameter("userAuth"));	// 사용자 권한
	bean.setFarmId(request.getParameter("FarmID"));	// 양식장 이름
	bean.setRegId(user_name);							// 등록자 이름
	
	String msg = "가입이 완료되었습니다.";
	
	usertableDAO doa = new usertableDAO();
	doa.userInsert(bean);
	
	response.sendRedirect("./userManagement.jsp");
%>

<script language="javascript">
	alert("<%=msg%>");
</script>
