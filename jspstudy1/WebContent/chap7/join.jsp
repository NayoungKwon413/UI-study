<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspstudy1/WebContent/chap7/join.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="member" class="chap7.Member" scope="page"/>
<jsp:setProperty property="*" name="member"/>
<%--
	join.setName(request.getParameter("name"));
	...
	join.setAge(Integer.parseInt(request.getParameter("age")));  => �˾Ƽ� ���������� ��������
 --%>
<table><caption>ȸ������</caption>
<tr><td>���̵�</td><td><jsp:getProperty name="member" property="id"/></td></tr>
<tr><td>��й�ȣ</td><td><jsp:getProperty name="member" property="pass"/></td></tr>
<tr><td>�̸�</td><td><jsp:getProperty name="member" property="name"/></td></tr>
<tr><td>����</td><td><%=member.getGender()==1?"����":"����" %></td></tr>
<%-- member.getGender2() : member ��� ��ü���� getGender2() ��� �޼��带 ȣ�� --%>
<tr><td>����</td><td><jsp:getProperty name="member" property="gender2"/></td></tr>
<tr><td>����</td><td><jsp:getProperty name="member" property="age"/></td></tr>
<tr><td>�̸���</td><td><jsp:getProperty name="member" property="email"/></td></tr>
</table>
</body>
</html>