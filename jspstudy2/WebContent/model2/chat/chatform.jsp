<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/chat/chatform.jsp --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채팅화면</title>
</head>
<body>
<div style="width:100%;">
	<textarea rows="10" cols="50" readonly="readonly" id="messageWindow" style="width:80%;"></textarea><br>
	<input id="inputMessage" type="text" style="width:80%;" onkeydown="keyin()">
	<input type="button" value="전송" onclick="send()">   <!--  전송 버튼 누르면 send() 메서드 호출 -->
</div>
<!-- 
	
 -->
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket                                 // 자바스트립트에서 채팅 객체
					("ws://192.168.0.157:8080${path}/chatting");  // ws://(프로토콜)   => 소켓에 프로토콜 전달되면, chatController
	var inputMessage = document.getElementById("inputMessage");   // 입력창
	
	// 웹소캣 오류발생 : 오류발생시 onError() 호출
	webSocket.onerror = function(event){
		onError(event)
	}
	// 웹소캣 연결 성공 : 연결 성공시, onOpen() 메서드 호출
	webSocket.onopen = function(event){
		onOpen(event);
		alert("즐거운 채팅. 비속어 금지");
	}
	// 메세지 수신 : 수신 시, onMessage() 메서드 호출
	webSocket.onmessage = function(event){
		onMessage(event)
	}

	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "연결 성공\n";
	}
	function onError(event){
		alert("연결 실패 : "+ event.data)
	}
	function send(){
		textarea.value += "${sessionScope.login} :" + inputMessage.value + "\n";
		webSocket.send('${sessionScope.login} : ' + inputMessage.value);            // 서버로 메세지 전송(로그인정보+전송한 메세지내용)
		inputMessage.value = "";
	}
	function keyin() {
		if(event.keyCode == 13){  //enter 키 코드값 == 13  -> enter 키를 누르면 send() 버튼을 누른것과 마찬가지로 메세지 전송됨.
			send();
		}
	}
</script>
</body>
</html>