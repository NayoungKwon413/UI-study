<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/examForm2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Էµ� ���ڱ����� ��ü��, ¦����, Ȧ���� ���ϱ�</title>
<script type="text/javascript">
/*
 * f : form ��ü 
 * kbn : 0 or 1 or 2  �� �ϳ��� ��
 */
function inputcheck(f, kbn){
	if(isNaN(f.num.value)){
		alert("���ڸ� �Է��ϼ���");
		f.num.focus();
		f.num.value="";
		return false;
	}
	if(f.num.value == "") {
		alert("���ڸ� �Է��ϼ���");
		f.num.focus();
		return false;
	}
	f.kbn.value = kbn;   //name=kbn �±��� value ���� ����.
	f.submit();  //submit �߻�. �̺�Ʈ �߻� �ȵ�.
	             //exam2.jsp ������ form�� ������ �ִ� input ���� ������ �̵� 
}
</script>
</head>
<body>
<form action="exam2.jsp" method="post">
<input type="hidden" name="kbn" value="0">
<input type="text" name="num">������ �� ���ϱ�
<input type="button" value="��ü�հ�" onclick="inputcheck(this.form,0)">
<input type="button" value="¦���հ�" onclick="inputcheck(this.form,1)">
<input type="button" value="Ȧ���հ�" onclick="inputcheck(this.form,2)">
</form>
</body>
</html>