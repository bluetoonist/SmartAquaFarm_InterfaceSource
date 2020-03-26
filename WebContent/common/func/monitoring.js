/**
 *  The source file only used index.jsp
 *  Auth : ko-jian
 *  Data : 2020-03-21
 *  
 */

var xhr = new XMLHttpRequest();

var temp; // debugg temp Variable (must be removed)




function goSelectedAdmin() {
	var getSelectValue = document.getElementById("selectAdmin");
	var get_user_id = getSelectValue.value;

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var JsonObj = eval("(" + xhr.responseText + ")");
			var result = JsonObj.result;
			
			var search_farm = document.getElementById("selectFarm");
			
			// if search_farm is null			
		
				for (i = search_farm.length - 1; i >= 0; i--) {	
					search_farm.options.remove(i);
				}
			
			// if search_farm is not null
		
				for (i = 0; i < result.length; i++) {
					// farm_id : [0][0] 양식장 ID 인덱스
					// farm_name : [0][1]; 양식장 이름 인덱스
					if( i == 0  ){
						var objOption = document.createElement("option");
						objOption.value = 0
						objOption.textContent = "양식장을 선택하세요";
						search_farm.options.add(objOption);						
						} 
						var objOption = document.createElement("option");
						objOption.value = result[i][0].farm_id;
						objOption.textContent = result[i][1].farm_name;
						search_farm.options.add(objOption);										
				}			
							
		} else {
			return "False";
		}
	}
	xhr.open("Post", "../../getFarmName", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("user_id=" + get_user_id);
}



// 모니터링을 위한 동적 HTML 생성 함수
function goSelectedFarm() {
	
	var getSelectValue = document.getElementById("selectFarm");
	var get_farm_id = getSelectValue.value;

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var JsonObj = eval("(" + xhr.responseText + ")");
			
			// watertank REC Data Dynamic Loading Logic
			var result = JsonObj.result;
			
			var creDiv = document.getElementById("watertank_layout_grid");
			temp = creDiv;
			
			console.log(temp);
			// Check WaterTank Count value
			// if check_wt_number == "0"
			// remove all display before watertank
			var check_wt_number = result[0][0].all_waterTank_count;
			
			
			if (check_wt_number == 0) {
				var deleteValue = creDiv.getElementsByClassName("row offset-lg-1").length
				
					
				for(i=deleteValue-1; i>=0 ; i--) {
					creDiv.getElementsByClassName("row")[i].remove();
				}
				
				creDiv.textContent = "검색된 수조가 없습니다.";
				return;
			
			} else {
			creDiv.textContent = "";
			
			for(i=1; i<result.length; i++) {
			
				//second Loop Max
				var secLoopMaxValue = result[i].length;
				
				for(j=0;  j<secLoopMaxValue; j++) {
					// Data Format Declare
					var watertank_number = result[i][0].watertank_number;						
					var watertank_state = result[i][1].watertank_state;
					var watertank_state_signal = result[i][2].watertank_state_signal;
					var fish_category = result[i][3].물고기종;
					var watertank_do = result[i][4].DO;
					var watertank_wtrec = result[i][5].WTREC;
					var watertank_phrec = result[i][6].PHREC;
					var watertank_nh4rec = result[i][7].NH4REC;
					var watertank_no2rec = result[i][8].NO2REC;
					var watertank_recseq = result[i][9].RECSEQ;
					var data_end_format = result[i][10].value;
				
					var html = "";
					
					html += "<div class=\" card shadow mb-md-0 offset-md-1s ml-5\">";
					
				    html += "<div class=\"card-header d-flex justify-content-between align-items-center\">";
				    html += "    <i class=\"icon ion-ios-circle-filled danger-icon fa-lg\"></i>";
				    html += "    <h6 class=\"text-primary font-weight-bold m-0\">"+watertank_number+"</h6>";
				    html += "    <div class=\"dropdown no-arrow\">";
				    html += "        <button class=\"btn btn-link btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\" type=\"button\">";
				    html += "                <i class=\"fas fa-ellipsis-v text-gray-400\"></i>";
				    html += "            </button>";
				    
				    html += "        <div class=\"dropdown-menu shadow dropdown-menu-right animated--fade-in\" role=\"menu\">";
				    html += "            <a class=\"dropdown-item\" role=\"presentation\" href=\"#\">&nbsp;조치하기</a>";
				    html += "        </div>";
				    html += "    </div>";
				    html += " </div>";

				    html += "<div class=\"card-body\">";
				    html += "    <div class=\"row\">";
				    html += "        <div class=\"col-xl-5 offset-xl-0 d-xl-flex justify-content-xl-center align-items-xl-center\">";
				    html += "            <i class=\"fas fa-glass-whiskey d-xl-flex justify-content-xl-center fa-6x water-tank-icon\"></i>";
				    html += "        </div>";

				    html += "        <div class=\"col-xl-7 d-xl-flex\">";
				    html += "            <div class=\"table-responsive table-borderless mt-2 mb-2\">";
				    html += "                <table class=\"table table-bordered table-sm\">";
				    html += "                    <tbody>";
				    html += "                        <tr>";
				    html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left flex-shrink-0\">"+watertank_number+ "</td>";
				    html += "                            <td>"+fish_category+"</td>"
				    html += "                        </tr>";
				   
				
				    //  DO					
				    html += "                        <tr>";				   
				    if(watertank_do >= 8.5) { //DO Safety
				    	html += "                            <td class=\" text-left text-sm-left text-md-left text-lg-left text-xl-left\">DO</td>";
				    	html += "                            <td>"+watertank_do+"</td>"
				    } else if ( watertank_do >= 4.5) { //DO Warning
				    	html += "                            <td class=\"table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left\">DO</td>";					    	
				    	html += "                            <td class=\"table-warning\">"+watertank_do+"</td>"
				    } else {  //DO Danger
				    	html += "                            <td class=\"table-danger text-left text-sm-left text-md-left text-lg-left text-xl-left\">DO</td>";
				    	html += "                            <td class=\"table-danger\">" +watertank_do+ "</td>"
					    
				    }				    
				    
				    html += "                        </tr>";
				   
				    
				    //  WTREC
				    html += "                        <tr>";				   
				    if(watertank_wtrec > 32) {
				    	html += "                            <td class=\"table-danger text-sm-left text-md-left text-lg-left text-xl-left\">수온</td>";
				    	html += "                            <td class=\"table-danger\">" +watertank_wtrec+ "</td>"
				    } else if(watertank_wtrec >= 27) {
				    	html += "                            <td class=\"table-warning text-sm-left text-md-left text-lg-left text-xl-left\">수온</td>";					    
				    	html += "                            <td class=\"table-warning\">" +watertank_wtrec+ "</td>"
				    } else if( watertank_wtrec >= 10) {
				    	html += "                            <td class=\"table-sm-left text-md-left text-lg-left text-xl-left\">수온</td>";					 
				    	html += "                            <td>" +watertank_wtrec+ "</td>"
				    } else if ( watertank_wtrec >= 2) {
				    	html += "                            <td class=\"table-warning text-sm-left text-md-left text-lg-left text-xl-left\">수온</td>";					    
				    	html += "                            <td class=\"table-warning\">" +watertank_wtrec+ "</td>"
				    } else  {
				    	html += "                            <td class=\"table-danger text-sm-left text-md-left text-lg-left text-xl-left\">수온</td>";					    
				    	html += "                            <td class=\"table-danger\">" +watertank_wtrec+ "</td>"
				    }			
				    html += "                        </tr>";
				    
				    // PHREC
				    html += "                        <tr>";				    
				    if(watertank_phrec >= 9) {
				    	html += "                            <td class=\"table-danger text-sm-left text-md-left text-lg-left text-xl-left\">pH</td>";					    	
				    	html += "                            <td class=\"table-danger\">" +watertank_phrec+ "</td>"
				    } else if(watertank_phrec >= 8.5) {
				    	html += "                            <td class=\"table-warning text-sm-left text-md-left text-lg-left text-xl-left\">pH</td>";					    
				    	html += "                            <td class=\"table-warning\">" +watertank_phrec+ "</td>"
				    } else if( watertank_phrec >= 6.5) {
				    	html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left\">pH</td>";					    
				    	html += "                            <td>" +watertank_phrec+ "</td>"
				    } else if(watertank_phrec >= 5) {
				    	html += "                            <td class=\"table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left\">pH</td>";					   
				    	html += "                            <td class=\"table-warning\">" +watertank_phrec+ "</td>"
				    } else {
				    	html += "                            <td class=\"table-danger text-left text-sm-left text-md-left text-lg-left text-xl-left\">pH</td>";					    
				    	html += "                            <td class=\"table-danger\">" +watertank_phrec+ "</td>"
				    }				 				    
				    
				    html += "                        </tr>";
				    
				    //NH4REC
				    html += "                        <tr>";
				    if(watertank_nh4rec >= 40) {
				    	 html += "                            <td class=\"table-danger text-left text-sm-left text-md-left text-lg-left text-xl-left\">암모니아</td>";						    	
				    	 html += "                            <td class=\"table-danger\">" +watertank_nh4rec+ "</td>"
				    } else if (watertank_nh4rec >=20) {
				    	 html += "                            <td class=\"table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left\">암모니아</td>";						   
				    	 html += "                            <td class=\"table-warning\">" +watertank_nh4rec+ "</td>"
				    } else if (watertank_nh4rec >= 10) {
				    	 html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left\">암모니아</td>";						   
				    	 html += "                            <td>" +watertank_nh4rec+ "</td>"
				    } else {
				    	 html += "                            <td class=\"table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left\">암모니아</td>";						   
				    	 html += "                            <td class=\"table-warning\">" +watertank_nh4rec+ "</td>"
				    }				 				    
				    html += "                        </tr>";
				    
				    // NO2REC
				    html += "                        <tr>";
				    if(watertank_no2rec >= 15) {
				    	 html += "                            <td class=\"table-danger text-left text-sm-left text-md-left text-lg-left text-xl-left\">아질산</td>";						    	
				    	 html += "                            <td class=\"table-danger\">" +watertank_no2rec+ "</td>"
				    } else if(watertank_no2rec >= 10) {
				    	 html += "                            <td class=\"table-warning text-left text-sm-left text-md-left text-lg-left text-xl-left\">아질산</td>";				    	
				    	 html += "                            <td class=\"table-warning\">" +watertank_no2rec+ "</td>"
				    } else if(watertank_no2rec < 10){
				    	 html += "                            <td class=\"text-left text-sm-left text-md-left text-lg-left text-xl-left\">아질산</td>";
				    	 html += "                            <td>" +watertank_no2rec+ "</td>"
				    } else {
				    	html += "                            <td class=\"table-warning text-sm-left text-md-left text-lg-left text-xl-left\">아질산</td>";
				    	html += "                            <td class=\"table-warning\">" +watertank_no2rec+ "</td>"
				    }				 				   
				    html += "                        </tr>";				    
				    html += "                    </tbody>";
				    html += "                </table>";
				    html += "            </div>";				 
				    html += "        </div>";
				    html += "    </div>";
				    html += "	</div>";
				    html += "</div>";
					
				}
				creDiv.insertAdjacentHTML("beforeend",html);

			} 
		} // End Else Syntax
	} else {
		return false;	
	
		}
	}	//End onreadystateChange
	
	xhr.open("Post", "../../LogDataRequest", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("farm_id=" + get_farm_id);
	
}// End goSelectedFarm

