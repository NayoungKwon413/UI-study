<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model1/member/list.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����Ϻ���</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function allchkbox(allchk){
		$("input[name=mailchk]").prop("checked", allchk.checked)
	}
</script>
</head>
<body>
<form action="mailform.me" method="post">
<table><caption>ȸ�� ���</caption>
<tr><th>���̵�</th><th>����</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>�̸���</th><th>&nbsp;</th>
	<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th></tr>
<c:forEach var="m" items="${list}">
<tr><td><a href="info.me?id=${m.id}">${m.id}</a></td>
	<td><img src="picture/sm_${m.picture}" width="90" height="100" id="pic"></td>
	<td>${m.name}</td>
	<td>${m.gender == 1?"��":"��"}</td>
	<td>${m.tel}</td>
	<td>${m.email}</td>
	<td><a href="updateForm.me?id=${m.id}">[����]</a>
		<c:if test="${m.id != 'admin'}">
			<a href="delete.me?id=${m.id}">[����Ż��]</a>
		</c:if></td>
	<td><input type="checkbox" name="mailchk" value="${m.email}"></td>
	</tr>   <%-- admin �� ���, ��й�ȣ �Է� ���� �ٷ� delete.jsp �������� �̵� --%>
</c:forEach>
<tr><td colspan="8" align="center"><input type="submit" value="���� ����"></td></tr>
</table>
</form>
</body>
</html>
