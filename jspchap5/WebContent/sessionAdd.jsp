<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/sessionAdd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니 추가</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String product = request.getParameter("product");
	//session.getAttribute("cart") : cart라는 이름의 속성값을 리턴
	//  cart 라는 속성이 없는 경우 => null값을 리턴
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart == null){   //속성이 등록되지 않은 경우
		cart = new ArrayList<String>();
		session.setAttribute("cart", cart);  //속성 등록
	}  
	cart.add(product);  
%>
<script type="text/javascript">
	alert("<%=product%>이(가) 장바구니에 추가되었습니다.")
	history.go(-1);  //한 페이지 뒤로 이동 -> 제자리로
</script>
</body>
</html>