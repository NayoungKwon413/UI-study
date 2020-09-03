<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp 

--%>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	BoardDao dao = new BoardDao();
	Board db = dao.selectOne(num);
	String msg = "게시글의 비밀번호가 틀립니다.";
	String url = "deleteForm.jsp?num="+num;
	if(db == null){
		msg = "없는 게시글입니다.";
		url = "list.jsp";
	}else{
		if(pass.equals(db.getPass())){
			if(dao.delete(num)){
				msg = "게시글 삭제 완료";
				url = "list.jsp";
			}else{
				msg = "게시글 삭제 실패";
				url = "info.jsp?num="+num;
			}
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href = "<%=url%>"
</script>