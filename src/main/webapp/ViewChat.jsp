<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
 $(document).ready(function(){
    $('#navigation').load('MainController');
    $('#lcolumn').load('Empty');
    $('#rcolumn').load('Empty');
    $('#iterator').load('Empty');
 });
</script>
<div class="w3-container w3-card w3-round w3-white w3-section w3-center">
	<c:choose>
	    <c:when test="${not empty sessionScope.login.name}">
	    	<div class="w3-container w3-white w3-section w3-center">
		        <input type="text" id="receiverInput" placeholder="Enter receiver's username...">
		        <button onclick="connectWebSocket()">Connect</button>
		        <input type="text" id="messageInput" placeholder="Type a message...">
		        <button onclick="sendMessage()">Send</button>
		        <div id="chatWindow"></div>
			</div>
			
	        <script>
	            let username = '${sessionScope.login.user}';
	            let receiverUsername;
	            let contextPath = '<%= request.getContextPath() %>';
	            let socket;
	
	            function connectWebSocket() {
	                receiverUsername = document.getElementById("receiverInput").value.trim();
	                if (receiverUsername !== "") {
	                    socket = new WebSocket("ws://localhost:8080" + contextPath + "/chat/" + username + "/" + receiverUsername);
	
	                    socket.onopen = function() {
	                        console.log("WebSocket connection established.");
	                    };
	
	                    socket.onmessage = function(event) {
	                        let chatWindow = document.getElementById("chatWindow");
	                        chatWindow.innerHTML += "<br>" + event.data;
	                    };
	
	                    socket.onerror = function(error) {
	                        console.error("WebSocket error: " + error);
	                    };
	
	                    socket.onclose = function() {
	                        console.log("WebSocket connection closed.");
	                    };
	                } else {
	                    alert("Please enter the receiver's username.");
	                }
	            }
	
	            function sendMessage() {
	                let messageInput = document.getElementById("messageInput");
	                let message = username + ":" + messageInput.value.trim();
	                socket.send(message);
	                messageInput.value = '';
	            }
	        </script>
	    </c:when>
	    <c:otherwise>
	        <p>Please log in to use the chat.</p>
	    </c:otherwise>
	</c:choose>
</div>

