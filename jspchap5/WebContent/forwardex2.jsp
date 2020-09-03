<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/forwardex2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward 된 페이지</title>
</head>
<body>
<h1>이 페이지는 forwardex2.jsp 입니다.
forwardex1.jsp 페이지를 요청하면 이 페이지가 출력됩니다.
하지만 url 은 forwardex1.jsp로 남아 있습니다.
</h1>
<h2>name 파라미터 = <%=request.getParameter("name") %></h2>
</body>
</html>