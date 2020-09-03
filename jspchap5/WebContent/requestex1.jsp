<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/requestex1.jsp 
	String request.getParameter(파라미터이름) : 파라미터이름으로 값을 한개만 리턴(값은 모두 문자열)
	String[] request.getParameterValues(파라미터이름) : 파라미터이름으로 값을 여러개 리턴(값은 모두 문자열)
	Enumeration request.getParameterNames() : 요청 객체 안에 있는 파라미터들의 이름들만 리턴
												쓸수 있는 메서드는 hasMoreElements(),
	//인코딩 방식 설정
	request.setCharacterEncoding(인코딩 명) : 파라미터 값 조회 전에 처리해야 함.
											POST 방식에서 처리됨.
											GET 방식인 경우, server.xml 에서 8080 포트란에 URIEncoding="인코딩명" 추가하고 server restart 필요.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전송된 파라미터 정보</title>
</head>
<body>
<%
//파라미터에 사용된 한글을 인코딩 방식 설정. 한글 파라미터 처리
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");  //name 이 'name'인 파라미터값을 요청
	String age = request.getParameter("age");    //name 이 'age'인 파라미터값을 요청
	String gender = request.getParameter("gender"); 
	String hobby = request.getParameter("hobby");   // name이 'hobby' 인 파라미터값을 요청 -> 여러개 선택해도 하나만 출력가능.
	String year = request.getParameter("year");
%>
이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender.equals("1")?"남":"여" %><br>
취미 : <%=hobby %><br>
출생년도 : <%=year %><br>
<h3>취미 정보 모두 조회하기</h3>
취미:
<%
	String[] hobbies = request.getParameterValues("hobby");   //값이 여러개인 경우 이를 모두 출력하고자 한다면 request.getParameterValues 사용
	for(String h : hobbies){%>
	<%=h %>&nbsp;&nbsp;
<% } %>	
<h3>모든 파라미터 정보 조회하기</h3>
<table><tr><th>파라미터이름</th><th>파라미터값</th></tr>
<%
	//Enumeration: Iterator 의 구버전. 반복자
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
