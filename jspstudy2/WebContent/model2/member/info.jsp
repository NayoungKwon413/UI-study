<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/info.jsp 
	1. id 파라미터 값을 조회
	2. login 상태 검증
	   로그아웃 상태 : "로그인하세요" 메세지 출력 후 loginForm.jsp 로 페이지 이동
	3. login 상태 검증2
	   id 파라미터값과 login id가 다른 경우, "내 정보 조회만 가능합니다." 메세지 출력 후 main.jsp 페이지 이동
	4. db에서 id 값으로 데이터 조회 : selectOne(id) 사용
	5. 조회된 내용을 화면에 출력하기
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>회원 정보 보기</caption>
	<tr><td rowspan="6"><img src="picture/${mem.picture}" width="200" height="210"></td>
		<th>아이디</th><td>${mem.id}</td></tr>
	<tr><th>이름</th><td>${mem.name}</td></tr>
	<tr><th>성별</th><td>${mem.gender == 1?"남":"여"}</td></tr>
	<tr><th>전화</th><td>${mem.tel}</td></tr>
	<tr><th>이메일</th><td>${mem.email}</td></tr>
	<tr><td colspan="2"><a href="updateForm.me?id=${mem.id}">[수정]</a>
	<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
	</c:if></td></tr>
</table>
</body>
</html>
