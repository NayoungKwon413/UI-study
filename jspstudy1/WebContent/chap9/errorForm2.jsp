<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>500오류 발생 페이지</title>
</head>
<body>
<%=Integer.parseInt("abc") %>
<%--
	error 페이지 설정시 우선 순위
	1. 해당 페이지별로 오류 페이지 설정
		<%@ page errorPage="error.jsp" %>
	2. web.xml 에서 설정된 예외 클래스별 설정
		<exception-type>....
	3. web.xml 에서 http오류 코드별 설정
		<error-code>...
	4. 톰캣(웹컨테이너)에서 기본으로 제공하는 에러 페이지
 --%>
</body>
</html>