<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String fileName = request.getParameter("filename");

		String uploadPath = pageContext.getServletContext().getRealPath("/fileuploadExample\\upload\\");
		String filePath = uploadPath + "\\" + fileName;
	
		File file = new File(filePath);
		
		// MIMETYPE ����
		String mimeType = getServletContext().getMimeType(filePath);
		if (mimeType == null)
			mimeType = "application/octet-stream";
		response.setContentType(mimeType);
		
		// �ٿ�ε� ���� �� �ѱ� ���ϸ� ������ �� ����
		String encoding = new String(fileName.getBytes("utf-8"), "8859_1");
		response.setHeader("Content-Disposition", "attachment; filename= " + encoding);
		
		// ��û ������ �о Ŭ���̾�Ʈ�� ����	
		FileInputStream in = new FileInputStream(file);
		ServletOutputStream outStream = response.getOutputStream();
		
		byte b[] = new byte[4096];
		int data = 0;
		while ((data = in.read(b, 0, b.length)) != -1) {
			outStream.write(b, 0, data);
		}

		outStream.flush();
		outStream.close();
		in.close();
	%>
</body>
</html>