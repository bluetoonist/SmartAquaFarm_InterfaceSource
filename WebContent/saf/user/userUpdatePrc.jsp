<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : userUpdatePrc.jsp
    ■ DESCRIPTION           : 회원정보 수정 프로시저 - 사용 페이지 (userInfo.jsp, userUpdateForm.jsp)
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
	// 수정할 ID
	String userid = request.getParameter("userid");
	String tel = request.getParameter("usertel");
	
	if(flag.equals("Password")){		// 자기 비밀번호 수정
		user_dto.setUserPw(request.getParameter("userPW"));
		user_dto.setUserId(user_id);
		user_dao.updatePw(user_dto);
	}else if(flag.equals("nametel")){		// 자기 정보 수정
		user_dto.setUserName(request.getParameter("username"));
		user_dto.setUserTel(request.getParameter("usertel"));
		user_dto.setUserId(user_id);
		user_dao.updateMember(user_dto);
	}else if(flag.equals("updateData")){	// 사용자 데이터 수정
		user_dto.setUserName(request.getParameter("username"));
		user_dto.setUserTel(request.getParameter("usertel"));
		user_dto.setUserId(request.getParameter("userid"));
		user_dao.updateMember(user_dto);
	}else if(flag.equals("UpdatePW")){		// 사용자 비번 바꾸기
		user_dto.setUserPw(request.getParameter("userPW"));
		user_dto.setUserId(request.getParameter("userid"));
		user_dao.updatePw(user_dto);
	}else if(flag.equals("userDelete")){	// 사용자 삭제
		String userID = request.getParameter("userid");
		String userAuth = request.getParameter("auth");
		String FarmID = request.getParameter("FarmID");	
		System.out.println("userID : "+userID);
		System.out.println("userAuth : "+userAuth);
		System.out.println("FarmID : "+FarmID);
		user_dao.usertableDelete(userID);
	}
	
	String msg = "수정이 완료되었습니다."; //입력 된거 확인시키려고

%>

<script language="javascript">
	
	function goUpdate(){

		var frm = document.update;
		var flag = frm.flag.value;
		
		if((flag == "updateData") || (flag == "UpdatePW")){
			frm.target="_self";
			frm.method="post";
			frm.action="userUpdateForm.jsp";
			frm.submit();
		}else if((flag == "userDelete")){
			frm.target="_self";
			frm.method="post";
			frm.action="userManagement.jsp";
			frm.submit();
		}else{
			frm.target="_self";
			frm.method="post";
			frm.action="userInfo.jsp";
			frm.submit();
		}
		
	}
</script>
<body onload="goUpdate();">
	<form name="update">
		<input type="hidden" name="flag" value="<%=flag%>">
		<input type="hidden" name="userid" value="<%=userid%>">
	</form>
</body>