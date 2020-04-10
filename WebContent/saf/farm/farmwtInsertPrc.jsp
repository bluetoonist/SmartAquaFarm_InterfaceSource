<%--
    ■ SYSTEM                : 스마트 양식장 인터페이스
    ■ SOURCE FILE NAME      : farmwtInsertPrc.jsp
    ■ DESCRIPTION           : 양식장 수조 정보 등록 프로시져
    ■ COMPANY               : 목포대학교 분산멀티미디어 연구실, 목포대학교  카시오 연구실    
    ■ PROGRAM DATE          : 2020.03.27
    ■ EDIT HISTORY          : 2020.04.11    
--%>
   
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<jsp:useBean id="wtdao" class="watertank.waterTankDAO" />
<jsp:useBean id="wtdto" class="watertank.waterTankDTO" />

<%
	request.setCharacterEncoding("UTF-8");

	/* Session Configuration */
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");
   
	//fishname 받아오기
	String fishName= request.getParameter("selectFish");
   
	//farm 객체에 값 저장
	String FarmID = request.getParameter("farmid");
	String ID = request.getParameter("ID");
	
	wtdto.setTankId(request.getParameter("tankid"));
	wtdto.setDoSensor(request.getParameter("dosensor"));
	wtdto.setPhSensor(request.getParameter("phsensor"));
	wtdto.setPsuSensor(request.getParameter("psusensor"));
	wtdto.setWtSensor(request.getParameter("wtsensor"));
	wtdto.setNh4Sensor(request.getParameter("nh4sensor"));
	wtdto.setNo2Sensor(request.getParameter("no2sensor"));
	wtdto.setRegId(request.getParameter("ID"));
   
	wtdao.waterTankInsert(wtdto, fishName, ID, FarmID, user_id);
		
	RequestDispatcher dispatcher = request.getRequestDispatcher("farmwtSearch.jsp");
	request.setAttribute("farmid", FarmID);
	dispatcher.forward(request,response);
	
%>