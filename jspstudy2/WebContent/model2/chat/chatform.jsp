<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/chat/chatform.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채팅 화면</title>
</head>
<body>
	<div style="width: 100%;">
		<textarea rows="10" cols="50" readonly="readonly" id="messageWindow"  
			style="width: 80%;"></textarea>
		<br> <input id="inputMessage" type="text" style="width: 80%;"
			onkeydown="keyin()"> <input type="button" value="전송"
			onclick="send()">
	</div>
	<script type="text/javascript">
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket("ws://192.168.0.119:8080${path}/chatting"); //자바 스크립트에서 채팅 객체.  ws는 프로토콜중 하나.
		var inputMessage = document.getElementById("inputMessage");
		
		//오류발생
		webSocket.onerror = function(event) {
			onError(event)
		}
		
		//연결성공
		webSocket.onopen = function(event) {
			onOpen(event);
			alert("즐거운 채팅.비속어 금지")
		}
		//메세지 수신 발생시
		webSocket.onmessage = function(event) {
			onMessage(event)
		}
		function onMessage(event) {
			textarea.value += event.data + "\n";
		}
		function onOpen(event) {
			textarea.value += "연결 성공했지롱~!\n";
		}
		function onError(event) {
			alert("연결실패:" + event.data)
		}
		function send() {
			textarea.value += "${sessionScope.login}:"+inputMessage.value +"\n";
			
			//서버로 메세지 전송
			webSocket.send('${sessionScope.login}:'+inputMessage.value);
			inputMessage.value="";
		}
		function keyin(){
			if(event.keyCode ==13){	//enter 키 코드값
				send()
			}
		}
	</script>

</body>
</html>