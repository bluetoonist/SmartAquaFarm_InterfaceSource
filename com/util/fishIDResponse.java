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

		if (get_farm_id == "0") {
			return;
		} else {
//			response.getWriter().write(getfishInfor(get_farm_id));
		}

	}
	
	
//	public String gefishInfor(String get_farm_id) {
			
		
//	}
	

}
