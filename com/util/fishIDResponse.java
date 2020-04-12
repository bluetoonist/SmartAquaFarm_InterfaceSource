package util;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import farm.farmDAO;
import farm.farmDTO;

import growInfo.growInfoDAO;
import growInfo.growInfoDTO;


/**
 * Servlet implementation class fishIDResponse
 */
@WebServlet("/fishIDResponse")
public class fishIDResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");

		String get_farm_id = request.getParameter("farm_id");
		System.out.println(get_farm_id);
		int int_farm_id = Integer.parseInt(get_farm_id);
		
		if (get_farm_id == "0") {
			return;
		} else {
			response.getWriter().write(gefishInfor(int_farm_id));
		}

	}
	
	
	public String gefishInfor(int int_farm_id) {
		StringBuffer result = new StringBuffer("");
		
		ArrayList<growInfoDTO> g_dto = new ArrayList<growInfoDTO>();
		growInfoDAO g_dao = new growInfoDAO();
		
		g_dto =g_dao.mgrowList(int_farm_id);
		// Jsons String Parsing Logic Edit
		result.append("{\"result\":[");
		
		for( int i=0; i<g_dto.size(); i++) {
			result.append("[{\"fish_group_code\":\"" + g_dto.get(i).getGroupCode() + "\"},");
			result.append("{\"fish_name\":\"" + g_dto.get(i).getFishName() + "\"}],");
			
		}
		result.append("]}");
		
		return result.toString();
	}
	

}
