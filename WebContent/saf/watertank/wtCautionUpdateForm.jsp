<%
   /*==============================================================================
	 ■ SYSTEM				: SAF(Smart Aqua Farm) - 스마트 모니터링 시스템
	 ■ SOURCE FILE NAME		: Web/waterTank/wtCautionUpdateForm.jsp
	 ■ DESCRIPTION			: 수조 조치기록 수정 팝업창
	 ■ COMPANY				: 목포대학교 융합소프트웨어공학과 
	 ■ PROGRAMMER			: 문인찬
	 ■ DESIGNER				: 
	 ■ PROGRAM DATE			: 2019.08.23
	 ■ EDIT HISTORY			: 
	 ■ EDIT CONTENT			: 
	==============================================================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="watertank.*"%>
<%@ page import="farm.*"%>
<%@ page import="main.*"%>
<%@ page import="repair.*"%>
<%
request.setCharacterEncoding("UTF-8");

farmDAO fmdao = new farmDAO();
repairDAO rpdao = new repairDAO();
StringUtil strUtil = new StringUtil();

// 클릭한 리스트 데이터 받아오는 용도
String farmName = strUtil.nullToBlank(request.getParameter("farmName"));
String tankID = strUtil.nullToBlank(request.getParameter("tankID"));
String repairSeq = strUtil.nullToBlank(request.getParameter("rp_s"));
String recSeq = strUtil.nullToBlank(request.getParameter("rc_s"));

System.out.println("r : "+repairSeq);
System.out.println("r : "+recSeq);

//repaircontents 입력되어 있던 내용 출력
String contents = rpdao.getRepairContents(Integer.parseInt(repairSeq),Integer.parseInt(recSeq));

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>스마트 모니터링 시스템</title>
<!-------------------   CSS INCLUDE ------------------------->
<link rel="stylesheet" href="../include/css/common.css">
<link rel="stylesheet" href="../common/jqm-button/icon.css" />

<!-------------------   JS INCLUDE ------------------------->
<script src="../common/jquery/jquery-2.2.4.js"></script>
<script src="../common/main.js"></script>

<script>
//wtCautionUpdateForm.jsp에 쓰이는 repair 테이블 repaircontents 업데이트용 함수
//************************************************************************ END LINE
function repairContentsUpdate(){
  var frm = document.updateForm;
	frm.target = "_self";
	frm.method = "post";
	frm.action = "wtCautionUpdatePrc.jsp";
	frm.submit();  

	console("up1");
	//updateForm.action = "wtCautionUpdatePrc.jsp";
	//updateForm.submit();
	opener.location.reload();
	console("up2");
	self.close();
	console("up3");
}

//************************************************************************* START LINE
</script>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=a0c69c2ee60d5a7f34c321b94a34e501">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=06ed58a0080308e1635633c2fd9a56a3">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=06ed58a0080308e1635633c2fd9a56a3">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=50a8e9fe65cba9461984a61467997ba4">
</head>

</head>
<body id="page-top">

    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div class="text-center" id="content">
                <!-- Start: 양식장이름 -->
                <div class="container-fluid">
                    <h2 class="text-center text-dark mt-5"><strong><%=farmName %> - <%=tankID %></strong></h2>
                </div>
                <!-- End: 양식장이름 -->
                
                <form name="updateForm">
                <input type="hidden" name="repairSeq" value="<%=repairSeq%>">
                <input type="hidden" name="recSeq" value="<%=recSeq%>">
	                <!-- Start: 취소/등록버튼 -->
	                <div class="container-fluid text-center mt-4 mb-4">
	                <button class="btn btn-primary btn-sm mr-2" type="button" onclick="repairContentsUpdate()" >수정</button>
	                <a class="btn btn-dark btn-sm" role="button" onclick="self.close()">취소</a></div>
	                <!-- End: 취소/등록버튼 -->
	                <!-- Start: 조치사항입력 타이틀 -->
	                <div class="container-fluid">
	                    <h4 class="text-center"><strong>조치사항 수정</strong></h4>
	                </div>
	                <!-- End: 조치사항입력 타이틀 -->
	               	
	                <!-- Start: 조치사항 입력부분 -->
	                <div class="container-fluid">
	                <textarea rows="8" cols="40" name="repairContents"><%= contents %></textarea></div>
	                <!-- End: 조치사항 입력부분 -->
		            </div>
	            </form>
	            
	            <footer class="bg-white d-xl-flex align-items-xl-end sticky-footer">
	                <div class="container my-auto">
	                    <div class="text-center my-auto copyright"><span>Copyright © Mokpo National University&nbsp; 2020</span></div>
	                </div>
	            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>
</html>