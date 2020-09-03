<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/examForm3.jsp
	: 숫자만 입력받도록 검증
	  exam3.jsp 에서 결과를 출력하기
	  나누기 결과는 소숫점 이하 2자리까지만 출력하기
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 계산기</title>
<script type="text/javascript">
function inputcheck(f, kbn){
	if(isNaN(f.num1.value)){
		alert("숫자만 입력하세요");
		f.num1.focus();
		f.num1.value="0";
		return false;
	}else if(isNaN(f.num2.value)){
		alert("숫자만 입력하세요");
		f.num2.focus();
		f.num2.value="0";
		return false;
	}
	if(f.num1.value == "") {
		alert("숫자를 입력하세요");
		f.num1.focus();
		return false;
	}else if(f.num2.value ==""){
		alert("숫자를 입력하세요");
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
숫자 1 : <input type="text" name="num1"><br>
숫자 2 : <input type="text" name="num2"><br>
<input type="button" value="+" onclick="inputcheck(this.form,this.value)">
<input type="button" value="-" onclick="inputcheck(this.form,this.value)">
<input type="button" value="*" onclick="inputcheck(this.form,this.value)">
<input type="button" value="/" onclick="inputcheck(this.form,this.value)">
</form>
</body>
</html>