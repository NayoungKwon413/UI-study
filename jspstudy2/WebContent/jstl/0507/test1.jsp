<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/jstl/0507/test1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL�� �̿��� ������ ����</title>
</head>
<body>
<form method="post" name="f">
	x: <input type="text" name="x" value="${param.x}">
	<select name="s">
	<option>+</option><option>-</option><option>*</option><option>/</option>
	</select>
	<script>   <%-- ������ �ɼ��� submit �� �Ŀ��� �����ϰԲ� ���� --%>
		var s = '${param.s}';
		if(s == '') s = '+';
		document.f.s.value = s;
	</script>
	y: <input type="text" name="y" value="${param.y}">
	<input type="submit" value="=">
</form>
<c:if test="${param.s == '+'}">
	<h2>${param.x} + ${param.y} = ${param.x + param.y}</h2>
</c:if>
<c:if test="${param.s == '-'}">
	<h2>${param.x} - ${param.y} = ${param.x - param.y}</h2>
</c:if>
<c:if test="${param.s == '*'}">
	<h2>${param.x} * ${param.y} = ${param.x * param.y}</h2>
</c:if>
<c:if test="${param.s == '/'}">
	<h2>${param.x} / ${param.y} = ${param.x / param.y}</h2>
</c:if>
</body>
</html>