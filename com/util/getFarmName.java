package util;

/*
■ SYSTEM                :  SAF 
■ SOURCE FILE NAME      :  getFarmName.jsp
■ DESCRIPTION           :  ajax 호출로 불러온 양식장 id, 양식장 이름을 반환
■ COMPANY               :  목포대학교 분산멀티미디어 연구실
■ PROGRAMMER            :  Ko-jian
■ DESIGNER              :  
■ PROGRAM DATE          :  2020.03.06
■ EDIT HISTORY          :  2020.03.06
■ EDIT CONTENT          : 
*/

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import farm.farmDAO;
import farm.farmDTO;

/**
 * Servlet implementation class getFarmName
 */

@WebServlet("/getFarmName")
public class getFarmName extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");

		String get_user_id = request.getParameter("user_id");

		if (get_user_id == "0") {
			return;
		} else {

			response.getWriter().write(getSySFarmName(get_user_id));
		}

	}

	/*
	 * 
	 * @param get_user_id
	 * @return
	 */
	public String getSySFarmName(String get_user_id) {

		farmDAO get_dao = new farmDAO();

		ArrayList<farmDTO> list = get_dao.getuserFarmData(get_user_id);

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		for (int i = 0; i < list.size(); i++) {
			result.append("[{\"farm_id\":\"" + list.get(i).getFarmId() + "\"},");
			result.append("{\"farm_name\":\"" + list.get(i).getFarmName() + "\"}],");
		}
		result.append("]}");
		
		return result.toString();
	}

}
