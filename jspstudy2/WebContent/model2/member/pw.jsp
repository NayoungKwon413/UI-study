<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%--/WebContent/model2/member/pw.jsp --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pw찾기</title>
</head>
<body>
<h1>비밀번호</h1>
<h3>**${fn:substring(pw,2,pw.length())}</h3>
<input type="button" value="닫기" onclick="window.close()">
</body>
</html>
