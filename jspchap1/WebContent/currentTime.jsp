<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Calendar" %>
<%-- ���� ��� page ���þ� --%>
<%-- /WebContent/currentTime.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �ð�</title>
</head>
<body>
<%   //�ڹ��� ���� => �ڹ� �ڵ� ���
	Calendar c = Calendar.getInstance();
	int h = c.get(Calendar.HOUR_OF_DAY);
	int m = c.get(Calendar.MINUTE);
	int s = c.get(Calendar.SECOND);
%>
<h1>���� �ð��� <%=h %>��<%=m %>��<%=s %>�� �Դϴ�.</h1>
</body>
</html>