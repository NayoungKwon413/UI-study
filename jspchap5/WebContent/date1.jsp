<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/date1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��¥�� ���ǿ� ����ϱ�</title>
</head>
<body>
<form action="date2.jsp" method="post">
<%
	Date now = new Date();
	SimpleDateFormat nowdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
	String date = nowdate.format(now);
	session.setAttribute("date", date);    //�Ӽ� ���
%>
<h1>��ϵ� ��¥ : <%=date %></h1>
</form><a href="date2.jsp">date2.jsp</a>
</body>
</html>