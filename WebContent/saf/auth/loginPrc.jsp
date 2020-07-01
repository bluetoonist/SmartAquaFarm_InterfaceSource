<%@ page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Authentication</title>
</head>
<body>
	<%
		String login_page_id = request.getParameter("username");
		String login_page_pw = request.getParameter("password");
		
		usertableDAO user_dao = new usertableDAO();
		
		usertableDTO dto = user_dao.login_action(login_page_id, login_page_pw);

		if (dto.getUserId() == null) {
	%>
	<script type="text/javascript">
		alert("로그인에 실패했습니다")
		location.href=  "./login.jsp";
	</script>

	<%
		} else {
	%>

	<script type="text/javascript">
		alert("로그인에 성공했습니다.")
	</script>
	<%
		// setup session
		session.setAttribute("userId"	, dto.getUserId());
		session.setAttribute("userName", dto.getUserName());
		session.setAttribute("userAuth"	, dto.getUserAuth());	
		}
	%>
	<script type="text/javascript"> location.href="../main/index.jsp"</script>

</body>
</html>