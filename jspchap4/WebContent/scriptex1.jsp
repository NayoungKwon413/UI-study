<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/scriptex1.jsp
	��ũ��Ʈ(Script) ���� : �ڹ� ����
	��ũ��Ʈ�� : <%    %>
	ǥ���� 	: <%=   %>
	����	: <%!   %>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ũ��Ʈ ����</title>
</head>
<body>
<%  //��ũ��Ʈ��(scriptlet)
	String msg="��ũ��Ʈ ����";
	for(int i=1; i<=10; i++){
%>
<%-- ǥ���� : �������� ���� ���.
		1. ��(����, ����, ���ϰ��� �ִ� �޼���)�� ����. 
		2. ;���� ���� ����.
		3. �ּ�ó�� ��, �����ּ� �Ұ���. ������ �ּ��� ����
--%>
<%=i+ ":" + msg /* ǥ���� */ %><br>
<% } %>
<%! //���� : ������ ����� ������. 
	String msg = "�������� ������ msg ����";
	String getMsg() {
		return msg;
	}
%>
</body>
</html>