<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspstudy1/WebContent/chap7/book.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용보기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<%--
	<jsp:useBean id="book" class="chap7.Book" scope="page"/> 
	= Book book = new Book(); 
	  pageContext.setAttribute(book);
--%>
<jsp:useBean id="book" class="chap7.Book" scope="page"/>    <%-- jsp:useBean 액션태그 --%>
<jsp:setProperty property="*" name="book"/>
<jsp:setProperty property="name" param="writer" name="book"/>
<%--
	property="*" : parameter 이름과 property 이름이 같은 값을 Book 객체에 저장함.
	book.setName(request.getParameter("name"))
	... 
	request.getParameter("writer") 같은 이름의 set 프로퍼티가 없음 => 호출안됨.
 --%>
<table>
<caption>방명록 조회</caption>
<tr><td>작성자</td>
	<td><jsp:getProperty name="book" property="name"/>,
	<%=book.getName() %></td></tr>
<tr><td>제목</td>
	<td><jsp:getProperty name="book" property="title"/>
	<%=book.getTitle() %></td></tr>
<tr><td>내용</td>
	<td><jsp:getProperty name="book" property="content"/>
	<%=book.getContent() %></td></tr>
</table>
</body>
</html>