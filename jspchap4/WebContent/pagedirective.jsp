<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/pagedirective.jsp
	page 지시어 예제 - <%@ page ..... %>
	  page 지시어 : 속성을 이용하여 현재 페이지의 특징을 설정.
	  	language="java" : 기본언어 java. 기본값. 생략 가능함
	  	contentType     : 반드시 기술해야 함.
	  					  text/html => html 형식으로 작성됨
	  					  charset="euc-kr" => 한글은 euc-kr 방식으로 작성됨.
	  	pageEncoding    : 인코딩 방식 설정. charset 과 같은 기능.
	  	import          : 클래스의 패키지명을 생략 가능하도록 설정. 여러번 구현 가능
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Date today1 = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
현재 일시 : <% sf.format(today1); %>
</body>
</html>