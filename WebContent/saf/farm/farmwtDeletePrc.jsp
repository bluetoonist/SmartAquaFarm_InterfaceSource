<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : farmwtDeletePrc.jsp
    ■ DESCRIPTION           : 양식장 수조 정보 삭제 프로시져
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>

<%@ page import="java.sql.*"%>
<%@ page import="watertank.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
	//한글 패치
	request.setCharacterEncoding("UTF-8");               

	waterTankDAO cdd = new waterTankDAO();
   
	int FarmID = Integer.parseInt(request.getParameter("farmid"));
   
    //farmwtUpdateForm에서 저장한 tankid값을 요청해서 받아옴
	String tankID = request.getParameter("tankID");       

	cdd.waterTankDelete(tankID, FarmID);
   
	RequestDispatcher dispatcher = request.getRequestDispatcher("farmwtSearch.jsp");
	request.setAttribute("farmid", FarmID);
	dispatcher.forward(request,response);
%>