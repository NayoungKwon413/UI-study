<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%-- /WebContent/requestex1.jsp
  String request.getParameter(파라미터이름) : 파라미터이름으로 값을 한개 리턴 
  String[] request.getParameterValues(파라미터이름) 
                                          : 파라미터이름으로 값을 여러개 리턴
  Enumeration request.getParameterNames(): 요청객체내부의 파라미터들의 이름들만 리턴
  //인코딩 방식 설정
  request.setCharacterEncoding(인코딩명) : 파라미터값 조회전에 처리해야 함.
                                         POST 방식에서 처리됨.
  GET 방식인 경우 server.xml 에서 8080 포트 란에 URIEncoding="인코딩명" 추가하고
  server restart 필요.                                         
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전송된 파라미터 정보</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : ${param.gender=='1'?"남":"여"}<br>
취미 : ${param.hobby}<br>
출생년도 : ${param.year}<br>

<h3>취미 정보 모두 조회하기</h3>
취미 :
<c:forEach var="h" items="${paramValues.hobby}">
	${h}&nbsp;&nbsp;
</c:forEach><br>

<h3>모든 파라미터 정보 조회하기</h3>
<table><tr><th>파라미터이름</th><th>파라미터값</th></tr>
<c:forEach var="p" items="${paramValues}">
	<tr><td>${p.key}</td>
		<c:forEach var="pv" items="${p.value}">
		<td>${pv}&nbsp;&nbsp;
		</c:forEach></td>
</c:forEach>
</tr></table>
</body>
</html>