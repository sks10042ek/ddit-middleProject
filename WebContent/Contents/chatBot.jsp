<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Roboto&display=swap" rel="stylesheet">
	
<!--폰트어썸 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<!-- Favicon -->
<link rel="icon" href="img/icons8-favorite-48.png" type="image/x-icon"> 

<head>
    <title>양도마켓 채팅</title>
    <style>
        body {
            background-color: #f1f1f1; 
        }

        .chat-container {
        	padding: 40px 10px 0 10px;
		    background-color: #c0d2e3;
		    border: 1px solid #8fa6bc;
		    margin: 58px;
		    width: 448px;
		    height: 621px;
		    overflow-y: auto;
        }
        
        .chatWrap {
        	background-color: #fff;
		    width: 580px;
		    margin: 50px auto;
		    border-radius: 19px;
		    padding-top: 1px;
		    box-shadow: 2px 2px 13px 0 rgb(68 68 68 / 50%);
        }

        .chat-history {
            flex: 1;
            overflow-y: auto;
            margin-bottom: 10px;
            padding-bottom: 10px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .user-message, .chatbot-message {
            margin: 5px 0;
            padding: 10px;
            border-radius: 8px;
            max-width: 70%;
        }

        .user-message {
            background-color: #ffffcc; /* 노란색 배경 */
            color: #333;
            text-align: right;
            align-self: flex-end;
        }

        .chatbot-message {
            background-color: #f1f1f1;
            color: #333;
            align-self: flex-start;
        }

        .user-input {
            position: relative;
		    width: 535px;
		    margin: 0 39px;
		    bottom: 41px;
        }
        
        .user-input input {
            width: 84%;
		    border-radius: 11px;
		    margin: 0 0 -0 16px;
		    height: 46px;
		    padding-left: 20px;
		    border: 1px solid #748595;
		}

        #user-input {
        /*     flex: 1;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 5px; */
        }

        #send-button {
            position: absolute;
		    right: 56px;
		    top: 8px;
		    bottom: 11px;
		    font-size: 19px;
		    color: #1c89df;
		    border: none;
		    background-color: #fff;
		    cursor: pointer;
        }
        
        .close {
			position:relative;
			float: right;
			display:inline-block;
			*display:inline;
			width:50px;
			height:50px;
			text-align:center;
			margin-right:20px;
		}
		
		.close2:after {
			content: "\00d7"; font-size:25pt;line-height:45px;
		}
    </style>
</head>
<body>
	<div class="chatWrap">
		<div class="chat-footer">
        	<a href="<%=request.getContextPath()%>/board/hoMarketList.do">
        		<div class="close close2"></div>
        	</a>
      	</div>
		<div class="chat-container">
	        <div class="chat-history" id="chat-history">
	            <!-- 채팅 기록이 표시될 영역 -->
	        </div>
	    </div>
        <div class="user-input">
            <input type="text" id="user-input" placeholder="메시지를 입력하세요">
            <button id="send-button"><i class="fa fa-solid fa-paper-plane"></i></button>
        </div>
	</div>
  <script>
    // 이하 JavaScript 코드
    const chatHistory = document.getElementById("chat-history");

    document.addEventListener("DOMContentLoaded", function () {
        // 채팅 히스토리의 스크롤을 아래로 내리는 함수
        const scrollToBottom = () => {
            chatHistory.scrollTop = chatHistory.scrollHeight;
        };

        const userInput = document.getElementById("user-input");
        const sendButton = document.getElementById("send-button");

        sendButton.addEventListener("click", function () {
            const userMessage = userInput.value;
            userInput.value = "";

            const userMessageDiv = document.createElement("div");
            userMessageDiv.className = "user-message";
            userMessageDiv.textContent = userMessage;
            chatHistory.appendChild(userMessageDiv);
            scrollToBottom();

            // 로딩 아이콘 추가
            const loadingIconDiv = document.createElement("div");
            loadingIconDiv.className = "chatbot-message";
            loadingIconDiv.innerHTML = '<i class="fa fas fa-spinner fa-spin"></i>';
            chatHistory.appendChild(loadingIconDiv);
            scrollToBottom();

            setTimeout(function () {
                // Simulate chatbot response after 2 seconds
                fetch("<%=request.getContextPath()%>/chatbotServlet.do?message=" + encodeURIComponent(userMessage))
                    .then(response => response.text())
                    .then(chatbotResponse => {
                        // 로딩 아이콘 삭제
                        chatHistory.removeChild(loadingIconDiv);

                        const chatbotResponseDiv = document.createElement("div");
                        chatbotResponseDiv.className = "chatbot-message";
                        chatbotResponseDiv.textContent = chatbotResponse;
                        chatHistory.appendChild(chatbotResponseDiv);
                        scrollToBottom();
                    });
            }, 2000); // 2 seconds delay
        });
    });
    
    // 이벤트 설정
   function addEvent() {
    console.log("addEvent() called");
    const sendButton = document.getElementById("send-button");
    if (sendButton) {
        sendButton.addEventListener("click", function() {
            const messageText = document.getElementById("user-input").value;
            if (messageText.trim() !== "") {
                // 입력된 메시지가 공백이 아닌 경우에만 메시지 전송
                const userMessageDiv = document.createElement("div");
                userMessageDiv.className = "user-message";
                userMessageDiv.textContent = messageText;
                chatHistory.appendChild(userMessageDiv);
                scrollToBottom();
                document.getElementById("user-input").value = ""; // 입력 필드 비우기

                // 이하 챗봇 응답 부분
                // ...
            }
        });
    }

    const textLine = document.getElementById("user-input");
    if (textLine) {
        textLine.addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                sendButton.click(); // sendButton을 클릭하도록 시뮬레이트
            }
        });
    }
}


    window.addEventListener("load", function() {
        addEvent();
    }, false);

</script>
</body>
</html>
