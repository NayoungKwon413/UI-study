<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/ajax/graph2.jsp 
	1. BoardAllAction 에서 보낸 list를 받음 --> list는 Map 객체로 이뤄져있음
	2. Map의 키가 regdate인 경우, 맵의 시작이므로 { 중괄호를 열어 줌
	3. 키가 regdate가 아니면 cnt 의 시작 --> , 를 찍음으로 구분
	4. {regdate:2020-06-01, cnt:4} ... 의 형태로 출력
	5. stat1.count < list.size()  : list 에 객체가 아직 남아있는 경우 ,로 이어줄 것. 객체가 남아있지 않을 때는 컴마 찍지 않고 for문 빠져 나옴
--%>
[
<c:forEach var="map" items="${list}" varStatus="stat1">
	<c:forEach var="m" items="${map}" varStatus="stat2">
		<c:if test="${m.key == 'regdate'}">{</c:if>
		<c:if test="${m.key != 'regdate'}">,</c:if>
		"${m.key}":"${m.value}"
		<c:if test="${m.key != 'regdate'}">}</c:if>
	</c:forEach>
	<c:if test="${stat1.count < list.size() }">,</c:if>
</c:forEach>
]