<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessionex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session 객체</title>
</head>
<body>
<h2>session 객체 : 브라우저의 상태 정보를 저장하는 객체</h2>
<%
	session.setMaxInactiveInterval(10);  //session 유지시간 10초로 설정.(기본적으로는 30분으로 설정되어 있음.)
%>
<h3>session 정보</h3>
isNew() : <%=session.isNew() %><br>
생성시간 : <%=session.getCreationTime() %><br>          <%-- 1970년 기준 밀리초로 전달 --%>
최종접속시간 : <%=session.getLastAccessedTime() %><br>   <%-- 1970년 기준 밀리초로 전달 --%>
sessionId : <%=session.getId() %><br>
</body>
</html>