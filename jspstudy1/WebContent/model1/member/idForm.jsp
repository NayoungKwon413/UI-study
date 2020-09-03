<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/idForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디찾기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f){
		if(f.email.value == ''){
			alert("이메일을 입력하세요");
			f.email.focus();
			return false;
		}
		if(f.tel.value == ''){
			alert("전화번호를 입력하세요");
			f.tel.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="id.jsp" method="post" name="f" onsubmit="return inputcheck(this)">
<h1>아이디찾기</h1>
<table>
<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
<tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
<tr><td colspan="2"><input type="submit" value="아이디찾기"></td></tr>
</table>
</form>
</body>
</html>