<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp 
	1. 모든 파라미터 정보를 Member 객체에 저장
	2. 입력된 비밀번호와 db에 저장된 비밀번호를 비교
		- 같지 않은 경우, "비밀번호 오류" 메세지 출력 후 updateForm.jsp 페이지로 이동
	3. 비밀번호가 일치하는 경우, 파라미터값을 저장한 Member 객체를 이용하여 db 정보를 수정
		int MemberDao.update(Member) 메서드 이용
		return 값 <0 => 수정 실패 메세지 출력 후 updateForm.jsp 로 페이지 이동
		return 값 >0 => 수정 성공 메세지 출력 후 info.jsp 로 페이지 이동 
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member"></jsp:useBean>
<jsp:setProperty property="*" name="mem"/>
<%
	String login = (String)session.getAttribute("login");
	Member dbmem = new MemberDao().selectOne(mem.getId());	
	if(login.equals("admin") || mem.getPass().equals(dbmem.getPass())){
		MemberDao dao = new MemberDao();
		int result =  dao.update(mem);
		if(result<0){%>
			<script>
			alert("수정 실패")
			location.href="updateForm.jsp?id=<%=mem.getId()%>"
			</script>
	<%	}else if(result >0){%>
		<script>
			alert("수정 성공")
			location.href="info.jsp?id=<%=mem.getId()%>"
		</script>
<%}else {%>
	<script>
	alert("비밀번호 오류")
	location.href="updateForm.jsp?id=<%=mem.getId()%>"
	</script>	
<%}
}%>

<%--
<%
	String login = (String)session.getAttribute("login");
	Member dbmem = null;
	if(!login.equals("admin")){
		dbmem = new MemberDao().selectOne(mem.getId());	
	}
	if(login.equals("admin") || mem.getPass().equals(dbmem.getPass())){
		MemberDao dao = new MemberDao();
		int result =  dao.update(mem);
		if(result<0){%>
			<script>
			alert("수정 실패")
			location.href="updateForm.jsp?id=<%=mem.getId()%>"
			</script>
	<%	}else if(result>0){%>
		<script>
			alert("수정 성공")
			location.href="info.jsp?id=<%=mem.getId()%>"
		</script>
<%}else {%>
	<script>
	alert("비밀번호 오류")
	location.href="updateForm.jsp?id=<%=mem.getId()%>"
	</script>	
<%}
}%>


 --%>
