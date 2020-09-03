<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 현재 페이지에서 오류가 발생한 경우, error.jsp 페이지로 이동 --%>
<%@ page errorPage="error.jsp" %>
<%-- /WebContent/chap9/errorForm1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류 발생 페이지</title>
</head>
<body>
<%= request.getParameter("name").trim() %>
</body>
</html>