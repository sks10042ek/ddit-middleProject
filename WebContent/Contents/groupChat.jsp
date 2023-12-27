<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>그룹채팅</title>
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
	
<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.wrap {
   	padding: 40px 0;
    background-color: #c0d2e3;
    border: 1px solid #8fa6bc;
    margin: 55px;
    height: 621px;
    overflow-y: auto;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.wrap .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #eee;
}

.wrap .chat .icon i {
    position: absolute;
    top: 12px;
    left: 50%;
    font-size: 2.7rem;
    color: #aaa;
    transform: translateX(-50%);
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
    width:200px;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #F9EB54;
}

.chatWrite input {
	width: 100%;
    border-radius: 11px;
    height: 46px;
    border: 1px solid #748595;
}


.chatWrap {
	background: #fff;
    width: 545px;
    margin: 50px auto;
    border-radius: 19px;
    padding-top: 1px;
    box-shadow: 2px 2px 13px 0 rgb(68 68 68 / 50%);
}

.chatWrap  span {
	position: absolute;
    right: 26px;
    top: 8px;
    bottom: 11px;
    font-size: 19px;
    color: #1c89df;
    cursor: pointer;
}

.chatWrite {
	position: relative;
    margin: 55px;
    bottom: 45px;
}

.close {
	position:relative;
	float: right;
	right:20px;
	display:inline-block;
	*display:inline;
	width:50px;
	height:50px;
	text-align:center;
	margin-right:20px;
}

	


.close2:after {content: "\00d7"; font-size:25pt;line-height:45px;}

</style>
<script src="<%=request.getContextPath()%>/Contents/js/code.jquery.com_jquery-3.7.0.min.js"></script>
</head>

<body style="background: #f1f1f1;">
	<div class="chatWrap">
	
	 	<div class="chat-footer">
        	<a href="<%=request.getContextPath()%>/gBList.do">
        		<div class="close close2"></div>
        	</a>
      	</div>
	
	    <div class="wrap" id="wrapdiv">

	    </div>
	     <div class="chatWrite">
		    <input type="text" id="textline">
		    <span id="sendms" style="cursor: pointer;"><i class="fa fa-solid fa-paper-plane"></i></span>   
		</div>
	   
    </div>
    
</body>
   <%
   	String name = (String)session.getAttribute("LoginId");
    String createId = (String)request.getParameter("param");
   	
   %>
   
   
   <script type="text/javascript">
    let webSocket = null; // 웹소켓 변수 선언
    const messageTextArea = document.getElementById("wrapdiv");

    function connectting() {
        // 웹소켓 초기화
        webSocket = new WebSocket("ws://192.168.35.114/websocktMultichat.do");

        // 접속 성공하면
        webSocket.onopen = function onOpen(event) {
            webSocket.send("<%=name%>");
            webSocket.send("채팅방에 입장 하셨습니다");
        }

        // 메시지가 오면 messageTextArea 요소에 메시지를 추가한다.
        webSocket.onmessage = function processMessge(message) {
            let jsonData = JSON.parse(message.data);
            if (jsonData.message != null) {
                if (messageTextArea) { // messageTextArea가 null이 아닌 경우에만 실행
                    let htmlCode = "";
                    <%-- <% if(name.equals(jsonData.username)) { %>
                     --%>
                    if(jsonData.username=="<%=name%>"){
                    htmlCode = `<div class="chat ch2">
                        <div class="icon"><i class="fa fa-solid fa-user"></i></div>
                        <div class="textbox">${jsonData.message}</div>
                    </div>`;
                    <%-- <% } else { %> --%>
                    }else{
                    htmlCode = `<div class="chat ch1">
                        <div class="icon"><i class="fa fa-solid fa-user"></i></div>
                        <div class="textbox">${jsonData.message}</div>
                    </div>`;
                    }
                    <%-- <% } %> --%>

                    messageTextArea.innerHTML += htmlCode;
                    messageTextArea.scrollTop = messageTextArea.scrollHeight;
                }
                
                if (jsonData.sessionCount != null) {
                    updateSessionCount(jsonData.sessionCount);
                }
            }
        };

        webSocket.onerror = function showErrorMsg(event) {
            alert("오류 : " + event.data);
        }

        webSocket.onclose = function(event) {
            messageTextArea.innerHTML = "";
            messageText.value = "";
        }
    }
    // 웹소켓 연결
    connectting();
    // 메시지 보내기

    function sendMessage() {
        const messageText = $('#textline').val();
        if (messageText == "") {
            $('#textline').focus();
            return;
        }
        webSocket.send(messageText);
        $('#textline').val(""); // 입력 후 값을 비워줍니다.
    }

    function closing() {
        webSocket.close();
    }

    // 이벤트 설정
    function addEvent() {
        console.log("addEvent() called"); // 디버깅을 위한 로그 출력
        
        const sendButton = document.getElementById("sendms");
        if (sendButton) {
            sendButton.addEventListener("click", sendMessage, false);
        }

        // 입력 필드에서 "keypress" 이벤트를 감지
        const textLine = document.getElementById("textline");
        if (textLine) {
            textLine.addEventListener("keypress", function(event) {
                console.log("KeyPress event fired"); // 디버깅을 위한 로그 출력
                if (event.key === "Enter") {
                    event.preventDefault(); // 기본 동작 (폼 제출) 방지
                    sendMessage(); // Enter 키가 눌렸을 때 sendMessage 함수 호출
                }
            });
        }
    }
	//세션 갯수 가져오는 로직
    function updateSessionCount(sessionCount) {
        const sessionCountElement = document.getElementById("sessionCount");
        console.log(sessionCountElement);
        if (sessionCountElement) {
            sessionCountElement.textContent = sessionCount;
        }
    }
    
	
    window.addEventListener("load", function() {
        addEvent();
    }, false);


</script>
   

    
   

</html>