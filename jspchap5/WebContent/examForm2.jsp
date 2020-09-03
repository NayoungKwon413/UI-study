<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/examForm2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자까지의 전체합, 짝수합, 홀수합 구하기</title>
<script type="text/javascript">
/*
 * f : form 객체 
 * kbn : 0 or 1 or 2  중 하나의 값
 */
function inputcheck(f, kbn){
	if(isNaN(f.num.value)){
		alert("숫자만 입력하세요");
		f.num.focus();
		f.num.value="";
		return false;
	}
	if(f.num.value == "") {
		alert("숫자를 입력하세요");
		f.num.focus();
		return false;
	}
	f.kbn.value = kbn;   //name=kbn 태그의 value 값을 변경.
	f.submit();  //submit 발생. 이벤트 발생 안됨.
	             //exam2.jsp 페이지 form이 가지고 있는 input 값을 가지고 이동 
}
</script>
</head>
<body>
<form action="exam2.jsp" method="post">
<input type="hidden" name="kbn" value="0">
<input type="text" name="num">까지의 합 구하기
<input type="button" value="전체합계" onclick="inputcheck(this.form,0)">
<input type="button" value="짝수합계" onclick="inputcheck(this.form,1)">
<input type="button" value="홀수합계" onclick="inputcheck(this.form,2)">
</form>
</body>
</html>