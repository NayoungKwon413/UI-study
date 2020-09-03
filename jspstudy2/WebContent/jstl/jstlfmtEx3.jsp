<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- /WebContent/jstl/jstlfmtEx3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt �±�: ���ڵ�</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
  �̸�: <input type="text" name="name" value="${param.name}"><br>
  �Ի���: <input type="text" name="hiredate" value="${param.hiredate}">yyyy-MM-dd ���·� �Է�<br>
  �޿�: <input type="text" name="salary" value="${param.salary}"><br>
 <c:set var="paramvs" value="${fn:join(paramValues.job, ',')}" />
  ������: <input type="checkbox" name="job" value="����"
  		<c:if test="${fn:contains(paramvs, '����')}">checked</c:if> >����
  		 <input type="checkbox" name="job" value="����"
  		<c:if test="${fn:contains(paramvs, '����')}">checked</c:if> >����
  		 <input type="checkbox" name="job" value="��"
  		<c:if test="${fn:contains(paramvs, '��')}">checked</c:if> >��
  		 <input type="checkbox" name="job" value="���"
  		<c:if test="${fn:contains(paramvs, '���')}">checked</c:if> >���<br>
  <input type="submit" value="����">
</form><hr>
�̸�: ${param.name}<br>
�Ի���: ${param.hiredate}<br>
�޿�: ${param.salary}<br>
������: ${param.job}<br>
������: <c:forEach var="j" items="${paramValues.job}">   <%-- paramValues.job : �Ķ���Ͱ��� �迭�� ����  --%>
	${j}&nbsp;&nbsp;
</c:forEach><br>
${paramValues.job[0]}, ${paramValues.job[1]}

<h3>�Ի����� yyyy�� MM�� dd�� E���� ���·� ���. �޿��� ���ڸ����� �޸� ����ϱ�.
���� ����ϱ�(����=�޿�*12 ����ϰ� ���ڸ����� �޸� ǥ���ϱ�)</h3>
<c:catch var="formatexception">     <%-- ����ó�� --%>
	<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hday" />
</c:catch>
�Ի���: 
<c:if test="${formatexception == null }">   <%-- ���ܰ� ������ ����ó�� --%>
	<fmt:formatDate value="${hday}" pattern="yyyy�� MM�� dd�� E����"/>
</c:if>
<c:if test="${formatexception != null }">   <%-- ���ܰ� ������ �Է°��̵� �޼��� ��� --%>
	<font color="red">�Ի����� yyyy-MM-dd ���·� �Է��ϼ���</font>
</c:if><br>
�޿�: <fmt:formatNumber value="${param.salary}" pattern="##,###" /><br>
����: <fmt:formatNumber value="${param.salary * 12}" pattern="##,###" /><br>
</body>
</html>