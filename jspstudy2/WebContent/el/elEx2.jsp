<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/el/elEx2.jsp 
	EL(표현언어) : 표현식의 대체 언어
				 ${값}
				 변수값은 표현 못함 => 속성이나 파라미터만 표현 가능
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp 의 결과 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel ="010-1111-2222";
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test", "pageContext test 속성");
	request.setAttribute("test", "request test 속성");
	application.setAttribute("test", "application test 속성");
%>
<h3>JSP의 스크립트를 이용하여 파라미터와 속성값 출력</h3>
pageContext test 속성값 : <%=pageContext.getAttribute("test") %><br>
session test 속성값 : <%=session.getAttribute("test") %><br>
today 속성값 : <%=session.getAttribute("today") %><br>
name 파라미터값 : <%=request.getParameter("name") %><br>
tel 변수값 : <%=tel %><br>
tel 속성값 : <%=pageContext.getAttribute("tel") %><br>
noAttr 속성값 : <%=pageContext.getAttribute("noAttr") %><br>
noparam 파라미터값 :<%=request.getParameter("noparam") %><br>
<hr>
<h3>JSP의 EL(표현)을 이용하여 파라미터와 속성값 출력</h3>
test 속성값 : ${test}<br>   
<%-- 
	속성이름만 넣어도 해당하는 내장객체 내의 속성값을 찾아옴.
	다른 내장객체들에 같은 이름의 속성들이 있을 때, 작은 단위부터 검사하므로 pageContext 속성이 출력됨.
	pageContext -> request -> session -> application 순으로 검사하고 모두 없다면 아무것도 출력하지 않음.
--%>
session test 속성값 : ${sessionScope.test }<br>
today 속성값 : ${today }<br>
name 파라미터값 : ${param.name }<br>
tel 변수값 : EL로는 표현 못함. <%=tel %><br>    <%-- 변수값은 EL로 표현 못함. 반드시 표현식 사용해야 --%>
tel 속성값 : ${tel }<br>             
noAttr 속성값 : ${noAttr }<br>              <%-- 값이 null 인 경우, 'null' 로 출력되지 않음. --%>
noparam 속성값 : ${param.noparam }<br>
<br><hr>
<h3>영역을 설정하여 test 속성값 출력</h3>
\${test } = ${test }<br>
\${pageScope.test } = ${pageScope.test }<br>
\${requestScope.test } = ${requestScope.test }<br>
\${sessionScope.test } = ${sessionScope.test }<br>
\${applicationScope.test } = ${applicationScope.test }<br>
<%--
	${test} : 영역담당 객체에 저장된 속성 중 이름이 test인 값을 리턴
	  1. pageContext 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
	  2. 1번에 해당하는 속성이 없는 경우,
	  	 request 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
	  3. 1,2번에 해당하는 속성이 없는 경우,
	  	 session 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
	  4. 1,2,3번에 해당하는 속성이 없는 경우,
	  	 application 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
	  5. 1,2,3,4번에 해당하는 속성이 없는 경우,
	  	 null 이 아니고, 아무것도 출력하지 않음. 오류 발생 안됨.
	  	 
	- 직접 영역 담당 객체의 속성을 지정하여 출력하기
		pageContext 객체의 속성 중 test값을 가져오기 -> ${pageScope.test}
		request 객체의 속성 중 test값을 가져오기 -> ${requestScope.test}
		session 객체의 속성 중 test값을 가져오기 -> ${sessionScope.test}
		application 객체의 속성 중 test값을 가져오기 -> ${applicationScope.test}
 --%>
</body>
</html>