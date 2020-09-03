<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp
	1. ���������� 10���� �Խù��� ����ϱ�.
	   pageNum �Ķ���Ͱ��� ���� => ���� ���� 1�� �����ϱ�
	2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
	3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȭ�鿡 ���.
	     �Խù��� ��ºκ�
	     ������ ���� ��� �κ�
 --%>
 <%
 	int pageNum = 1;  //������ ��ȣ �ʱ�ȭ
 	try{
 		pageNum = Integer.parseInt(request.getParameter("pageNum"));
 	}catch(NumberFormatException e){ }
 	int limit = 10;  //�� �������� ����� �Խù� �Ǽ�
 	BoardDao dao = new BoardDao();
 	int boardcount = dao.boardCount();   //��ϵ� ��ü �Խù� �Ǽ��� ��������� �޼���
 	//list : ȭ�鿡 ����� �Խñ� ����� ����
 	List<Board> list = dao.list(pageNum, limit);
 	/*
 		maxpage : �� ������ ����
 		21���� �Խñ� => 3�������� �ʿ���
 		21.0/10 = 2.1+0.95 = 3.05 => 3
 		20���� �Խñ� => 2�������� �ʿ���
 		20.0/10 = 2.0 + 0.95=2.95 => 2
 	*/
 	int maxpage = (int)((double)boardcount/limit + 0.95);
 	/*
 		startpage : ȭ�鿡 ��µ� ù��° ������ ��ȣ
 		pageNum   : ���� ������
 		  pageNum�� 2�̸�, startpage=1
 		  2/10.0 + 0.9 =1.1  -> (int)1.1 = 1  -> (1-1)*10+1 = 1
 		  pageNum�� 10�̸�, startpage =1
 		  10/10.0 + 0.9 = 1.9  -> (int)1.9 = 1  -> (1-1)*10+1 = 1
		  pageNum�� 11�̸�, startpage =11
 		  11/10.0 + 0.9 = 2.0  -> (int)2.0 = 2  -> (2-1)*10+1 = 11
 	*/
 	int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 +1;   //���������� ��ȣ
 	int endpage = startpage + 9;  //���������� ��ȣ
 	int boardnum = boardcount - (pageNum-1) * limit;
 	if(endpage > maxpage) endpage = maxpage;
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>�Խ��� ���</caption>
<% if(boardcount == 0) { //��ϵ� �Խù� ���� %>
<tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
<%}else { //��ϵ� �Խù� ���� %>
<tr><td colspan="5" style="text-align:right">�۰���:<%=boardcount %></td></tr>
 <tr><th width="8%">��ȣ</th><th width="50%">����</th>
 	 <th width="14%">�ۼ���</th><th width="17%">�����</th>
 	 <th width="11%">��ȸ��</th></tr>
 <%for(Board b : list){ %>
 <tr><td><%=boardnum-- %></td>
<%--  <tr><td><%=b.getNum() %></td>  : num �״�� ���  --%>
  
  <td style="text-align: left">
  
  <%-- �̹��� �������� �� @ �����۸�ũ �߰��ϱ� --%>
  <% if(b.getFile1() != null && !b.getFile1().trim().equals("")) { %>
  <a href="file/<%=b.getFile1() %>" style="text-decoration: none;">@</a>
  <%} else{ %> &nbsp;&nbsp;&nbsp; <%} %>
  
  <%-- ����� �� ����� ���� ǥ�� �߰��ϱ� --%>
  <% if(b.getGrplevel() > 0){ 
  		for(int i=1; i<b.getGrplevel(); i++){ %>
  			&nbsp;&nbsp;&nbsp;
  		<%} %>��<% }%>

  	<a href="info.jsp?num=<%=b.getNum() %>"><%=b.getSubject()%></a>
  </td><td><%=b.getName() %></td>
 <%-- �Խñ۵�ϳ�¥�� �����̸� �ð���, ������ �ƴϸ� ��¥�� �ð� ��� ����ϱ� --%> 
  <% 
  Date date = new Date();
  SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd");       //�Խñ� ��ϳ�¥�� ���ó�¥ �񱳸� ���� format
  SimpleDateFormat today = new SimpleDateFormat("HH:mm:ss");            //������ �Խñ��� ��
  SimpleDateFormat nottoday = new SimpleDateFormat("yyyy-MM-dd hh:mm"); //������ �Խñ��� �ƴ� ��
  String date3 = dateform.format(date);               //���ó�¥
  String regdate = dateform.format(b.getRegdate());   //�Խñ� ��ϳ�¥
  if(regdate.equals(date3)) {%>
  		<td><%=today.format(b.getRegdate()) %></td>
  <%}else{ %>
  		<td><%=nottoday.format(b.getRegdate()) %></td>
  <%} %>
	   
  	   <td><%=b.getReadcnt() %></td></tr>
 <%} //for(Board b : list){...} : �Խñ� ��ȸ �κ� %>
 <tr><td colspan="5">
 
 <%-- ������ ó���ϱ� --%>
 	<% if(pageNum <= 1) { %>[����]<%} else{ %>
 	<a href="list.jsp?pageNum=<%=pageNum - 1 %>">[����]</a><%} %>
 	<% for(int a=startpage; a<=endpage; a++) { %>
 		<% if(a==pageNum) { %>[<%=a %>]<%} else{ %>
 			<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
 	<% }
 	} %>
 	<% if(pageNum >= maxpage) { %>[����]<%} else{ %>
 	<a href="list.jsp?pageNum=<%=pageNum + 1 %>">[����]</a><%} %>
 </td></tr>
<%} //��ϵ� �Խù� ���� �κ� ���� %>
 <tr><td colspan="5" style="text-align:right">
 	<a href="writeForm.jsp">[�۾���]</a></td></tr>
</table> 

</body>
</html> 