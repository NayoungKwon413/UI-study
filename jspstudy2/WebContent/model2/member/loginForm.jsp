<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/loginForm.jsp 
	1. jspstydy1���� src/model/ ��Ű���� ��� ������ jspstudy2 �� ����
	2. jspstydy1�� WebContent/model1/member, board ������ ��� ���� jspstudy2 �� WebContent/model2 �� ����
	3. jspstydy1�� WebContent/WEB-INF/lib ������ ��� ������ jspstydy2�� WebContent/WEB-INF/lib ������ ����
	4. jspstudy1�� WebContent/css ������ jspstudy2 �� ����
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<!--<link rel="stylesheet" href="../../css/main.css"> -->
<script type="text/javascript">
	function inputcheck(f){
		if(f.id.value == ''){
			alert("���̵� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4){
			alert("���̵�� 4�ڸ� �̻� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.pass.value == ''){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page){
		var op = "width=800, height=600, menubar=no, top=20, left=200";
		open(page+ ".me","", op);
	}
</script>
</head>
<body>
<%-- login.me -> ControllerServlet ȣ�� -> LoginAction �޼��� ȣ�� --%>
<form action="login.me" method="post" name="f" onsubmit="return inputcheck(this)">
<table><caption>�α���</caption>
<tr><th>���̵�</th><td><input type="text" name="id"></td></tr>
<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
	<input type="submit" value="�α���">
	<input type="button" value="ȸ������" onclick="location.href='joinForm.me'">
	<input type="button" value="���̵�ã��" onclick="win_open('idForm');">
	<input type="button" value="��й�ȣã��" onclick="win_open('pwForm');">
</td></tr>
</table>
</form>
</body>
</html>