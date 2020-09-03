<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp 
	1. �Ķ���� �������� Board ��ü ����
	2. ��й�ȣ ����
		��й�ȣ ��ġ�ϴ� ��� ����
			-�Ķ������ �������� �ش� �Խù��� ������ �����ϱ�
			-÷�������� ������ ���� ��� file2 �Ķ���� ������ �ٽ� �����ϱ�
		��й�ȣ�� ����ġ�� ���
			-��й�ȣ ���� �޼����� ����ϰ�, updateForm.jsp �� ������ �̵�
	3. ���� ���� : ���� ���� �޼��� ��� �� info.jsp ������ �̵�
	     ���� ���� : ���� ���� �޼��� ��� �� updateForm.jsp ������ �̵�
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<%  //1. �Ķ���� ���� Board ��ü�� ����
	Board board = new Board();
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	if(board.getFile1() == null || board.getFile1().equals("")){  //÷������ ������ ���� �ʾ��� ���
		board.setFile1(multi.getParameter("file2"));
	}
	String msg = null;
	String url = null;
	//2. ��й�ȣ ����
	BoardDao dao = new BoardDao();
	//db : ���� �� ���� ����. ��й�ȣ ���� �� ���
	Board db = dao.selectOne(board.getNum());
	if(board.getPass().equals(db.getPass())){
		//3. ���� ���� ����
		if(dao.update(board)){
			msg="���� ����";
			url="info.jsp?num="+board.getNum();
		}else{
			msg = "��������";
			url = "updateForm.jsp?num="+board.getNum();
		}
		
	}else{
		msg = "��й�ȣ ����";
		url = "updateForm.jsp?num="+board.getNum();
	}
%>
<script>
alert("<%=msg%>")
location.href = "<%=url%>"
</script>
