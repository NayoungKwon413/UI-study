<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/board/updateForm.jsp --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ����ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value="";      // file2 �� ���� ����
		file_desc.style.display="none"; // [÷������ ����] �κе� ������ �ʰ�
	}
</script>
</head>
<body>
<form action="update.do" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="${b.num}">   <%--Ű���� �Ѱ��ִ� ���� �ʼ��� -> hidden���� --%>
	<input type="hidden" name="file2" value="${b.file1}">
	<table><caption>�Խ��� ���� ȭ��</caption>
	<tr><td>�۾���</td>
	<td><input type="text" name="name" value="${b.name}"></td></tr>
	<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>   <%-- ��й�ȣ�� ������ ���� �������� �ʰ� �Է� ���� --%>
	<tr><td>����</td><td><input type="text" name="subject" value="${b.subject}"></td></tr>
	<tr><td>����</td><td><textarea rows="15" name="content" id="content1">${b.content}</textarea></td></tr>
	<script>CKEDITOR.replace("content1", {
		filebrowserImageUploadUrl : "imgupload.do"
	});
	</script>
	<tr><td>÷������</td><td style="text-align: left">
	<c:if test="${!empty b.file1}">
		<div id="file_desc">${b.file1}
	  <a href="javascript:file_delete()">[÷������ ����]</a></div>      <%-- [÷������ ����]�� Ŭ���ϸ� file_delete() �Լ��� ���� --%>
	</c:if>
	<input type="file" name="file1"></td></tr>
	<tr><td colspan="2">
	<a href="javascript:document.f.submit()">[�Խù� ����]</a></td></tr>
	</table>
</form>
</body>
</html>