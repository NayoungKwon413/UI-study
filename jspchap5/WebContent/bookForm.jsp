<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/bookForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 글쓰기 화면</title>
<script type="text/javascript">
	function up(f){
		if(f.name.value == ""){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if(f.title.value == ""){
			alert("제목을 입력하세요")
			f.title.focus();
			return false;
		}
		if(f.contents.value == ""){
			alert("내용을 입력하세요")
			f.contents.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form action="book.jsp" name="f" method="post" onsubmit="return up(this)">
<table>
<tr><td>방문자 </td><td><input type="text" name="name"></td></tr>
<tr><td>제목</td><td><input type="text" name="title"></td></tr>
<tr><td>내용</td><td><textarea rows="10" cols="60" name="contents"></textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="글쓰기"></td></tr>
</table>
</form>
</body>
</html>