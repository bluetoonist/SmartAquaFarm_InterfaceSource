package util;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rec.recDAO;
import rec.recDTO;
import repair.repairDAO;
import watertank.waterTankDAO;

/**
 * Servlet implementation class LogDataRequest
 */
@WebServlet("/LogDataRequest")
public class LogDataRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
		response.setContentType("text/html; charset=UTF-8");

		String get_farm_id = request.getParameter("farm_id");

		if (get_farm_id == "0") {
			return;
		} else {
			response.getWriter().write(get_json_parsing_rec(get_farm_id));
		}
		
	}

	public String get_json_parsing_rec(String farm_id) {
		StringBuffer result = new StringBuffer("");
		
		// get REC Table Data
		recDAO rDAO = new recDAO();
		ArrayList<recDTO> getWtRec = rDAO.wtRecRet(farm_id);
		
		// get farmid of REC TABLE with Farm Count (Using farmid) 
		waterTankDAO getwtTankcnt = new waterTankDAO();
		String allwtTankCnt = getwtTankcnt.getTankCnt(farm_id);
		
		// Jsons String Parsing Logic Edit
		result.append("{\"result\":[");
		result.append("[{\"all_waterTank_count\":\"" +allwtTankCnt +"\"}],");
		
		if (allwtTankCnt.equals("0" )) {
			result.append("]}");
			System.out.println(result.toString());
			return result.toString();			
		}
		
		
		// REC TABLE DATA Request
		for(int i=1; i<getWtRec.size(); i++)			
		{
			repairDAO retCounter = new repairDAO();
			String resCnt = retCounter.retRepSeq(farm_id,  getWtRec.get(i).getTankId());		

			result.append("[{\"watertank_number\":\"" + getWtRec.get(i).getTankId() + "\"},");
			result.append("{\"watertank_state\":\"" + getWtRec.get(i).getState() + "\"},");
			
		
			if(getWtRec.get(i).getYrCode()  == null) {
				result.append("{\"watertank_state_signal\":\"" + "" + "\"},");
					
			} else {
				result.append("{\"watertank_state_signal\":\"" + getWtRec.get(i).getYrCode() + "\"},");
				
			}
	
			result.append("{\"물고기종\":\"" + getWtRec.get(i).getFishId() + "\"},");
			result.append("{\"DO\":\"" + getWtRec.get(i).getDoRec()+ "\"},");
			result.append("{\"WTREC\":\"" + getWtRec.get(i).getWtRec() + "\"},");
			result.append("{\"PHREC\":\"" + getWtRec.get(i).getPhRec() + "\"},");
			result.append("{\"NH4REC\":\"" + getWtRec.get(i).getNh4Rec() + "\"},");
			result.append("{\"NO2REC\":\"" + getWtRec.get(i).getNo2Rec() + "\"},");
			result.append("{\"RECSEQ\":\"" + getWtRec.get(i).getRecSeq() + "\"},");
			
			if(i  == getWtRec.size()-1) {
				result.append("{\"value\":\"" +resCnt + "\"}] ]}");	
			} else {
				result.append("{\"value\":\"" +resCnt + "\"}],");	
			}
			
		}
		
		return result.toString();
	}
}
