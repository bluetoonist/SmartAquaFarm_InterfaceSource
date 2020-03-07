<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String fileName = request.getParameter("filename");
	%>

		Check the File Name  : <%= fileName %> <br>	

	
	<%
		String uploadPath = pageContext.getServletContext().getRealPath("/fileuploadExample\\upload\\");
		File dir = new File(uploadPath);
		String files[] = dir.list();
		
		boolean Match_Flag = Arrays.asList(files).contains(fileName);
	%>

		FILE Check FLAG : <%= Match_Flag %>

<%--

for ( int i=0; i< files.length; i++ )
		{
			if ( fileName.equals(files[i])) {
				System.out.println(files[i]);
				
			}
		
		}
 --%>
	


</body>
</html>