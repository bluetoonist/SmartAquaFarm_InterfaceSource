<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LOGOUT</title>
</head>
<body>
	<% session.invalidate(); %>
	<script type="text/javascript">
		
		alert("�α׾ƿ� �մϴ�.")
		location.href="./login.jsp";
	</script>
</body>
</html>