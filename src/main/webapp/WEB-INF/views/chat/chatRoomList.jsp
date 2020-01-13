<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

</head>
<body>	
<div class="ui pointing menu">
  <a class="item active" id="chatFellow">
    동행찾기 채팅 리스트
  </a>
  <a class="item" id="chatG">
    가이드 채팅 리스트
  </a>
  <a class="item" id="chatFree">
    자유채팅
  </a>
  <div class="right menu">
    <div class="item">
      <div class="ui transparent icon input">
        <input type="text" placeholder="검색어를 입력하세요...">
        <i class="search link icon"></i>
      </div>
    </div>
  </div>
</div>
<div class="ui segment" id="chatFellowList" style="display:block;">
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>  
</div>
<div class="ui segment" id="chatGList" style="display:none;">
  <p>두번째거</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>  
</div>
<div class="ui segment" id="chatFreeList" style="display:none;">
  <p>세번째꺼</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>
  <p>여기에 리스트 띄어줄거야</p>  
</div>
    <div>
        <input type="text" id="sender" value="${sessionScope.loginMember.member_id }" style="display: none;">
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" onclick="openSocket();">Open</button>
        <button type="button" onclick="send();">Send</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>


<!-- websocket javascript -->
<script type="text/javascript">
var ws;
var messages=document.getElementById("messages");

function openSocket(){
    if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
        writeResponse("WebSocket is already opened.");
        return;
    }
    //웹소켓 객체 만드는 코드
    ws=new WebSocket("ws://localhost:8800/trip/echo.do");
    
    ws.onopen=function(event){
        if(event.data===undefined) return;
        
        writeResponse(event.data);
    };
    ws.onmessage=function(event){
        writeResponse(event.data);
    };
    ws.onclose=function(event){
        writeResponse("Connection closed");
    }
}

function send(){
    var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
    ws.send(text);
    text="";
}

function closeSocket(){
    ws.close();
}
function writeResponse(text){
    messages.innerHTML+="<br/>"+text;
}

$(function(){
	$("#chatG").onclick(function(){
	$("#chatFellow").attr("class", "item");
	$("#chatG").attr("class", "item active");
		
		/* $("#chatGList").css("display", "block"); */
	});
})
</script>
  
</body>
</html>