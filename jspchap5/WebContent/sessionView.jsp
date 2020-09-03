<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/sessionView.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니 보기</title>
</head>
<body>
<%
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart == null || cart.size() == 0) {
%>
<h3>장바구니에 상품이 없습니다.</h3>
<% }else { %>
<h3>장바구니 상품</h3>
<% for(String p : cart) { %>
	<h4><%=p %></h4>
<% } }
	session.removeAttribute("cart");   //"cart"라는 이름을 가진 속성을 제거
	session.invalidate();  //session 새로운 객체로 다시 생성
%>
</body>
</html>