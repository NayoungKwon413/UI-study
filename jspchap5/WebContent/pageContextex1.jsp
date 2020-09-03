<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/pageContextex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pageContext 예제</title>
</head>
<body>
<h2>pageContext 객체: 현재 페이지의 자원을 관리하는 객체</h2>
<% if(request == pageContext.getRequest()) { %>
request 객체와 pageContext.getRequest() 가 리턴한 객체는 같은 객체임<br>
<% } %>
<% if(response == pageContext.getResponse()) { %>
response 객체와 pageContext.getResponse()가 리턴한 객체는 같은 객체임<br>
<% } %>
<% if(session == pageContext.getSession()) { %>
session 객체와 pageContext.getSession() 가 리턴한 객체는 같은 객체임<br>
<% } %>
<h3>pageContext 객체는 page 영역을 담당하는 영역 담당 객체임.</h3>
<h3>영역을 담당하는 객체는 속성관련 메서드를 멤버로 가진다.</h3>
pageContext.setAttribute(속성명, 속성값)<br>
pageContext.setAttribute(속성명)<br>
pageContext.removeAttribute(속성명)<br>
</body>
</html>