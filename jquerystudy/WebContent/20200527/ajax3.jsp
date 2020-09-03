<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!-- /WebContent/20200527/ajax3.jsp -->

<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/classdb"
	user="scott" password="4151" />
<sql:query var="rs" dataSource="${conn}">
	select id from member where id = ?
	<sql:param>${param.id}</sql:param>
</sql:query>
<c:if test="${!empty rs.rows}">
	<h1 class="find">존재하는 아이디입니다.</h1>
</c:if>
<c:if test="${empty rs.rows}">
	<h1>사용 가능한 아이디입니다.</h1>
</c:if>