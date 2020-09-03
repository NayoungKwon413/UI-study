<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/deleteForm.jsp 
	1. id 파라미터 저장
	2. login 여부 검증
		로그아웃 상태인 경우, 로그인하세요 메세지 출력 후 loginForm.jsp 페이지 이동
	3. 현재화면 출력하기
--%>
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	if(login == null){%>
	<script>
	alert("로그인하세요");
	location.href="loginForm.jsp";
	</script>
<% } else{%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴 비밀번호 입력</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.jsp" method="post">
	<input type="hidden" name="id" value="<%=id%>">
<table><caption>회원 비밀번호 입력</caption>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type="submit" value="탈퇴하기"></td></tr>
</table>
</form>
</body>
</html>
<%}%>