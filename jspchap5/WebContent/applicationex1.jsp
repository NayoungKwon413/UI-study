<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/applicationex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application ��ü</title>
</head>
<body>
<h3>application ��ü�� �����ø����̼� �� �Ѱ��� ��ü�� �����˴ϴ�.<br>
���� �����ø����̼� jspchap5 ������Ʈ�� ��� jsp�� �ϳ��� application ��ü�� �����մϴ�.</h3>
<table border="1" style="border-collapse:collapse;">
	<tr><td>jsp ����</td>
		<td><%= application.getMajorVersion() %>.<%=application.getMinorVersion() %></td></tr>
	<tr><td>�� �����̳� ����(WAS ���� ����)</td>
		<td><%=application.getServerInfo() %></td></tr>
	<tr><td>�� ���ø����̼� ���</td>
		<td><%=application.getRealPath("/") %></td></tr>
</table>
<% application.setAttribute("test", "application ��ü�� test �Ӽ�"); %>
</body>
</html>