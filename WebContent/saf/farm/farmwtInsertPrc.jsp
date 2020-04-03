<%--
	■ SYSTEM                : SAF 양식장
    ■ SOURCE FILE NAME      : farmwtInsertPrc.jsp
    ■ DESCRIPTION           : 양식장 정보 등록(farmwtInsertForm.jsp에서 넘어옴)
    ■ COMPANY               : 목포대학교 융합소프트웨어학과 
    ■ PROGRAMMER            : 김수아
    ■ DESIGNER              : 
    ■ PROGRAM DATE          : 2019.08.
    ■ EDIT HISTORY          : 2019.08.18
    ■ EDIT CONTENT          : 2019.08.18
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>>   
<%@ page import="watertank.waterTankDTO"%>
<%@ page import="farm.farmDTO"%>
<%@ page import="growInfo.growInfoDTO"%>

<jsp:useBean id="wt" class="watertank.waterTankDTO" />
<jsp:useBean id="wtdao" class="watertank.waterTankDAO" />
<jsp:useBean id="fish" class="growInfo.growInfoDTO" />
<%
	request.setCharacterEncoding("UTF-8");
	ServletContext context = this.getServletContext();

	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	//객체화
	waterTankDTO bean = new waterTankDTO();
   
	//fishname 받아오기
	String fishName= request.getParameter("selectFish");
   
	//farm 객체에 값 저장
	String FarmID = request.getParameter("farmid");
	String ID = request.getParameter("ID");
	bean.setTankId(request.getParameter("tankid"));
	bean.setDoSensor(request.getParameter("dosensor"));
	bean.setPhSensor(request.getParameter("phsensor"));
	bean.setPsuSensor(request.getParameter("psusensor"));
	bean.setWtSensor(request.getParameter("wtsensor"));
	bean.setNh4Sensor(request.getParameter("nh4sensor"));
	bean.setNo2Sensor(request.getParameter("no2sensor"));
	bean.setRegId(request.getParameter("ID"));
   
	System.out.println("!!----------------");
	System.out.println(FarmID);
	System.out.println(ID);
	System.out.println("!!----------------");
	String msg = "등록 완료";
   
	wtdao.waterTankInsert(bean, fishName, ID, FarmID, user_id);
	
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("farmwtSearch.jsp");
	request.setAttribute("farmid", FarmID);
	dispatcher.forward(request,response);
	
%>