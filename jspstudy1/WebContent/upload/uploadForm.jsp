<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/uploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ����</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%--
	���� ���ε� �� �ݵ�� enctype="multipart/form-data" �� �����ؾ� ��.
	=> �Ķ���� ������ ������ ������ �̸��Ӹ� �ƴ϶� ������ ���뵵 �Բ� ������ �����ϵ��� �����ϴ� ��
	���� ���ε� ��, method �� ������ "post" ���(������ ������ url�� �̵��� �� ���� ����)
	** ���ǻ��� 
	enctype="multipart/form-data"�� ���� �Ѿ�� upload.jsp ������������ request ��ü�� ����� �� ����.
	=> cos.jar ���Ͽ� ������ MultipartRequest ��ü�� ����Ͽ� �Ķ���� ������ ������ ������ ����ؾ� ��.
--%>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
<table>
<tr><th>�ø� ���</th><td><input type="text" name="name"></td></tr>     <%-- �Ķ���� �� --%>
<tr><th>����</th><td><input type="text" name="title"></td></tr>       <%-- �Ķ���� �� --%>
<tr><th>����</th><td><input type="file" name="file1"></td></tr>  
<%-- ����Ž���� => ���� ���� => ������ �̵� => request ��ü ��ü�� ����� �� ���� => request ��ü�� ��ƿ��Ƽ(cos.jar)�� ���� �����Ͽ� ��밡��. --%>     
<tr><td colspan="2"><input type="submit" value="����"></td></tr>
</table>
</form>
</body>
</html>