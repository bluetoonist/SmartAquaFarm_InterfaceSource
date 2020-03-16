/**
 * 
 */

// 왼쪽 메뉴 클릭시 상단 메뉴가 바뀜
function changed_Menu(param1) {
	var obj = document.getElementsByTagName("li");
	
	var find_get_title = document.getElementsByClassName("title");
	var change_text = find_get_title[0].getElementsByTagName("h2")
	change_text[0].textContent = obj[param1].textContent;
}

function page_call() {	
	location.href
}


/* MyPage Moved Function */

function MoveMyPage() {
	location.href = "../user/userInfo.jsp";
	
}

function moveFarmWtSearchPage(farm_id) {
	location.href = "../farm/farmwtSearch.jsp?farmid="+farmid;
}


/* New Design Function*/