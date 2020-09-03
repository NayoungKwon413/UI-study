<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/exam2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>합 구하기</title>
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
	<%=num %>까지의 합:<%=sum %>
<% }else if(kbn == 1){
	for(int i=1; i<=num; i++){
		if(i%2 == 0) sum += i;
		else sum +=0;
	}%>
	<%=num %>까지의 짝수의 합:<%=sum %>
<% }else {
	for(int i=1; i<=num; i++){
		if(i%2 == 1) sum += i;
		else sum +=0;
	} %>
	<%=num %>까지의 홀수의 합:<%=sum %>
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
<%=num%> 까지의 
<%=(kbn.equals("0"))?"전체합계":kbn.equals("1")?"짝수합계":"홀수합계" %>
<%=sum %>
--%>

</body>
</html>