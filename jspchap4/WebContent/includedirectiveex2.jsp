<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/includedirectiveex2.jsp
    	includedirectiveex1.jsp 페이지에 포함되는 페이지
     --%>
<hr>
<h3>includedirectiveex2.jsp 페이지입니다.<br>
includedirectiveex1.jsp 호출 시 포함되는 페이지입니다.<br>
두 개의 페이지가 같은 서블릿으로 변경되므로 변수의 공유가 가능합니다.<br>
msg=<%=msg%>
</h3>
<hr>