<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/password.jsp 
	1. 로그아웃 상태인 경우, '로그인 하세요' 메세지 출력
		다른 사용자의 비밀번호는 변경 불가. 
		opener 페이지를 loginForm.jsp 페이지 이동. -> 현재페이지 닫기
	2. pass, chgpass 파라미터 값 저장
	3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면 비밀번호 오류 메세지 출력. passwordForm.jsp 페이지로 이동
	4. pass 비밀번호가 db에 저장된 비밀번호와 같으면 비밀번호 수정.
		opener 페이지를 updateForm.jsp 로 페이지 이동. -> 현재페이지 닫기
--%>
<%
	String login = (String)session.getAttribute("login");
	boolean opener = false;    //opener : 팝업창을 연 윈도우
	boolean closer = false;
	String msg = null;
	String url = null;
	if(login == null){   //로그아웃 상태일 경우,
		opener = true;
		closer = true;
		msg = "로그인 하세요";
		url = "loginForm.jsp";
	}else {   //로그인 상태일 경우,
		String pass = request.getParameter("pass");           //변경전 비밀번호
		String chgpass = request.getParameter("chgpass");     //변경후 비밀번호
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);   //비밀번호 변경은 로그인 당사자만 가능
		//pass : 입력한 현재 비밀번호
		//mem.getPass() : db에 저장된 비밀번호
		if(pass.equals(mem.getPass())) {    //입력된 비밀번호와 db에 저장된 비밀번호가 같은지 비교
			closer = true;
			if(dao.updatePass(login, chgpass) > 0){
				msg = "비밀번호가 변경되었습니다.";
			}else{
				msg = "비밀번호 변경시 오류가 발생했습니다.";
			}
		}else{
			msg = "비밀번호 오류입니다. 다시 확인하세요.";
			url = "passwordForm.jsp";
		}
	}
%>
<script>
	alert("<%=msg%>");
	<% if(opener) {%>
		opener.location.href = "<%=url%>";
	<%} else {%>
		location.href = "<%=url%>";
	<% } %>
	<% if(closer) {%>
		self.close();
	<% } %>
</script>