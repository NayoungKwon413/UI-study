<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/chat/chatform.jsp --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ä��ȭ��</title>
</head>
<body>
<div style="width:100%;">
	<textarea rows="10" cols="50" readonly="readonly" id="messageWindow" style="width:80%;"></textarea><br>
	<input id="inputMessage" type="text" style="width:80%;" onkeydown="keyin()">
	<input type="button" value="����" onclick="send()">   <!--  ���� ��ư ������ send() �޼��� ȣ�� -->
</div>
<!-- 
	
 -->
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket                                 // �ڹٽ�Ʈ��Ʈ���� ä�� ��ü
					("ws://192.168.0.157:8080${path}/chatting");  // ws://(��������)   => ���Ͽ� �������� ���޵Ǹ�, chatController
	var inputMessage = document.getElementById("inputMessage");   // �Է�â
	
	// ����Ĺ �����߻� : �����߻��� onError() ȣ��
	webSocket.onerror = function(event){
		onError(event)
	}
	// ����Ĺ ���� ���� : ���� ������, onOpen() �޼��� ȣ��
	webSocket.onopen = function(event){
		onOpen(event);
		alert("��ſ� ä��. ��Ӿ� ����");
	}
	// �޼��� ���� : ���� ��, onMessage() �޼��� ȣ��
	webSocket.onmessage = function(event){
		onMessage(event)
	}

	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "���� ����\n";
	}
	function onError(event){
		alert("���� ���� : "+ event.data)
	}
	function send(){
		textarea.value += "${sessionScope.login} :" + inputMessage.value + "\n";
		webSocket.send('${sessionScope.login} : ' + inputMessage.value);            // ������ �޼��� ����(�α�������+������ �޼�������)
		inputMessage.value = "";
	}
	function keyin() {
		if(event.keyCode == 13){  //enter Ű �ڵ尪 == 13  -> enter Ű�� ������ send() ��ư�� �����Ͱ� ���������� �޼��� ���۵�.
			send();
		}
	}
</script>
</body>
</html>