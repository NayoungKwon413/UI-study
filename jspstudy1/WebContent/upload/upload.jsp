<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/upload.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ���</title>
</head>
<body>
<%
	//������ ���ε�Ǵ� ��ġ�� ����
	String uploadPath = application.getRealPath("/")+"upload/";   //uploadPath : application �� ���尴ü
	int size = 10*1024*1024;                                      //10M ��
	try{
		File f = new File(uploadPath);
		if(!f.exists())  f.mkdirs();           //���ε�Ǵ� ������ ���� ���, ���� ����
	}catch(Exception e){
		e.printStackTrace();
	}
	/*
	  MultipartRequest
		request : ��û ��ü. ���������� �Ķ���������� ���� ����(�̸�, ����)�� �����ϰ� �ִ� ��ü
		uploadPath : ������ ���ε�Ǵ� ��ġ
		size : ���ε��� �� �ִ� �ִ� ���� ũ��
		"euc-kr" : �Ķ���Ͱ��� ���ڵ� ����
		=> ��ü ������ ���� ���ε� �Ϸ��.
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");
%>
���ε� ��ġ : <%=uploadPath %><br>
�ø� ��� : <%=name %><br>
���� : <%=title %><br>
���� : <a href="<%=fname %>"><%=fname %></a><br>
</body>
</html>