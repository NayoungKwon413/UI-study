<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session에 등록된 날짜를 조회하기</title>
</head>
<body>
<%
	String date = (String)session.getAttribute("date");
	if(date == null) {
%>
<script type="text/javascript">
alert("등록된 날짜가 없습니다.");
history.go(-1);
</script>
<% }else { %>
<h1>반갑습니다. 등록된 날짜 : <%=date %> </h1>
<% } 
	session.invalidate();  //session 새로운 객체로 다시 생성
%>
</body>
</html>