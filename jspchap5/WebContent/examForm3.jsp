<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/examForm3.jsp
	: ���ڸ� �Է¹޵��� ����
	  exam3.jsp ���� ����� ����ϱ�
	  ������ ����� �Ҽ��� ���� 2�ڸ������� ����ϱ�
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<script type="text/javascript">
function inputcheck(f, kbn){
	if(isNaN(f.num1.value)){
		alert("���ڸ� �Է��ϼ���");
		f.num1.focus();
		f.num1.value="0";
		return false;
	}else if(isNaN(f.num2.value)){
		alert("���ڸ� �Է��ϼ���");
		f.num2.focus();
		f.num2.value="0";
		return false;
	}
	if(f.num1.value == "") {
		alert("���ڸ� �Է��ϼ���");
		f.num1.focus();
		return false;
	}else if(f.num2.value ==""){
		alert("���ڸ� �Է��ϼ���");
		f.num2.focus();
		return false;
	}
	f.kbn.value = kbn;
	f.submit();
}
</script>
</head>
<body>
<form action="exam3.jsp" method="post">
<input type="hidden" name="kbn" value="0">
���� 1 : <input type="text" name="num1"><br>
���� 2 : <input type="text" name="num2"><br>
<input type="button" value="+" onclick="inputcheck(this.form,this.value)">
<input type="button" value="-" onclick="inputcheck(this.form,this.value)">
<input type="button" value="*" onclick="inputcheck(this.form,this.value)">
<input type="button" value="/" onclick="inputcheck(this.form,this.value)">
</form>
</body>
</html>