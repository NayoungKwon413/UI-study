<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��¥ ���</title>
</head>
<body>
<%
	String date = request.getParameter("date");
	List<String> datecart = (List<String>)session.getAttribute("datecart");
	if(datecart == null){   //�Ӽ��� ��ϵ��� ���� ���
		datecart = new ArrayList<String>();
		session.setAttribute("datecart", datecart);  //�Ӽ� ���
	}  
	datecart.add(date);  
%>

</body>
</html>