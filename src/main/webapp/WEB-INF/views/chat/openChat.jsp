<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>채팅 | 여길잡아</title>
<link rel="stylesheet" href="/trip/resources/css/jun.css">
<style type="text/css">
.jun-top {
	background: #fff;
}
.jun-style-color{
	color	: gray;
	font-size:15px;
}
.jun-style-talk{
	position: relative;
	left:-230px;
	top:-10px;
}

</style>

<!-- favicon -->
<link rel="shortcut icon" href="/trip/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

</head>
<body>	
<div id="container">
	<div class="jun-top">
		<table style="border:1px solid silver; width:100%; height:50px;">
			<tr>				
				<td colspan="2"><strong id="title">${ roomInfo.cr_title }</strong></td>
			</tr>
			<tr>
				<td><small>${ roomInfo.cr_contry }</small></td><td><small>${ roomInfo.cr_city }</small></td>
			</tr>
		</table>
	</div>
	<div id="messageWindow">
		<c:if test="${ empty contentList }">
			<div style="text-align:center; padding:20px;">아직 메시지가 없어요. 메시지를 입력해보세요~!</div>
		</c:if>
		<c:if test="${ !empty contentList }">
			<c:forEach var="list" items="${ contentList }">
				<c:if test="${ loginMember.member_id eq list.cc_id }">
					<div class="ui grid">
						<div class="sixteen wide column">
							<div class="talk-bubble tri-right round right-in">
								<div class="talktext">${ list.cc_content }</div>
							</div>
						</div>
					</div>
					<div style="text-align:right;margin-right:20px;"><small class="cate" id="ch${ cc_no }">${ list.cc_date }</small></div>
				</c:if>
				<c:if test="${ loginMember.member_id ne list.cc_id }">
					<div class="ui grid">
						<div class="sixteen wide column">
							<div style="padding-left:24px;">${ list.cc_id }</div>
							<div class="talk-bubble-left tri-left round left-in other-side" style="margin-top:0;">
								<div class="talktext">${ list.cc_content }</div>
							</div>
						</div>
					</div>
					<div style="text-align:left;margin-left:20px;"><small class="cate" id="ch${ cc_no }">${ list.cc_date }</small></div>
				</c:if>
			</c:forEach>
		</c:if>
	</div>
	<div class="ui action input">
		<input type="text" placeholder="메시지를 입력하세요." name="content" id="inputMessage"  onkeyup="enterKey();">
		<select class="ui compact selection dropdown">
			<option value="all" selected>전체</option>
			<option value="articles">귓속말</option>
		</select>
		<div class="ui button" id="bn" onclick="send();">전송</div>
	</div>
</div>
<!-- websocket javascript -->
<script type="text/javascript">
var ws;
var roomNo = '${ roomInfo.cr_no }';
var contry = '${ roomInfo.cr_contry }';
var city = '${ roomInfo.cr_city }';
var title = '${ roomInfo.cr_title }';
var $inputMessage = $("#inputMessage");
var $textarea = $("#messageWindow");
$textarea.scrollTop($textarea[0].scrollHeight);

//페이지 열면 웹소켓 실행
openSocket();

function openSocket(){
    //웹소켓 객체 만드는 코드
    ws=new WebSocket("ws://127.0.0.1:8800/trip/echo.do");
    
    ws.onopen=function(event){
    	//웹소켓 연결하면 방번호 보냄
    	var roomNo = '${ roomInfo.cr_no }';
    	ws.send("room:" + roomNo);
    };
    ws.onmessage=function(event){
    	onMessage(event);
    };
    ws.onclose=function(event){
    }
}

function send(){
	//메세지를 입력하지 않고 버튼 누른 경우
	if($inputMessage.val() == "") {
		alert("전송할 메세지를 입력하세요.");
	}else{  //메세지가 입력된 경우
		//시간 출력
		var today = new Date();
		var time = today.getHours();
		var time2 = "오전 " + time; 
		var minute = today.getMinutes();
		
		if(time > 12){
			time2 = "오후 "+(time - 12);
		}
		
		if(minute < 10){
			minute = "0" + minute;
		}
		
		$("#messageWindow").append("<div class='ui grid'><div class='sixteen wide column'><div class='talk-bubble tri-right round right-in'><div class='talktext'><p>"+$inputMessage.val() + "</p></div></div></div></div><div style='text-align:right;margin-right:20px;'><small>"+time2+":"+minute+"</small></div>");
	
		// 방번호, 국가, 도시, 메시지
		ws.send("rChat:"+ roomNo + ":" + title + ":" + contry + ":" + city + "=" + $inputMessage.val());
		
		$inputMessage.val(""); //기록된 메세지 삭제함
		$textarea.scrollTop($textarea[0].scrollHeight);
	}	
};

function enterKey(){
	if(window.event.keyCode == 13){
		send();
	}
};

function closeSocket(){
    ws.close();
};

function onMessage(event){
	//시간 출력
	var today2 = new Date();
	var tim = today2.getHours();
	var tim2 = "오전 " + tim; 
	var minut = today2.getMinutes();
	
	if(tim > 12){
		tim2 = "오후 "+(tim - 12);
	}
	
	if(minut < 10){
		minut = "0" + minut;
	}
	
	var fullMessage = event.data.split(":");
	var mId = fullMessage[0];
	var message = fullMessage[1];
	$("#messageWindow").append("<div class='ui grid'><div class='sixteen wide column'><div style='padding-left:24px;'>"+mId+"</div><div class='talk-bubble-left tri-left round left-in other-side' style='margin-top:0;'><div class='talktext'><p>"+message + "</p></div></div></div></div><div style='text-align:left;margin-left:20px;'><small>"+tim2+":"+minut+"</small></div>");
	$textarea.scrollTop($textarea[0].scrollHeight);
}

</script>
</body>
</html>