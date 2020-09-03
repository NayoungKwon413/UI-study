<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/join.jsp 
	1. 파라미터 정보를 Member에 저장 => useBean 액션태그
	2. Member 객체의 정보를 db 저장
	3. 회원가입 성공시 loginForm.jsp 로 페이지 이동
	4. 회원가입 실패시 joinForm.jsp 로 페이지 이동
--%>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member" scope="page"/>
<jsp:setProperty property="*" name="mem"/>
<%
	String msg = "회원가입 실패";
	String url = "joinForm.jsp";
	MemberDao dao = new MemberDao();  //model 클래스
	int result = dao.insert(mem);   //insert 메서드는 MemberDao의 멤버. 접근제어자는 public 리턴값은 int. 매개변수는  Member
	if(result > 0){
		msg = mem.getName() + "님 회원 가입 완료";
		url = "loginForm.jsp";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
