<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/pw.jsp --%>

<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String pw = new MemberDao().findpw(id, email, tel);
	if(pw == null){%>
	<script>
	alert("��ġ�ϴ� ȸ�� ������ �����ϴ�. ȸ�������� �õ��Ͻʽÿ�.")
	location.href="joinForm.jsp"
	</script>
<%}else{
	String msg = pw.replace(pw.substring(0, 2), "**");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pwã��</title>
</head>
<body>
<h1>��й�ȣ</h1>
<h3><%=msg %></h3>
<input type="button" value="�ݱ�" onclick="window.close()">
</body>
</html>
<% } %>