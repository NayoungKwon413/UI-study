<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/commentex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP���� ���Ǵ� �ּ�</title>
<%
	String msg = "jsp �ּ����� �Դϴ�.";
%>
</head>
<body>
<h1>jsp ���������� ���Ǵ� �ּ� 3����</h1>
<ol>
	<li>jsp �ּ� : &lt;%-- jsp �ּ�ǥ�� --%&gt;</li>
	<%-- jsp �ּ��Դϴ�. : jsp ������������ �������ϴ�.
		���� ��ȯ�� ���ܵǴ� �κ��Դϴ�. ��ȯ�� ���������� �������� �ʽ��ϴ�. --%>
	<li>java �ּ� : &lt;% //java �ּ�ǥ�� %&gt;</li>
	<%
		//�ڹ� ���� �ּ��Դϴ�.
		/* �ڹ� ������ �ּ��Դϴ�. �ڹ� �ּ��� �����Ͻ� �ּ��̹Ƿ� ���� ���������� �������ϴ�.(����Ʈ�ڵ�δ� �Ѿ�� ����) */
	%>
	<li>html �ּ�: &lt;!-- jsp �ּ�ǥ�� --&gt;</li>
	<!-- html �ּ��Դϴ�.
		jsp ��������, ���������� �ּ��� �ƴմϴ�.
		�������� �ҽ����⿡�� �� �� �ֽ��ϴ�. �������� ������ �ּ����� �ν��մϴ�. 
		<%=msg%>-->
</ol>
</body>
</html>