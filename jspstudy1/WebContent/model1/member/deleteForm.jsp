<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/deleteForm.jsp 
	1. id �Ķ���� ����
	2. login ���� ����
		�α׾ƿ� ������ ���, �α����ϼ��� �޼��� ��� �� loginForm.jsp ������ �̵�
	3. ����ȭ�� ����ϱ�
--%>
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	if(login == null){%>
	<script>
	alert("�α����ϼ���");
	location.href="loginForm.jsp";
	</script>
<% } else{%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ �Է�</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.jsp" method="post">
	<input type="hidden" name="id" value="<%=id%>">
<table><caption>ȸ�� ��й�ȣ �Է�</caption>
<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type="submit" value="Ż���ϱ�"></td></tr>
</table>
</form>
</body>
</html>
<%}%>