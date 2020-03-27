/**
 * JavaScript util function
 * 
 */

/* MyPage Moved Function */
function MoveFarmSearchToIndexPage() {
	alert("양식장 아이디를 입력하세요");
	location.href = "../main/index.jsp";
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

/* New Design Function */