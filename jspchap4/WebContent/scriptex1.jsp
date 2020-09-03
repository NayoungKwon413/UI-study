<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/scriptex1.jsp
	스크립트(Script) 예제 : 자바 영역
	스크립트릿 : <%    %>
	표현식 	: <%=   %>
	선언문	: <%!   %>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스크립트 예제</title>
</head>
<body>
<%  //스크립트릿(scriptlet)
	String msg="스크립트 예제";
	for(int i=1; i<=10; i++){
%>
<%-- 표현식 : 브라우저에 값을 출력.
		1. 값(변수, 수식, 리턴값이 있는 메서드)만 가능. 
		2. ;으로 종료 안함.
		3. 주석처리 시, 한줄주석 불가능. 여러줄 주석은 가능
--%>
<%=i+ ":" + msg /* 표현식 */ %><br>
<% } %>
<%! //선언문 : 서블릿의 멤버로 설정됨. 
	String msg = "선언문으로 선언한 msg 변수";
	String getMsg() {
		return msg;
	}
%>
</body>
</html>