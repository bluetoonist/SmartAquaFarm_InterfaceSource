<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 예제</title>
</head>
<body>

	파일 업로드 예제를 익히기 위한 소스 코드
	필요 라이브러리 : cos.jar ,javax.servel.jsp.jstl-1.2.2.jar

	 ::upload.jsp
	<form action="upload.jsp" method="post" enctype="multipart/form-data">

		Value1 : <input type="text" name="id"><br>
		Value2 : <input type="text" name="subject"><br>		
		File : <input type="file" name="file1"><br>
		<input type="submit" value="확인"/>
	</form>	
	<br><br>
	
	<br>
	<br>
	
	:: check.jsp
	<form action="check.jsp" method="get">
		Check File Name : <input type="text" name="filename"/>
		<input type="submit" value="확인"/>
	
	</form>	
	<br>
	<br>
	
	:: Download.jsp
	<form action="download.jsp" method="get">
		Check File Name : <input type="text" name="filename"/>
		<input type="submit" value="확인"/>
	
	</form>	
	

	

</body>
</html>