<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContet/model1/member/id.jsp 
	1. 파라미터값 저장
	2. 파라미터 중 하나 없는 경우 메세지 출력
	3. 파라미터값과 db 데이터와 비교
	4. 파라미터값과 일치하는 db 데이터의 id 값
--%>
<%
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String id = new MemberDao().findid(email,tel);
	if(id == null){
%>
	<script>
	alert("일치하는 회원정보가 없습니다. 회원가입을 시도하십시오.")
	location.href="joinForm.jsp"
	</script>						
<%}else{ 
	String msg = id.substring(0, id.length()-2) + "**";

%>
	

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
	<td><%=msg %></td></tr>
<tr><td colspan="2">
	<input type="button" value="아이디전송" onclick="idsend('<%=id.substring(0,id.length()-2)%>')">
	</td></tr>	
</table>
</body>
</html>
<% }%>