<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/responseex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>response 예제</title>
</head>
<body>
<h2>response 객체는 브라우저에 처리 결과를 전달해주는 응답 객체임.<br>
내부에 출력 버퍼를 가지고 있어서, 브라우저에 전달되는 내용을 저장하는 객체이다.<br>
response 객체를 이용하여 브라우저에서 다른 페이지를 다시 요청하도록 명령을 전달할 수 있다.</h2>
<h3>지금 작성 중인 내용은 화면에 출력되지 않는다.</h3>
<% response.sendRedirect("responseex2.jsp"); %>
</body>
</html>