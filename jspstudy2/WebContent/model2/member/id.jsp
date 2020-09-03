<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%-- /WebContet/model2/member/id.jsp --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id찾기</title>
<script type="text/javascript">
	function idsend(id){
		opener.document.f.id.value = id;
		self.close();
	}
</script>
</head>
<body>
<table>
<tr><th>아이디</th>
	<td>${id.substring(0,id.length()-2)}**</td></tr>
<tr><td colspan="2">
	<input type="button" value="아이디전송" onclick="idsend('${id.substring(0,id.length()-2)}')">
	</td></tr>	
</table>
</body>
</html>
