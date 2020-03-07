<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		/*
			간단한 파일 업로드 예졔 : upload.jsp
			- 파일 업로드에 관한 자세한 옵션은 검색하면서 찾아볼 것
		*/
	
	
		// 저장 경로 지정
		// tomcat server 에서 "Server Module without Publishing" 에 체크하고 진행할 것
		
		
		// 인수로 들어간 문자열은 절대경로로 지정해 준 것
		String uploadPath = pageContext.getServletContext().getRealPath("/fileuploadExample\\upload\\");
		System.out.println(uploadPath);

		//file size
		int maxSize = 1024 * 1024 * 10; 
		
		
		// 아래 변수들은 fileUpload_Example.jsp 에서 넘어온 form 태그의 파라미터 값으로 선언
		String id ="";
		String subject = "";
		String fileName1 = "";
		
		// 파일 업로드를 위한 MultipartRequest 객체 생성
		MultipartRequest multi = null;
		try{
			
			// 실제 파일 업로드를 위한 객체 생성
			// request 인자는 고정 값
			// 두 번째 인자는 업로드 경로
			// 세 번쨰 인자는 파일 사이즈 제한
			// 네 번쨰 인자는 인코딩 타입
			// 다섯 번쨰 인자는  같은 파일명이 있는지를 검사하고 있을 경우에는 파일명뒤에 숫자를 붙혀준다
			
			multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			
			id = multi.getParameter("id");
			subject = multi.getParameter("subject");
			
			fileName1 = multi.getFilesystemName("file1");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		%>

</body>
</html>