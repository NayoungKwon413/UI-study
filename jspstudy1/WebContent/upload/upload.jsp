<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/upload.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 결과</title>
</head>
<body>
<%
	//파일이 업로드되는 위치를 지정
	String uploadPath = application.getRealPath("/")+"upload/";   //uploadPath : application 의 내장객체
	int size = 10*1024*1024;                                      //10M 값
	try{
		File f = new File(uploadPath);
		if(!f.exists())  f.mkdirs();           //업로드되는 폴더가 없는 경우, 폴더 생성
	}catch(Exception e){
		e.printStackTrace();
	}
	/*
	  MultipartRequest
		request : 요청 객체. 실질적으로 파라미터정보와 파일 정보(이름, 내용)를 저장하고 있는 객체
		uploadPath : 파일이 업로드되는 위치
		size : 업로드할 수 있는 최대 파일 크기
		"euc-kr" : 파라미터값의 인코딩 설정
		=> 객체 생성시 파일 업로드 완료됨.
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");
%>
업로드 위치 : <%=uploadPath %><br>
올린 사람 : <%=name %><br>
제목 : <%=title %><br>
파일 : <a href="<%=fname %>"><%=fname %></a><br>
</body>
</html>