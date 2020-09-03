<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp 
	1. 파라미터 정보들을 Board 객체 저장
	2. 비밀번호 검증
		비밀번호 일치하는 경우 수정
			-파라미터의 내용으로 해당 게시물의 내용을 수정하기
			-첨부파일의 변경이 없는 경우 file2 파라미터 내용을 다시 저장하기
		비밀번호가 불일치할 경우
			-비밀번호 오류 메세지를 출력하고, updateForm.jsp 로 페이지 이동
	3. 수정 성공 : 수정 성공 메세지 출력 후 info.jsp 페이지 이동
	     수정 실패 : 수정 실패 메세지 출력 후 updateForm.jsp 페이지 이동
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<%  //1. 파라미터 정보 Board 객체에 저장
	Board board = new Board();
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	if(board.getFile1() == null || board.getFile1().equals("")){  //첨부파일 수정을 하지 않았을 경우
		board.setFile1(multi.getParameter("file2"));
	}
	String msg = null;
	String url = null;
	//2. 비밀번호 검증
	BoardDao dao = new BoardDao();
	//db : 수정 전 정보 저장. 비밀번호 검증 시 사용
	Board db = dao.selectOne(board.getNum());
	if(board.getPass().equals(db.getPass())){
		//3. 수정 성공 여부
		if(dao.update(board)){
			msg="수정 성공";
			url="info.jsp?num="+board.getNum();
		}else{
			msg = "수정실패";
			url = "updateForm.jsp?num="+board.getNum();
		}
		
	}else{
		msg = "비밀번호 오류";
		url = "updateForm.jsp?num="+board.getNum();
	}
%>
<script>
alert("<%=msg%>")
location.href = "<%=url%>"
</script>
