<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : farmwtUpdatePrc.jsp
    ■ DESCRIPTION           : 양식장 수조 정보 업데이트 프로시져
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>
<%@ page import="watertank.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//한글패치
	request.setCharacterEncoding("UTF-8");
	ServletContext context = this.getServletContext();

	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
	
	//앞에서 받아온 값들
	String tankID = request.getParameter("tankID");
	
	int FarmID = Integer.parseInt(request.getParameter("farmid"));
	String fishName = request.getParameter("selectFish");
	String userID = request.getParameter("userid");
	String DOSensor = request.getParameter("dosensor");
	String pHSensor = request.getParameter("phsensor");
	String psuSensor = request.getParameter("psusensor");
	String WTSensor = request.getParameter("wtsensor");
	String NH4Sensor = request.getParameter("nh4sensor");
	String NO2Sensor = request.getParameter("no2sensor");
		
	waterTankDAO mgr = new waterTankDAO();
	
	// Session_ID 에 빨간줄이여도 신경 쓰지 말것?
	//수조 정보 수정 메소드 사용
	int finish = mgr.waterTankUpdate(tankID, fishName, userID, DOSensor, pHSensor,
			psuSensor, WTSensor, NH4Sensor, NO2Sensor, user_id, FarmID);
	
	
	request.setAttribute("farmid", FarmID);
	RequestDispatcher dispatcher = request.getRequestDispatcher("farmwtSearch.jsp");
	dispatcher.forward(request, response);
	
%>