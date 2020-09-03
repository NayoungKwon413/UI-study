<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/updateForm.jsp 
	1. id 파라미터 조회
	2. login 정보 조회
		- 로그아웃 상태라면 : "로그인하세요" 메세지 출력 후 loginForm.jsp 로 페이지 이동
	3. 내 정보가 아닌 경우거나 관리자도 아닌 경우, "내 정보만 수정 가능합니다" 메세지 출력 후 main.jsp 로 페이지 이동
	4. 내 정보이거나 관리자인 경우
		id 정보를 db에서 읽어 Member 객체에 저장
	5. Member 객체를 화면에 출력
--%>

<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	if(login == null){%>
	<script>
	alert("로그인이 필요합니다")
	location.href = "loginForm.jsp"
	</script>
<%}else if( !login.equals(id) && !login.equals("admin")) { %>
	<script>
	alert("내 정보만 수정 가능합니다")
	location.href = "main.jsp"
	</script>
<%}else {
	Member mem = new MemberDao().selectOne(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f){
<% if(!login.equals("admin")) { %>
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요")
			f.pass.focus();
			return false;
		}
<% } %>
	}
	function win_passchg(){
		var op = "width=500, height=250, left=50, top=150";
		open("passwordForm.jsp","",op);
	}
	function win_upload(){
		var op = "width=500, height=150, left=50, top=150";
		open("pictureForm.jsp","",op);
	}
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
  <input type="hidden" name="picture" value="<%=mem.getPicture()%>">       <%-- <%=mem.getPicture()%> : 기존 이미지 --%>
<table><caption>회원 정보 수정</caption>
<tr><td rowspan="4" valign="bottom">
	<img src="picture/<%=mem.getPicture()%>" width="150" height="160" id="pic"><br>
	<font size="1"><a href="javascript:win_upload()">사진수정</a></font></td>
	<%-- readonly value : 파라미터값은 있으나 수정할 수는 없음. --%>
	<th>아이디</th><td><input type="text" name="id" readonly value="<%=mem.getId()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>이름</td><td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
<tr><td>성별</td><td><input type="radio" name="gender" value="1"<%=mem.getGender()==1?"checked":"" %>>남
					<input type="radio" name="gender" value="2"<%=mem.getGender()==2?"checked":"" %>>여</td></tr>
<tr><td>전화번호</td><td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
<tr><td>이메일</td><td colspan="2"><input type="text" name="email" value="<%=mem.getEmail()%>"></td></tr>
<tr><td colspan="3"><input type="submit" value="회원수정">
<% if(!login.equals("admin")) {%>
<input type="button" value="비밀번호수정" onclick="win_passchg()">
<%} %></td></tr>
</table>
</form>
</body>
</html>
<% } %>