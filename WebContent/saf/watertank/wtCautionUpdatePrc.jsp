<%
   /*==============================================================================
	 ■ SYSTEM				: SAF(Smart Aqua Farm) - 스마트 모니터링 시스템
	 ■ SOURCE FILE NAME		: Web/waterTank/wtCautionUpdatePrc.jsp
	 ■ DESCRIPTION			: 수조 조치기록 수정 프로시져
	 ■ COMPANY				: 목포대학교 융합소프트웨어공학과 
	 ■ PROGRAMMER			: 문인찬
	 ■ DESIGNER				: 
	 ■ PROGRAM DATE			: 2019.08.23
	 ■ EDIT HISTORY			: 
	 ■ EDIT CONTENT			: 
	==============================================================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="watertank.*"%>
<%@ page import="farm.*"%>
<%@ page import="main.*"%>
<%@ page import="repair.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
	<%
	request.setCharacterEncoding("UTF-8");
	
	repairDAO rpdao = new repairDAO();
	
	System.out.println("prc 확인");
	
	String repairSeq, recSeq, contents;
	repairSeq = request.getParameter("repairSeq");
	recSeq = request.getParameter("recSeq");
	contents = request.getParameter("repairContents");
	
	// repairContents 업데이트
	rpdao.repairContentsUpdate(repairSeq, contents);
	%>
	
<script>

function close1(){
	opener.parent.location.reload();
	window.close();
} 

</script>
</head>
<body onload="close1()">

</body>
</html>