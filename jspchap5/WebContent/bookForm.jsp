<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/bookForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �۾��� ȭ��</title>
<script type="text/javascript">
	function up(f){
		if(f.name.value == ""){
			alert("�̸��� �Է��ϼ���");
			f.name.focus();
			return false;
		}
		if(f.title.value == ""){
			alert("������ �Է��ϼ���")
			f.title.focus();
			return false;
		}
		if(f.contents.value == ""){
			alert("������ �Է��ϼ���")
			f.contents.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form action="book.jsp" name="f" method="post" onsubmit="return up(this)">
<table>
<tr><td>�湮�� </td><td><input type="text" name="name"></td></tr>
<tr><td>����</td><td><input type="text" name="title"></td></tr>
<tr><td>����</td><td><textarea rows="10" cols="60" name="contents"></textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="�۾���"></td></tr>
</table>
</form>
</body>
</html>