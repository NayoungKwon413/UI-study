<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/exam2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ���ϱ�</title>
</head>
<body>
<%
int kbn = Integer.parseInt(request.getParameter("kbn"));
int num = Integer.parseInt(request.getParameter("num"));
int sum=0;
if(kbn == 0){
	for(int i=1; i<=num; i++) { 
		sum += i; 
	}%>
	<%=num %>������ ��:<%=sum %>
<% }else if(kbn == 1){
	for(int i=1; i<=num; i++){
		if(i%2 == 0) sum += i;
		else sum +=0;
	}%>
	<%=num %>������ ¦���� ��:<%=sum %>
<% }else {
	for(int i=1; i<=num; i++){
		if(i%2 == 1) sum += i;
		else sum +=0;
	} %>
	<%=num %>������ Ȧ���� ��:<%=sum %>
<% } %>

<%-- 
<%
int num = Integer.parseInt(request.getParameter("num"));
String kbn = request.getParameter("kbn");
int sum=0;
for(int i=1; i<=num; i++){
	switch(kbn){
	case "0" : sum += i; break;
	case "1" : if(i%2 == 0) sum += i; break;
	case "2" : if(i%2 == 1) sum += i; break;
	}
}
%>
<%=num%> ������ 
<%=(kbn.equals("0"))?"��ü�հ�":kbn.equals("1")?"¦���հ�":"Ȧ���հ�" %>
<%=sum %>
--%>

</body>
</html>