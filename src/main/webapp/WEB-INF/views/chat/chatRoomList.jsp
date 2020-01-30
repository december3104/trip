<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
.jun:hover{
	background-color : #dcf2fb;
	cursor:pointer;
}
</style>
</head>
<body>	
<div class="ui pointing menu">
	<a class="item active" id="chatFellow">
	  동행찾기 채팅 리스트
	</a>
	<a class="item" id="chatG">
	  가이드 채팅 리스트
	</a>
	<!-- <a class="item" id="chatFree">
	  자유채팅
	</a> -->
	<!-- <div class="right menu">
		<div class="item">
			<div class="ui transparent icon input">
				<input type="text" placeholder="검색어를 입력하세요...">
				<i class="search link icon"></i>
			</div>
		</div> -->
	</div>
</div>
<div id="chatFellowList" style="display:block;">
    <c:if test="${ !empty chatList }">
		<c:forEach var="list" items="${ chatList }">
		<c:if test="${ list.cr_type eq '동행찾기' }">
			<div class="ui relaxed divided list jun"  id="c${ list.cr_no }" ondblclick="openChat('${ list.cr_no }');" style="padding:0 10px 0 10px;">
				<div class="ui grid">
					<div class="three wide column">
						<table>
							<tr>
								<td>국가 : ${ list.cr_contry }</td>
							</tr>
							<tr>
								<td>도시 : ${ list.cr_city }</td>
							</tr>
						</table>
					</div>
					<div class="thirteen wide column">
						<table style="width:100%">
							<tr>
								<th style="width:80%; text-align:left;">${ list.cr_title }</th><td style="text-align:right; width:20%"><small>${ list.cr_date }</small></td>
							</tr>
							<tr>
								<c:forEach var="cList" items="${ lastContent }">
									<c:if test="${ cList.cc_cr_no eq list.cr_no }">
										<c:if test="${ cList.cc_content eq null }">
											<td>메세지가 없습니다.</td>
										</c:if>
										<c:if test="${ cList.cc_content ne null }">
											<td>${ cList.cc_content }</td>
											<c:if test="${ list.cm_new ne 0 }">
												<td style="float:right;"><div style="text-align:center;width:20px;background:red; color:white;" id="b${ list.cr_no }">${ list.cm_new }</div></td>
											</c:if>
										</c:if>
									</c:if>
								</c:forEach>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		</c:forEach>
		
	</c:if>
	<c:if test="${ empty chatList }">
		<div id="noContent">
			참여중인 채팅방이 없습니다.
		</div>
    </c:if>
</div>
<div id="chatGList" style="display:none;">
   <c:if test="${ !empty chatList }">
		<c:forEach var="list" items="${ chatList }">
		<c:if test="${ list.cr_type eq '가이드매칭' }">
			<div class="ui relaxed divided list jun"  id="c${ list.cr_no }" ondblclick="openChat('${ list.cr_no }');" style="padding:0 10px 0 10px;">
				<div class="ui grid">
					<div class="three wide column">
						<table>
							<tr>
								<td>국가 : ${ list.cr_contry }</td>
							</tr>
							<tr>
								<td>도시 : ${ list.cr_city }</td>
							</tr>
						</table>
					</div>
					<div class="thirteen wide column">
						<table style="width:100%">
							<tr>
								<th style="width:80%; text-align:left;">${ list.cr_title }</th><td style="text-align:right; width:20%"><small>${ list.cr_date }</small></td>
							</tr>
							<tr>
								<c:forEach var="cList" items="${ lastContent }">
									<c:if test="${ cList.cc_cr_no eq list.cr_no }">
										<c:if test="${ cList.cc_content eq null }">
											<td>메세지가 없습니다.</td>
										</c:if>
										<c:if test="${ cList.cc_content ne null }">
											<td>${ cList.cc_content }</td>
											<c:if test="${ list.cm_new ne 0 }">
												<td style="float:right;"><div style="text-align:center;width:20px;background:red; color:white;" id="b${ list.cr_no }">${ list.cm_new }</div></td>
											</c:if>
										</c:if>
									</c:if>
								</c:forEach>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		</c:forEach>
		
	</c:if>
	<c:if test="${ empty chatList }">
		<div id="noContent">
			참여중인 채팅방이 없습니다.
		</div>
    </c:if>
</div>
<!-- 	
<div class="ui segment" id="chatFreeList" style="display:none;">
	<div class="ui middle aligned divided list">
		<div class="item">
			<div class="content">
				<a class="header">Daniel Louise</a>
			</div>
		</div>
		<div class="item">
			<div class="content">
				<a class="header">Daniel Louise</a>
			</div>
		</div>
	</div>
</div> -->

<script type="text/javascript">
var ws;

//페이지 열리면 웹소켓 자동 생성
openSocket();

function openSocket(){
    //웹소켓 객체 만드는 코드
    console.log("작동");
    ws = new WebSocket("ws://127.0.0.1:8800/trip/echo.do");
    	ws.onopen=function(){
    		console.log("웹소켓 오픈");
    };
    
    ws.onmessage=function(event){
    	onMessage(event);
    };
    
    ws.onclose=function(event){
    };
}

$(function(){
	$('#chatG').on('click', function(){
		$('#chatFellow').attr('class', 'item');
		$('#chatG').attr('class', 'item active');
		/* $('#chatFree').attr('class', 'item'); */
		$('#chatFellowList').css('display', 'none');
		$('#chatGList').css('display', 'block');
		/* $('#chatFreeList').css('display', 'none'); */
	});
	/* 
	$('#chatFree').on('click', function(){
		$('#chatG').attr('class', 'item');
		$('#chatFree').attr('class', 'item active');
		$('#chatFellow').attr('class', 'item');
		$('#chatGList').css('display', 'none');
		$('#chatFreeList').css('display', 'block');
		$('#chatFellowList').css('display', 'none');
	});
	 */
	$('#chatFellow').on('click', function(){
		/* $('#chatFree').attr('class', 'item'); */
		$('#chatFellow').attr('class', 'item active');
		$('#chatG').attr('class', 'item');
		/* $('#chatFreeList').css('display', 'none'); */
		$('#chatFellowList').css('display', 'block');
		$('#chatGList').css('display', 'none');
	});
});

function onMessage(event){
	var full = event.data;
	
	//내일 값 확인
	console.log(full);
	var fullText = full.split(":");
	var roomNo = fullText[0];
	if(roomNo == "clear"){
		console.log("작동");
		var roomNo1 = fullText[1];
		$("#b"+roomNo1).text("");
	}else{
		var roomNo3 = roomNo.substring(0, 2);
		var roomNo_1 = '"'+fullText[0]+'"';
		var title = fullText[1];
		var contry = fullText[2];
		var city = fullText[3];
		var cm_new = fullText[4].split("=")[0];
		
		if(cm_new == 0){
			cm_new = "";
		}
		var text = full.substring(full.indexOf("=")+1, full.length);
		
		if($("#c"+roomNo).length > 0){
			$("#c"+roomNo).remove();
		}
		if($("#noContent").length > 0){
			$("#noContent").remove();
		}
		
		if(roomNo3 == "GM"){
			$("#chatGList").prepend("<div class='ui relaxed divided list' id='c"+roomNo+"' ondblclick='openChat("+roomNo_1+");' style='padding:0 10px 0 10px;'><div class='ui grid'><div class='three wide column'><table><tr><td>국가 : "+contry+"</td></tr><tr><td>도시 : "+city+"</td></tr></table></div><div class='thirteen wide column'><table style='width:100%'><tr><th style='width:80%; text-align:left;'>"+title+"</th><td style='text-align:right; width:20%'><small>날짜</small></td></tr><tr><td>"+text+"</td><td style='float:right;'><div style='text-align:center;width:20px;background:red; color:white;' id='b"+roomNo+"'>"+cm_new+"</td></tr></table></div></div></div>");
		}else{
			$("#chatFellowList").prepend("<div class='ui relaxed divided list' id='c"+roomNo+"' ondblclick='openChat("+roomNo_1+");' style='padding:0 10px 0 10px;'><div class='ui grid'><div class='three wide column'><table><tr><td>국가 : "+contry+"</td></tr><tr><td>도시 : "+city+"</td></tr></table></div><div class='thirteen wide column'><table style='width:100%'><tr><th style='width:80%; text-align:left;'>"+title+"</th><td style='text-align:right; width:20%'><small>날짜</small></td></tr><tr><td>"+text+"</td><td style='float:right;'><div style='text-align:center;width:20px;background:red; color:white;' id='b"+roomNo+"'>"+cm_new+"</td></tr></table></div></div></div>");
		}	
	}
}

//채팅 리스트 더블클릭시 이벤트
function openChat(cr_no){
	window.open("openChat.do?cr_no="+cr_no, cr_no, "width=420px, height=660px, menubar=no, status=no, toolbar=no");
}
</script>
  
</body>
</html>