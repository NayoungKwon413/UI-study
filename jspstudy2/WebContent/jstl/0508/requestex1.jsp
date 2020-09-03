<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%-- /WebContent/requestex1.jsp
  String request.getParameter(�Ķ�����̸�) : �Ķ�����̸����� ���� �Ѱ� ���� 
  String[] request.getParameterValues(�Ķ�����̸�) 
                                          : �Ķ�����̸����� ���� ������ ����
  Enumeration request.getParameterNames(): ��û��ü������ �Ķ���͵��� �̸��鸸 ����
  //���ڵ� ��� ����
  request.setCharacterEncoding(���ڵ���) : �Ķ���Ͱ� ��ȸ���� ó���ؾ� ��.
                                         POST ��Ŀ��� ó����.
  GET ����� ��� server.xml ���� 8080 ��Ʈ ���� URIEncoding="���ڵ���" �߰��ϰ�
  server restart �ʿ�.                                         
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���� ����</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
�̸� : ${param.name}<br>
���� : ${param.age}<br>
���� : ${param.gender=='1'?"��":"��"}<br>
��� : ${param.hobby}<br>
����⵵ : ${param.year}<br>

<h3>��� ���� ��� ��ȸ�ϱ�</h3>
��� :
<c:forEach var="h" items="${paramValues.hobby}">
	${h}&nbsp;&nbsp;
</c:forEach><br>

<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table><tr><th>�Ķ�����̸�</th><th>�Ķ���Ͱ�</th></tr>
<c:forEach var="p" items="${paramValues}">
	<tr><td>${p.key}</td>
		<c:forEach var="pv" items="${p.value}">
		<td>${pv}&nbsp;&nbsp;
		</c:forEach></td>
</c:forEach>
</tr></table>
</body>
</html>