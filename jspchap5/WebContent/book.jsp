<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/book.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<style type="text/css">
 table {width:100%; border-collapse: collapse;}
 td {border : 3px solid #bcbcbc; text-align : left; padding : 8px;}
 caption {color : #111111; font-size : 20px; text-align : center;}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	Date now = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss");
%>

<table><caption>����</caption>
<tr><td>�湮��</td><td><%=name %></td></tr>
<tr><td>����</td><td><%=title %></td></tr>
<tr><td>����</td><td><%=contents %></td></tr>
<tr><td>�����</td><td><%=date.format(now)+" "+time.format(now) %></td></tr>
</table>
</body>
</html>