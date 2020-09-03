<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
int sum=0;
for(int i=1; i<=num; i++) { 
sum += i; 
} %>
<%=num %>까지의 합:<%=sum %>
</body>
</html>