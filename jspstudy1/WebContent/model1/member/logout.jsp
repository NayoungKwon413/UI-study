<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp 
	1. session �α��� ���� ����
	2. loginForm.jsp �� ������ �̵�
--%>
<%
	session.invalidate();
	response.sendRedirect("loginForm.jsp");
%>