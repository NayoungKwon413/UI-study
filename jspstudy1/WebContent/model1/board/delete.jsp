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
	String msg = "�Խñ��� ��й�ȣ�� Ʋ���ϴ�.";
	String url = "deleteForm.jsp?num="+num;
	if(db == null){
		msg = "���� �Խñ��Դϴ�.";
		url = "list.jsp";
	}else{
		if(pass.equals(db.getPass())){
			if(dao.delete(num)){
				msg = "�Խñ� ���� �Ϸ�";
				url = "list.jsp";
			}else{
				msg = "�Խñ� ���� ����";
				url = "info.jsp?num="+num;
			}
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href = "<%=url%>"
</script>