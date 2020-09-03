<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp 
	1. session 로그인 정보 제거
	2. loginForm.jsp 로 페이지 이동
--%>
<%
	session.invalidate();
	response.sendRedirect("loginForm.jsp");
%>