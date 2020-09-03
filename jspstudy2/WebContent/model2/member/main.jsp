<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/main.jsp 
	1. 로그인 여부 검증
	로그인 상태 : 현재 화면
	로그아웃 상태 : "로그인하세요" 메세지 출력 후 loginForm.jsp 로 페이지 이동
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
</head>
<body>

<!-- <h3><a href="logout.me">로그아웃</a></h3>  -->
<h3><a href="info.me?id=${sessionScope.login}">회원정보보기</a></h3>
<c:if test="${sessionScope.login == 'admin'}">
<h3><a href="list.me">회원목록 보기</a></h3>
</c:if>
</body>
</html>
