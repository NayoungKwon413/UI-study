<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>날짜 등록</title>
</head>
<body>
<%
	String date = request.getParameter("date");
	List<String> datecart = (List<String>)session.getAttribute("datecart");
	if(datecart == null){   //속성이 등록되지 않은 경우
		datecart = new ArrayList<String>();
		session.setAttribute("datecart", datecart);  //속성 등록
	}  
	datecart.add(date);  
%>

</body>
</html>