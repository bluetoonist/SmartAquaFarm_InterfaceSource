/**
 * JavaScript util function
 * 
 */

/* MyPage Moved Function */
function MoveFarmSearchToIndexPage() {
	alert("양식장 아이디를 입력하세요");
	location.href = "../main/index.jsp";
}
function MoveFarmSearchToFarmInsert() {
	location.href = "./farmwtInsert.jsp ";
}

function goButtonFarmwtSearch(){
	var search_farm = document.getElementById("selectFarm");
	var farmid = search_farm.value;
	

	if (farmid == "") {
		alert("양식장을 선택해주세요");
	} else {
		var dynamic_form = document.createElement("form");
		dynamic_form.setAttribute("charset", "UTF-8");
		dynamic_form.setAttribute("method", "post");
		dynamic_form.setAttribute("action", "../watertank/repairRec.jsp");

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "farmid");
		hiddenField.setAttribute("value", farmid);
		
		dynamic_form.appendChild(hiddenField);
		document.body.appendChild(dynamic_form);
		dynamic_form.submit();
	}
}

function farmSearch(){
	var search_farm = document.getElementById("selectFarm").value;
	var farmid = search_farm.value;

	if (farmid == "") {
		alert("양식장을 선택해주세요");
	} else {
		var dynamic_form = document.createElement("form");
		dynamic_form.setAttribute("charset", "UTF-8");
		dynamic_form.setAttribute("method", "post");
		dynamic_form.setAttribute("action", "../watertank/stateRec.jsp");

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "farmid");
		hiddenField.setAttribute("value", farmid);
		
		dynamic_form.appendChild(hiddenField);
		document.body.appendChild(dynamic_form);
		dynamic_form.submit();
	}
}

window.onload = function()
{
	printClock();
	goInit();
}


function MoveMyPage() {
	location.href = "../user/userInfo.jsp";
}
function moveFarmWtSearchPage() {
	var search_farm = document.getElementById("selectFarm");
	var farmid = search_farm.value;
	
	if (farmid == "") {
		alert("양식장을 선택해주세요");
	} else {
		var dynamic_form = document.createElement("form");
		dynamic_form.setAttribute("charset", "UTF-8");
		dynamic_form.setAttribute("method", "Post");
		dynamic_form.setAttribute("action", "../farm/farmwtSearch.jsp");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "farmid");
		hiddenField.setAttribute("value", farmid);
		
		dynamic_form.appendChild(hiddenField);
		document.body.appendChild(dynamic_form);
		dynamic_form.submit();
	}
}

function moveFarmWtSearch() {
	var farm = document.farmSelect;
	farm.method = "post";
	farm.target = "_self";
	farm.action = "farmwtSearch.jsp";
	farm.submit();
}
//farmwtUpdateForm.jsp에서 삭제 버튼 클릭시 수조정보 삭제되는 기능
//************************************************************************ START LINE
function gofarmdelete() {
	var farm = document.farmSelect;
	
	tankid = farm.tankID2.value;
	fishname = farm.fishnames.value;
	userid = farm.userid.value;
	dosensor = farm.dosensor.value;
	phsensor = farm.phsensor.value;
	psusensor = farm.psusensor.value;
	wtsensor = farm.wtsensor.value;
	nh4sensor = farm.wtsensor.value;
	no2sensor = farm.no2sensor.value;
		
	if(userid == " " && dosensor == " " && phsensor == " " && psusensor == " " &&
			wtsensor == " " && nh4sensor == " " && no2sensor == " "){
		farmSelect.method = "post";
		alert("이미 삭제된 수조정보입니다.");
		farmSelect.target = "_self";
		
		
	} else if (confirm("수조" + tankid + "의 정보를 삭제하시겠습니까?") == true) {			//삭제하기 전 경고창으로 확인받기
		farmSelect.method = "post";
		farm.action = "farmwtDeletePrc.jsp";		//확인 클릭시 페이지 이동
		farmSelect.target = "_self";
		farm.submit();
	} else {
		return;
	}
}
//************************************************************************ END LINE
//farmwtSearch.jsp에서 수조번호 클릭시 수정화면으로 이동하는 기능
//************************************************************************ START LINE
	function goRead(tankid,FarmID) {
		var farm = document.farmSearch;
		if (tankid != null) {
			//farm.tankID.value = tankid;
			alert(tankid + "수조가 선택되었습니다.");
			farm.target = "_self";
			farm.method = "post";
			farm.action = "farmwtUpdateForm.jsp?tankID="+tankid+"&FarmID="+FarmID;
			farm.submit();
		}
	}
//************************************************************************ END LINE
//farmwtSearch.jsp에서 조회버튼 클릭시 검색조건 또는 검색창이 null일 경우 경고창
//************************************************************************ START LINE
	function searchCheck(){	
			if(farmSearch.searchinput.value == '' && farmSearch.search.value == 'null') {
				alert("조건 선택 및 검색 단어를 입력하세요.");
				farmSearch.target = "_self"; 							//새창이 열리지않고 현재창이 바뀜
				farmSearch.method = "post";
	          farmSearch.searchinput.focus();				//Enter 눌러도 넘어감
	          return;
			}
			else if(farmSearch.searchinput.value == '' && farmSearch.search.value != 'null') {			//검색창 값이 null일 경우
				alert("검색 단어를 입력하세요.");
				farmSearch.target = "_self";				//새창이 열리지않고 현재창이 바뀜
				farmSearch.method = "post";
	          farmSearch.searchinput.focus();				//Enter 눌러도 넘어감
	          return;
	      }
	      else if(farmSearch.search.value == 'null' && farmSearch.searchinput.value != ''){			//검색조건이 선택되지 않았을(null) 경우
	      	alert("조건을 선택하세요.");
	      	farmSearch.target = "_self";
	      	farmSearch.method = "post";
	      	farmSearch.search.focus();				//Enter 눌러도 넘어감
	          return;
	      } 
	      else {											//둘 다 null이 아닐 경우
	      	farmSearch.target = "_self";
	      	farmSearch.method = "post";
	      	farmSearch.action = "farmwtSearch.jsp";  
	      	farmSearch.submit();
	      }
	}
//************************************************************************ END LINE
//farmwtSearch.jps에서 등록 버튼 클릭시 등록화면으로 이동하는 기능
//************************************************************************ START LINE
	function gofarmwtInsertForm() {
	
		var farm = document.farmSearch;
		
		farm.target = "_self";
		farm.method = "post";
		farm.action="farmwtInsertForm.jsp";
		farm.submit();
	}
//************************************************************************ END LINE
	//farmwtUpdateForm.jsp, farmwtInsertForm.jsp 에서 취소,목록보기 버튼을 누를시 farmwtSearch.jsp 로 넘어가능 기능
	//************************************************************************ STARTLINE
		function farmCancel(formname) {
			if (formname =="formUpdate"){
			document.farmSelect.method = "post";
			 document.farmSelect.action = "farmwtSearch.jsp"; // 확인 클릭시 페이지 이동
			 document.farmSelect.target = "_self";
			 document.farmSelect.submit();
			}
			if (formname=="formInsert"){
			 // 폼 찾기
			 var form = document.farmSelect;  
			 // 취소를 누를 경우
			 form.target = "_self";
			 form.method = "post";
			 form.action = "farmwtSearch.jsp";
			 form.submit();
			}
		}
	/* ***************************************************************** END LINE*/
	//farmwtUpdateForm.jsp 에서 수정 버튼을 누를시 farmwtUpdatePrc.jsp 로 넘어가능 기능
	//************************************************************************ START LINE
	 function goUpdate() { // 수정 버튼 클릭시
	 	
	 	var frm = document.farmSelect;
	 	
	 	if (frm.dosensor.value==' ') {
	 		alert("DO 센서명을 입력하세요.");
	 		return;
	 	}
	 	if (frm.phsensor.value==' ') {
	 		alert("pH센서명을 입력하세요.");
	 		return;
	 	}
	 	if (frm.psusensor.value==' ') {
	 		alert("psu센서명을 입력하세요.");
	 		return;
	 	}
	 	if (frm.wtsensor.value==' ') {
	 		alert("수온 센서명을 입력하세요.");
	 		return;
	 	}
	 	if (frm.nh4sensor.value==' ') {
	 		alert("NH4센서명을 입력하세요.");
	 		return;
	 	}
	 	if (frm.no2sensor.value==' ') {
	 		alert("NO2센서명을 입력하세요.");
	 		return;
	 	} 
	 	if (frm.userid.value==' '){
	 		alert("담당자를 선택하세요.");
	 		return;
	 	}
	 	
	 	if (confirm("수조 정보를 업데이트 하시겠습니까?")) { // 수정 전 경고창으로 확인받기
	 		farmSelect.method = "post";
	 		frm.action = "farmwtUpdatePrc.jsp"; // 확인 클릭시 페이지 이동
	 		frm.target = "_self";
	 		frm.submit();

	 	} else {
	 		return false;
	 	}
	 }
	//************************************************************************ END LINE
	// farmwtUpdateForm.jsp에서 삭제 버튼 클릭시 수조정보 삭제되는 기능
	//************************************************************************ START LINE
	function gofarmdelete() {
		var farm = document.farmSelect;
		alert("삭제");
		
		tankid = farm.tankID.value;
		fishname = farm.fishnames.value;
		userid = farm.userid.value;
		dosensor = farm.dosensor.value;
		phsensor = farm.phsensor.value;
		psusensor = farm.psusensor.value;
		wtsensor = farm.wtsensor.value;
		nh4sensor = farm.wtsensor.value;
		no2sensor = farm.no2sensor.value;
			
		if(userid == " " && dosensor == " " && phsensor == " " && psusensor == " " &&
				wtsensor == " " && nh4sensor == " " && no2sensor == " "){
			farmSelect.method = "post";
			alert("이미 삭제된 수조정보입니다.");
			farmSelect.target = "_self";
			
			
		} else if (confirm("수조" + tankid + "의 정보를 삭제하시겠습니까?") == true) {			//삭제하기 전 경고창으로 확인받기
			farmSelect.method = "post";
			farm.action = "farmwtDeletePrc.jsp";		//확인 클릭시 페이지 이동
			farmSelect.target = "_self";
			farm.submit();
		} else {
			return;
		}
	}
	//************************************************************************ END LINE
	//farmwtUpdateForm.jsp에서 삭제 버튼 클릭시 수조정보 삭제되는 기능
	//************************************************************************ START LINE
	function gofarmdelete() {
		var farm = document.farmSelect;
		
		tankid = farm.tankID.value;
		fishname = farm.formname.value;
		userid = farm.userid.value;
		dosensor = farm.dosensor.value;
		phsensor = farm.phsensor.value;
		psusensor = farm.psusensor.value;
		wtsensor = farm.wtsensor.value;
		nh4sensor = farm.wtsensor.value;
		no2sensor = farm.no2sensor.value;
			
		if(userid == " " && dosensor == " " && phsensor == " " && psusensor == " " &&
				wtsensor == " " && nh4sensor == " " && no2sensor == " "){
			farmSelect.method = "post";
			alert("이미 삭제된 수조정보입니다.");
			farmSelect.target = "_self";
			
			
		} else if (confirm("수조" + tankid + "의 정보를 삭제하시겠습니까?") == true) {			//삭제하기 전 경고창으로 확인받기
			farmSelect.method = "post";
			farm.action = "farmwtDeletePrc.jsp";		//확인 클릭시 페이지 이동
			farmSelect.target = "_self";
			farm.submit();
		} else {
			return;
		}
	}
	//************************************************************************ END LINE
	//farmwtInsertForm.jsp에서 조회 버튼 클릭시 담당자 검색 화면으로 이동하는 기능
	//************************************************************************ START LINE
	function gofarmwtUserForm_in(FarmID) {
		var url = "farmwtUserForm_in.jsp?FarmID=" + FarmID;
		windowsObj = window.open(url, "farmwtUserForm_in.jsp", "scrollbars=yes, resizable=no, width=430px, height=400px");
		
		document.getElementById("wait_Data").text = document.getElementById("parentText").value;

	}
	//************************************************************************ END LINE
	//빈칸확인 - farmwtInsertForm.jsp
	//************************************************************************ START LINE
		function farmwtInsert(){

		   // 폼 찾기
		   var form = document.farmSelect;
			   // 빈칸 확인
			   if(!form.tankid.value){ //tankid 값이 들어가 있지 않으면 입력하라고 함.
			     alert("수조 이름을 입력하세요.");
			     return;
			   }
			   if(!form.dosensor.value){ //dosensor 값이 들어가 있지 않으면 입력하라고 함.
			        alert("DO 센서명을 입력하세요.");
			        return;
			      }
			   if(!form.phsensor.value){ //phsensor 값이 들어가 있지 않으면 입력하라고 함.
			        alert("pH 센서명을 입력하세요.");
			        return;
			      }
			   if(!form.wtsensor.value){ //wtsensor 값이 들어가 있지 않으면 입력하라고 함.
			        alert("수온 센서명을 입력하세요.");
			        return;
			      }
			   if(!form.psusensor.value){ //psusensor 값이 들어가 있지 않으면 입력하라고 함.
			        alert("PSU센서명을 입력하세요.");
			        return;
			      }
			   if(!form.nh4sensor.value){ //nh4sensor 값이 들어가 있지 않으면 입력하라고 함.
			        alert("NH4센서명을 입력하세요.");
			        return;
			      }
			   if(!form.no2sensor.value){ //no2sensor 값이 들어가 있지 않으면 입력하라고 함.
			        alert("NO2센서명을 입력하세요.");
			        return;
			      }
				
			   var td = document.getElementById("wait_Data").innerHTML
			   var id = td.split(" ");
			   
			   var num = document.createElement("input");
			   num.setAttribute("type", "hidden");
			   num.setAttribute("name", "ID");
			   num.setAttribute("value", id[0]);
				
			   form.appendChild(num);
			   
			   // 정보 등록 확인창
			   if(confirm("등록 하시겠습니까?")){   
			     // 확인을 누를 경우
			     form.method = "post"; //post 방식
			     form.action = "farmwtInsertPrc.jsp"; //farmwtInsertPrc로 넘어감
			     form.target = "_self"; //현재 창에 뜨기
			     form.submit();
			   }
			}
		
//************************************************************************ END LINE
//farmwtUserForm_in.jsp에서 조회 버튼 클릭시 검색조건 또는 검색창이 null일 경우 경고창
//************************************************************************ START LINE
		function searchuserCheck_in(){								//검색 버튼 선택시 실행되는 기능
			var farmUser = document.farmUser;
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
/* New Design Function */