<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/0507/test2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>testform.jsp ��� ȭ��</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
�̸�: ${param.name}<br>
����: ${param.age}<br>
����: ${param.gender==1?"��":"��"}<br>
����⵵: ${param.year}<br>
����: �� ${2020 - param.year}��<br>
</body>
</html>