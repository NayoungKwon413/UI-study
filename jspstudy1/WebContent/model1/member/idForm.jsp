<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/idForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�ã��</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f){
		if(f.email.value == ''){
			alert("�̸����� �Է��ϼ���");
			f.email.focus();
			return false;
		}
		if(f.tel.value == ''){
			alert("��ȭ��ȣ�� �Է��ϼ���");
			f.tel.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="id.jsp" method="post" name="f" onsubmit="return inputcheck(this)">
<h1>���̵�ã��</h1>
<table>
<tr><th>�̸���</th><td><input type="text" name="email"></td></tr>
<tr><th>��ȭ��ȣ</th><td><input type="text" name="tel"></td></tr>
<tr><td colspan="2"><input type="submit" value="���̵�ã��"></td></tr>
</table>
</form>
</body>
</html>