<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp 
	1. �Ķ���Ͱ��� ����
	2. db ������ �о, �ش� ���̵�� ��й�ȣ�� ��
	3. ���̵� ���� ��� "���̵� �����ϴ�" �޼��� ��� �� loginForm.jsp �� ������ �̵�
	     ��й�ȣ�� Ʋ�� ��� "��й�ȣ�� Ʋ���ϴ�" �޼��� ��� �� loginForm.jsp �� ������ �̵�
	4. ���̵�� ��й�ȣ�� ��ġ�ϴ� ���
		- session ��ü�� �α��� ���� ����
		- ȭ�鿡 "name ���� �α��� �߽��ϴ�." �޼��� ��� �� main.jsp ������ �̵�
--%>
<%
	String msg = "���̵� Ȯ���ϼ���";
	String url = "loginForm.jsp";
	//1. �Ķ���Ͱ� ����;
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//2. db ���� �о����
	Member mem = new MemberDao().selectOne(id);
	//3. ���̵�, ��й�ȣ ����
	if(mem != null){
		if(pass.equals(mem.getPass())){   // �н����� �Է°�(�Ķ���Ͱ�)�� db ���������� �н����� ���� ������, session �� �Ӽ� ���.
			session.setAttribute("login", id);
			msg = mem.getName() + "���� �α����߽��ϴ�.";
			url = "main.jsp";
		}else{
			msg = "��й�ȣ�� Ʋ���ϴ�";
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>