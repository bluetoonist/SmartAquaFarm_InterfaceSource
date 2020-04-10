<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : userUpdatePrc.jsp
    ■ DESCRIPTION           : 회원정보 수정 프로시저
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
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

	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	String flag = request.getParameter("flag");
	
	System.out.println(flag);
	
	if(flag.equals("Password")){
		user_dto.setUserPw(request.getParameter("userPW"));
		user_dto.setUserId(user_id);
		user_dao.updatePw(user_dto);
	}else if(flag.equals("nametel")){
	user_dto.setUserName(request.getParameter("username"));
	user_dto.setUserTel(request.getParameter("usertel"));
	user_dto.setUserId(user_id);
	user_dao.updateMember(user_dto);
	}
	
	String msg = "수정이 완료되었습니다."; //입력 된거 확인시키려고

%>

<script language="javascript">
	alert("<%=msg%>");
	location.href = "./userInfo.jsp";
</script>