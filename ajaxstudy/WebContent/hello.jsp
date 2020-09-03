<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hello.jsp 
	ajax에서 파라미터값은 전부 "UTF-8" 형식으로!
--%>
<% request.setCharacterEncoding("UTF-8"); %>  
<h3>안녕하세요 <font color="blue">${param.name}</font>입니다.</h3>