<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/uploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 예제</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%--
	파일 업로드 시 반드시 enctype="multipart/form-data" 로 설정해야 함.
	=> 파라미터 정보와 선택한 파일의 이름뿐만 아니라 파일의 내용도 함께 서버로 전송하도록 설정하는 것
	파일 업로드 시, method 는 무조건 "post" 방식(파일의 내용은 url로 이동할 수 없기 때문)
	** 주의사항 
	enctype="multipart/form-data"를 통해 넘어온 upload.jsp 페이지에서는 request 객체는 사용할 수 없음.
	=> cos.jar 파일에 설정된 MultipartRequest 객체를 사용하여 파라미터 정보와 파일의 정보를 사용해야 함.
--%>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
<table>
<tr><th>올린 사람</th><td><input type="text" name="name"></td></tr>     <%-- 파라미터 값 --%>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>       <%-- 파라미터 값 --%>
<tr><th>파일</th><td><input type="file" name="file1"></td></tr>  
<%-- 파일탐색기 => 파일 선택 => 서버로 이동 => request 객체 자체로 사용할 수 없음 => request 객체를 유틸리티(cos.jar)를 통해 정리하여 사용가능. --%>     
<tr><td colspan="2"><input type="submit" value="전송"></td></tr>
</table>
</form>
</body>
</html>