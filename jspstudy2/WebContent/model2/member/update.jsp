<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp 
	1. ��� �Ķ���� ������ Member ��ü�� ����
	2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ��
		- ���� ���� ���, "��й�ȣ ����" �޼��� ��� �� updateForm.jsp �������� �̵�
	3. ��й�ȣ�� ��ġ�ϴ� ���, �Ķ���Ͱ��� ������ Member ��ü�� �̿��Ͽ� db ������ ����
		int MemberDao.update(Member) �޼��� �̿�
		return �� <0 => ���� ���� �޼��� ��� �� updateForm.jsp �� ������ �̵�
		return �� >0 => ���� ���� �޼��� ��� �� info.jsp �� ������ �̵� 
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
			alert("���� ����")
			location.href="updateForm.jsp?id=<%=mem.getId()%>"
			</script>
	<%	}else if(result >0){%>
		<script>
			alert("���� ����")
			location.href="info.jsp?id=<%=mem.getId()%>"
		</script>
<%}else {%>
	<script>
	alert("��й�ȣ ����")
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
			alert("���� ����")
			location.href="updateForm.jsp?id=<%=mem.getId()%>"
			</script>
	<%	}else if(result>0){%>
		<script>
			alert("���� ����")
			location.href="info.jsp?id=<%=mem.getId()%>"
		</script>
<%}else {%>
	<script>
	alert("��й�ȣ ����")
	location.href="updateForm.jsp?id=<%=mem.getId()%>"
	</script>	
<%}
}%>


 --%>
