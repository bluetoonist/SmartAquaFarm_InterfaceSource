<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="farm.*"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<%	
	request.setCharacterEncoding("UTF-8");

	/* Session Infor*/
	String user_id = (String) session.getAttribute("userId");
	String user_name = (String) session.getAttribute("userName");
	String user_auth = (String) session.getAttribute("userAuth");

	usertableDAO cdd = new usertableDAO();

	String searchuser = request.getParameter("searchuser");				//검색 조건 값
	String searchuserinput = request.getParameter("searchuserinput");	//검색창 값
	String FarmID = request.getParameter("FarmID");
	
	System.out.println(searchuser);
	System.out.println(searchuserinput);
	System.out.println(FarmID);
	
	ArrayList<usertableDTO> userlist = cdd.usertableSearch(FarmID, searchuser, searchuserinput);
%>
<script>
//farmwtUserForm_in.jsp에서 조회 버튼 클릭시 검색조건 또는 검색창이 null일 경우 경고창
//************************************************************************ START LINE
function searchuserCheck_in(){								//검색 버튼 선택시 실행되는 기능
	if(farmUser.searchuserinput.value == '' && farmUser.searchuser.value == 'null') {
		alert("조건 선택 및 검색 단어를 입력하세요.");
		farmUser.target = "_self"; 							//새창이 열리지않고 현재창이 바뀜
		farmUser.method = "post";
      farmUser.searchuserinput.focus();				//Enter 눌러도 넘어감
      return;
	}
	else if(farmUser.searchuserinput.value == '' && farmUser.searchuser.value != 'null') {			//검색창 값이 null일 경우
		alert("검색 단어를 입력하세요.");
						//새창이 열리지않고 현재창이 바뀜
		farmUser.method = "post";
      farmUser.searchuserinput.focus();				//Enter 눌러도 넘어감
      return;
  }
  else if(farmUser.searchuser.value == 'null' && farmUser.searchuserinput.value != ''){			//검색조건이 선택되지 않았을(null) 경우
  	alert("조건을 선택하세요.");
  	farmUser.target = "_self";
  	farmUser.method = "post";
  	farmUser.searchuser.focus();				//Enter 눌러도 넘어감
      return;
  }
  else {											//둘 다 null이 아닐 경우
  	farmUser.target = "_self";
  	farmUser.method = "post";
  	farmUser.action = "farmwtUserForm_in.jsp";  
  	farmUser.submit();
  }  
}
//************************************************************************ END LINE
//farmwtUserForm_in.jsp에서 추가 버튼 클릭시 farmwtInsertForm.jsp에서 추가되는 기능
//************************************************************************ START LINE
function check_in(user_id,farm_id) {
	
	var state_button = "<button class=\'btn btn-primary btn-sm\' type=\'button\' onclick=\"gofarmwtUserForm_in(\'"+farm_id+"\')\"> <strong>조회</strong> </button>"
	
	
	opener.document.getElementById("wait_Data").innerHTML = user_id+" "+state_button;

	window.close();

}
//************************************************************************ END LINE
</script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SAF</title>
    
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css">
	<link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css">
	<link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css">
	<link rel="stylesheet" href="../../common/assets/css/untitled.css">
	    
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=8d1ddd5ac79c6fbf372415fdc1bfbcce">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=7feee93f573b1ef2766af1d8290eeb33">
</head>

<body>
	<form name="farmUser">
		<input type="hidden" name="FarmID" value="<%=FarmID %>"/>
<%		
		if(searchuser == "null") {		// 담당자 검색 조건이 null일 때 공백 출력
			searchuser ="";
		}
		if(searchuserinput == null) {	// 담당자 검색창이 null일 때 공백 출력
			searchuserinput = "";
		}
%>
	    <div class="container">
	    <br>
			<h3 align="center" color="white">회원검색</h3>       	
	    </div>
	    <div class="container text-center">
		    <select class="mr-2">
			    <option value='username'>ID</option>
			    <option value='userid'>이름     </option>
			</select>
			
			<!-- 담당자 재검색시 검색조건 값 유지 -->
			<script>farmUser.searchuser.value ='<%=searchuser%>'</script>
			
			<!-- 검색창 , value:담당자 재검색시 검색창 값 유지 -->
			<input type="search" name="searchuserinput" value="<%=searchuserinput%>" class="mr-2"/>	
			
			<button class="btn btn-primary btn-sm" type="button" onclick="searchuserCheck_in(); return false;">
		    	<strong>검색</strong>
		    </button>
	    </div>
	    
	    
	    <div class="container">
	        <div class="table-responsive table-bordered text-truncate mt-2">
	            <table class="table table-bordered" style="text-align:center;">
	                <thead>
	                    <tr></tr>
	                </thead>
	                <tbody>
	                
	                    <tr>
	                        <td class="table-primary">ID</td>
	                        <td class="table-primary">이름</td>
	                        <td class="table-primary">선택</td>
	                    </tr>
	                    
	                    
	                    <%
				if(userlist.isEmpty()) {	// 담당자 검색 리스트가 공백시 출력되는 값
			%>
				<tr>
					<td colspan="3"> <br> 비어있습니다. <br> </td>
				</tr>
			<%	
				} else {
					for (int i = 0; i < userlist.size(); i++) {		//farmDAO에서 받아온 userlist 출력
	            	
					usertableDTO vo = (usertableDTO) userlist.get(i);
					
					// usertableDTO에 저장한 값 재저장
	            	String username = vo.getUserName();
					String userid = vo.getUserId();

			%>
			
			<tr>
				<td><%=username %></td>
				<td><%=userid %></td>
				
				<input type="hidden" name="sel_userid" value="<%=userid%>"/>
				<input type="hidden" name="farmid" value="<%= FarmID %>"/>
		
				<td>
				
				<button align="center" class="btn btn-primary btn-sm" type="button" onclick="check_in('<%=userid %>','<%=FarmID %>'); return false;">
		    	<strong>선택</strong>
		   		</button>
				</td>
			</tr>
			
			<%
					}	// for end
				}	// if end
			%>
	                    
	                </tbody>
	            </table>
	        </div>
	    </div>
	    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
	    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
	</form>
</body>
</html>