<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContet/model1/member/id.jsp 
	1. �Ķ���Ͱ� ����
	2. �Ķ���� �� �ϳ� ���� ��� �޼��� ���
	3. �Ķ���Ͱ��� db �����Ϳ� ��
	4. �Ķ���Ͱ��� ��ġ�ϴ� db �������� id ��
--%>
<%
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String id = new MemberDao().findid(email,tel);
	if(id == null){
%>
	<script>
	alert("��ġ�ϴ� ȸ�������� �����ϴ�. ȸ�������� �õ��Ͻʽÿ�.")
	location.href="joinForm.jsp"
	</script>						
<%}else{ 
	String msg = id.substring(0, id.length()-2) + "**";

%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>idã��</title>
<script type="text/javascript">
	function idsend(id){
		opener.document.f.id.value = id;
		self.close();
	}
</script>
</head>
<body>
<table>
<tr><th>���̵�</th>
	<td><%=msg %></td></tr>
<tr><td colspan="2">
	<input type="button" value="���̵�����" onclick="idsend('<%=id.substring(0,id.length()-2)%>')">
	</td></tr>	
</table>
</body>
</html>
<% }%>