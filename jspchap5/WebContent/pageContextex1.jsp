<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/pageContextex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pageContext ����</title>
</head>
<body>
<h2>pageContext ��ü: ���� �������� �ڿ��� �����ϴ� ��ü</h2>
<% if(request == pageContext.getRequest()) { %>
request ��ü�� pageContext.getRequest() �� ������ ��ü�� ���� ��ü��<br>
<% } %>
<% if(response == pageContext.getResponse()) { %>
response ��ü�� pageContext.getResponse()�� ������ ��ü�� ���� ��ü��<br>
<% } %>
<% if(session == pageContext.getSession()) { %>
session ��ü�� pageContext.getSession() �� ������ ��ü�� ���� ��ü��<br>
<% } %>
<h3>pageContext ��ü�� page ������ ����ϴ� ���� ��� ��ü��.</h3>
<h3>������ ����ϴ� ��ü�� �Ӽ����� �޼��带 ����� ������.</h3>
pageContext.setAttribute(�Ӽ���, �Ӽ���)<br>
pageContext.setAttribute(�Ӽ���)<br>
pageContext.removeAttribute(�Ӽ���)<br>
</body>
</html>