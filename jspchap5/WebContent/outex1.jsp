<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/outex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>out ���尴ü ����</title>
</head>
<body>
<h3>out ��ü�� response ��ü�� ��¹��ۿ� �����͸� ���� �� �ִ� ��� ��Ʈ�� ��ü��.</h3>
<%
	int sum=0;
	for(int i=1; i<=10; i++){
		sum += i;%>
	1���� <%=i %>������ �κ��� : <%=sum %><br>
<% } %>	
<hr>
<%
	sum =0;
	for(int i=1; i<=10; i++){
		sum += i;
		out.println("1���� " + i + "������ �κ��� : " + sum + "<br>");
	}

	Enumeration e = config.getInitParameterNames();   //config ���尴ü�̹Ƿ� ���� ���� ���� �ٷ� ��밡��
	while(e.hasMoreElements()){
		String o = (String)e.nextElement();
		out.println(o + "=" + config.getInitParameter(o) + "<br>");
	}
%>
<hr>
<%
	// page : outex1_jsp Ŭ���� ��ü. 
	if(page == this){  
		out.println("page ��ü�� this ��ü�� ���� ��ü��");
	}
%>
</body>
</html>