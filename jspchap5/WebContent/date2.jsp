<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session�� ��ϵ� ��¥�� ��ȸ�ϱ�</title>
</head>
<body>
<%
	String date = (String)session.getAttribute("date");
	if(date == null) {
%>
<script type="text/javascript">
alert("��ϵ� ��¥�� �����ϴ�.");
history.go(-1);
</script>
<% }else { %>
<h1>�ݰ����ϴ�. ��ϵ� ��¥ : <%=date %> </h1>
<% } 
	session.invalidate();  //session ���ο� ��ü�� �ٽ� ����
%>
</body>
</html>