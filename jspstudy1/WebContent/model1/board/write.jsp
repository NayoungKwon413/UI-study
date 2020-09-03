<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/write.jsp 
	1. �Ķ���� ���� model.Board ��ü ����
		useBean ��� �Ұ� : request ������ �Ķ���Ϳ� ��Ŭ������ ������Ƽ ��
						request ��ü�� ����� �� ����.
	2. �Խù� ��ȣ num ���� ��ϵ� num �� �ִ밪�� ��ȸ -> �ִ밪 +1 : ��ϵ� �Խù��� ��ȣ.
		db���� maxnum�� ���ؼ� +1 ������ num�� �����ϱ�
	3. board ������ db�� ����ϱ�.
		��ϼ���: �޼��� ���. list.jsp �� �̵�
		��Ͻ���: �޼��� ���. writeForm.jsp �� �̵�
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
	//1. �Ķ���� ���� model.Board ��ü ����
	String path = application.getRealPath("/") + "model1/board/file/";
	File f = new File(path);
	if(!f.exists())  f.mkdirs();
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	Board board = new Board();
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	//2. db���� maxnum�� ���ؼ� +1 ������ num�� �����ϱ�
	BoardDao dao = new BoardDao();
	int num = dao.maxnum();   // board table���� num �÷��� �ִ밪 ����
	String msg = "�Խù� ��� ����";
	String url = "writeForm.jsp";
	board.setNum(++num);
	board.setGrp(num);
	//3. board ������ db�� ����ϱ�
	if(dao.insert(board)){
		msg = "�Խù� ��� ����";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg%>")
	location.href = "<%=url%>"
</script>