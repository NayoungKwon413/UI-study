<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/pagedirective.jsp
	page ���þ� ���� - <%@ page ..... %>
	  page ���þ� : �Ӽ��� �̿��Ͽ� ���� �������� Ư¡�� ����.
	  	language="java" : �⺻��� java. �⺻��. ���� ������
	  	contentType     : �ݵ�� ����ؾ� ��.
	  					  text/html => html �������� �ۼ���
	  					  charset="euc-kr" => �ѱ��� euc-kr ������� �ۼ���.
	  	pageEncoding    : ���ڵ� ��� ����. charset �� ���� ���.
	  	import          : Ŭ������ ��Ű������ ���� �����ϵ��� ����. ������ ���� ����
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Date today1 = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
���� �Ͻ� : <% sf.format(today1); %>
</body>
</html>