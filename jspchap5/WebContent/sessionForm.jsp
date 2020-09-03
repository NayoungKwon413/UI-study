<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessionForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session을 이용한 장바구니 예제</title>
</head>
<body>
<h3>상품선택</h3>
<form action="sessionAdd.jsp" method="post">
	<select name="product">
	  <option>사과</option><option>배</option><option>감</option>
	  <option>자몽</option><option>귤</option><option>딸기</option>
	</select>
	<input type="submit" value="장바구니추가">
</form><a href="sessionView.jsp">장바구니보기</a>
</body>
</html>