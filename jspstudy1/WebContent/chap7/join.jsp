<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspstudy1/WebContent/chap7/join.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="member" class="chap7.Member" scope="page"/>
<jsp:setProperty property="*" name="member"/>
<%--
	join.setName(request.getParameter("name"));
	...
	join.setAge(Integer.parseInt(request.getParameter("age")));  => 알아서 정수형으로 변경해줌
 --%>
<table><caption>회원정보</caption>
<tr><td>아이디</td><td><jsp:getProperty name="member" property="id"/></td></tr>
<tr><td>비밀번호</td><td><jsp:getProperty name="member" property="pass"/></td></tr>
<tr><td>이름</td><td><jsp:getProperty name="member" property="name"/></td></tr>
<tr><td>성별</td><td><%=member.getGender()==1?"남자":"여자" %></td></tr>
<%-- member.getGender2() : member 라는 객체에서 getGender2() 라는 메서드를 호출 --%>
<tr><td>성별</td><td><jsp:getProperty name="member" property="gender2"/></td></tr>
<tr><td>나이</td><td><jsp:getProperty name="member" property="age"/></td></tr>
<tr><td>이메일</td><td><jsp:getProperty name="member" property="email"/></td></tr>
</table>
</body>
</html>