<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/requestex1.jsp 
	String request.getParameter(�Ķ�����̸�) : �Ķ�����̸����� ���� �Ѱ��� ����(���� ��� ���ڿ�)
	String[] request.getParameterValues(�Ķ�����̸�) : �Ķ�����̸����� ���� ������ ����(���� ��� ���ڿ�)
	Enumeration request.getParameterNames() : ��û ��ü �ȿ� �ִ� �Ķ���͵��� �̸��鸸 ����
												���� �ִ� �޼���� hasMoreElements(),
	//���ڵ� ��� ����
	request.setCharacterEncoding(���ڵ� ��) : �Ķ���� �� ��ȸ ���� ó���ؾ� ��.
											POST ��Ŀ��� ó����.
											GET ����� ���, server.xml ���� 8080 ��Ʈ���� URIEncoding="���ڵ���" �߰��ϰ� server restart �ʿ�.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���� ����</title>
</head>
<body>
<%
//�Ķ���Ϳ� ���� �ѱ��� ���ڵ� ��� ����. �ѱ� �Ķ���� ó��
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");  //name �� 'name'�� �Ķ���Ͱ��� ��û
	String age = request.getParameter("age");    //name �� 'age'�� �Ķ���Ͱ��� ��û
	String gender = request.getParameter("gender"); 
	String hobby = request.getParameter("hobby");   // name�� 'hobby' �� �Ķ���Ͱ��� ��û -> ������ �����ص� �ϳ��� ��°���.
	String year = request.getParameter("year");
%>
�̸� : <%=name %><br>
���� : <%=age %><br>
���� : <%=gender.equals("1")?"��":"��" %><br>
��� : <%=hobby %><br>
����⵵ : <%=year %><br>
<h3>��� ���� ��� ��ȸ�ϱ�</h3>
���:
<%
	String[] hobbies = request.getParameterValues("hobby");   //���� �������� ��� �̸� ��� ����ϰ��� �Ѵٸ� request.getParameterValues ���
	for(String h : hobbies){%>
	<%=h %>&nbsp;&nbsp;
<% } %>	
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table><tr><th>�Ķ�����̸�</th><th>�Ķ���Ͱ�</th></tr>
<%
	//Enumeration: Iterator �� ������. �ݺ���
	Enumeration e = request.getParameterNames();   
	while(e.hasMoreElements()){
		String pname = (String)e.nextElement();
		String[] pvalue = request.getParameterValues(pname);
%>
<tr><td><%=pname %></td>
	<td><% for(String v : pvalue) { %>
		<%=v %>&nbsp;&nbsp;
		<% } %>
		</td></tr><% } %></table>
</body>
</html>
