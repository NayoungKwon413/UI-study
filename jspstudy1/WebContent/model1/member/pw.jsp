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
	alert("일치하는 회원 정보가 없습니다. 회원가입을 시도하십시오.")
	location.href="joinForm.jsp"
	</script>
<%}else{
	String msg = pw.replace(pw.substring(0, 2), "**");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pw찾기</title>
</head>
<body>
<h1>비밀번호</h1>
<h3><%=msg %></h3>
<input type="button" value="닫기" onclick="window.close()">
</body>
</html>
<% } %>