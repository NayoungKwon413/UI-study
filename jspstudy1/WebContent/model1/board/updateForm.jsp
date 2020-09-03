<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/updateForm.jsp 
	1. num 값에 해당하는 게시물을 조회
	2. 조회된 게시물을 화면에 출력하기
--%>
<%
	//1.  num 값에 해당하는 게시물을 조회
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	Board b = dao.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 수정화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value="";      // file2 의 값을 삭제
		file_desc.style.display="none"; // [첨부파일 삭제] 부분도 보이지 않게
	}
</script>
</head>
<body>
<form action="update.jsp" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="<%=b.getNum() %>">   <%--키값을 넘겨주는 것이 필수임 -> hidden으로 --%>
	<input type="hidden" name="file2" value="<%=b.getFile1()==null?"":b.getFile1() %>">
	<table><caption>게시판 수정 화면</caption>
	<tr><td>글쓴이</td>
	<td><input type="text" name="name" value="<%=b.getName() %>"></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>   <%-- 비밀번호는 기존의 값을 가져오지 않고 입력 받음 --%>
	<tr><td>제목</td><td><input type="text" name="subject" value="<%=b.getSubject() %>"></td></tr>
	<tr><td>내용</td><td><textarea rows="15" name="content"><%=b.getContent() %></textarea></td></tr>
	<tr><td>첨부파일</td><td style="text-align: left">
	<% if(b.getFile1() != null && (!b.getFile1().equals(""))) { %>
	<div id="file_desc"><%=b.getFile1() %>
	  <a href="javascript:file_delete()">[첨부파일 삭제]</a></div>      <%-- [첨부파일 삭제]를 클릭하면 file_delete() 함수로 연결 --%>
	<%} %>
	<input type="file" name="file1"></td></tr>
	<tr><td colspan="2">
	<a href="javascript:document.f.submit()">[게시물 수정]</a></td></tr>
	</table>
</form>
</body>
</html>