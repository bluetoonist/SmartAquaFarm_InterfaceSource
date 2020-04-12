<%@ page import="java.util.*"%>

<%@ page import="farm.farmDTO" %>
<%@ page import="farm.farmDAO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<%
    /* Session  Configuration */
    String user_id = (String) session.getAttribute("userId");
    String user_name = (String) session.getAttribute("userName");
    String user_auth = (String) session.getAttribute("userAuth");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
        <%
            
            ArrayList<farmDTO> f_dto = new ArrayList<farmDTO>();
            farmDAO f_dao = new farmDAO();
            
            f_dto = f_dao.getFarm(user_auth, "21");
            
            for(int i=0; i<f_dto.size(); i++) {
                System.out.println(f_dto.get(i).getFarmId());
                System.out.println(f_dto.get(i).getFarmName());
            }
            

        %>



</body>
</html>