<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>500���� �߻� ������</title>
</head>
<body>
<%=Integer.parseInt("abc") %>
<%--
	error ������ ������ �켱 ����
	1. �ش� ���������� ���� ������ ����
		<%@ page errorPage="error.jsp" %>
	2. web.xml ���� ������ ���� Ŭ������ ����
		<exception-type>....
	3. web.xml ���� http���� �ڵ庰 ����
		<error-code>...
	4. ��Ĺ(�������̳�)���� �⺻���� �����ϴ� ���� ������
 --%>
</body>
</html>