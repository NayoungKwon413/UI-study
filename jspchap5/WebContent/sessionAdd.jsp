<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/sessionAdd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� �߰�</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String product = request.getParameter("product");
	//session.getAttribute("cart") : cart��� �̸��� �Ӽ����� ����
	//  cart ��� �Ӽ��� ���� ��� => null���� ����
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart == null){   //�Ӽ��� ��ϵ��� ���� ���
		cart = new ArrayList<String>();
		session.setAttribute("cart", cart);  //�Ӽ� ���
	}  
	cart.add(product);  
%>
<script type="text/javascript">
	alert("<%=product%>��(��) ��ٱ��Ͽ� �߰��Ǿ����ϴ�.")
	history.go(-1);  //�� ������ �ڷ� �̵� -> ���ڸ���
</script>
</body>
</html>