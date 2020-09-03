<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/exam3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 계산기(결과)</title>
</head>
<body>
<%
	String kbn = request.getParameter("kbn");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int res=0;
%>
	<% if(kbn.equals("+")) {
		res = num1 + num2;%>

	<%=num1 %>+<%=num2 %>=<%=res %>
<% }%> 

<% if(kbn.equals("-")){
	res = num1-num2; %>
	<%=num1 %>-<%=num2 %>=<%=res %>
<%}%> 

<% if(kbn.equals("*")){
	res = num1 * num2;
%>
	<%=num1 %>*<%=num2 %>=<%=res %>
<% }%>

<% 
	if(kbn.equals("/")){
		double res2 = (double)num1 / num2;
		String str = String.format("%.2f", res2);
%>
	<%=num1 %>/<%=num2 %>=<%=str %>
<% } %>
<%-- 
<%
double num1 = Double.parseDouble(request.getParameter("num1"));
double num2 = Double.parseDouble(request.getParameter("num2"));
String kbn = request.getParameter("kbn");
String sum = null;
switch(kbn){
case "+" : sum = String.format("%.2f", num+num2);break;
case "-" : sum = String.format("%.2f", num-num2);break;
case "*" : sum = String.format("%.2f", num*num2);break;
case "/" : sum = String.format("%.2f", num/num2);
}
%>
<%=num1 + kbn + num2 + "=" + sum %>
--%>
</body>
</html>