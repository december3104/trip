<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>header.jsp</title>
<!-- favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시맨틱유아이 -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<style type="text/css">
@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 300; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); 
} 

@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 400; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff'); 	
} 

@font-face { 
	font-family: 'LotteMartDream'; 
	font-style: normal; 
	font-weight: 700; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), 
			url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); 
} 

.lottemartdream,  * { font-family: 'LotteMartDream', sans-serif; }

.ui.menu .ui.dropdown .menu > .item:hover{
	background: rgba(192, 231, 248,1)!important;
}

.ui.menu .ui.dropdown .menu>.item{
	font-weight: 400!important;
}

.ui.menu, .ui.dropdown, .menu>.item{
	font-weight: 700!important;
}

#userDiv {
	padding : 0;
	width: 120px;
	margin-right: 20px;
}
#userDiv:hover{
	background: rgba(0, 0, 0, 0.03);
}

.ui.buttons>.ui.dropdown:last-child .menu, .ui.menu .right.dropdown.item .menu, .ui.menu .right.menu .dropdown:last-child .menu{
	left: -60px;
	right: auto;
}

.ui.striped.table tbody tr:nth-child(2n-1), .ui.striped.table>tr:nth-child(2n-1) {
   background-color: rgba(239,250,255,.5);
}
.ui.striped.table tbody tr:nth-child(2n), .ui.striped.table>tr:nth-child(2n) {
   background-color: #fff;
}

.ui[class*="left icon"].input>input:focus {
	box-shadow: 0 0 0 .2rem rgba(192, 231, 248, .5);
	border: 1px solid #95d6f3;
}

.ui.action.input input[type="text"]:focus{
	border: 1px solid rgba(34,36,38,.15);
}

.ui.action.input input[type="file"] {
  display: none;
} 

.ui.checkbox input:checked ~ .box:before, 
.ui.checkbox input:checked ~ label:before {
    border-color: #95d6f3 !important;
    color: #95d6f3 !important;
}

.ui.checkbox input[type=radio]:focus ~ .box:after,
.ui.checkbox input[type=radio]:focus ~ label:after{
	background: #95d6f3 !important;
}

.ui.checkbox input[type=radio]:checked ~ .box:after,
.ui.checkbox input[type=radio]:checked ~ label:after{
	background: #95d6f3 !important;
}

.ui.checkbox input[type=checkbox]:checked ~ .box:after,
.ui.checkbox input[type=checkbox]:checked ~ label:after{
	color: #95d6f3 !important;
}

.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
}
.display-none{ /*감추기*/
    display:none;
}

div.item right menu{
	position: relative;
}
.ui.popup, .ui.bottom.popup, .ui.bottom.center.popup, ui.visible.popup{
	/* left:90%!important; */
	position: absolute;
	/* transform:translate(230%,0%); */
}
.ui.bottom.left.popup{
	margin-left: 270px;
}



</style>
<script type="text/javascript">
//알람 내용
function searchAlarm(){
	var loginMemberId = '${loginMember.member_id}';
	var divClass = '<div class="ui accordion item">';
	// gb
	$.ajax({
		url: "selectGbAlarmCount.do",
		type: "post",
		data: {member_id: loginMemberId},
		dataType: "json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data){
			if (data.length > 0){
				for(var i in data){
					var gbNo = data[i].gb_no;
					var gmId = data[i].gm_id;
					var gbContent = '<div class="ui accordion item" onclick="updateGbAlarm(' + data[i].gb_no + ')">[ ' + data[i].gb_title + ' ] 에 대한 가이드 매칭 신청자가 있습니다.</div>';
					$('#alarmMenu').html($('#alarmMenu').html() + gbContent);
				} 
			} 
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
	
	// fb
	$.ajax({
		url: "selectFbAlarmCount.do",
		type: "post",
		data: {member_id: loginMemberId},
		dataType: "json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data2){
			if (data2.length > 0){
				for(var i in data2){
					var fm_id = data2[i].fm_id;
					var fbContent = '<div class="ui accordion item" onclick="updateFbAlarm(' + data2[i].fb_no + ', '+"'"+fm_id+"'"+')">[ ' + data2[i].fb_title + ' ] 에 대한 동행 매칭 신청자가 있습니다.</div>';
					$('#alarmMenu').html($('#alarmMenu').html() + fbContent);
				}
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
	
	// fm
	$.ajax({
		url: "selectFmAlarmCount.do",
		type: "post",
		data: {member_id: loginMemberId},
		dataType: "json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data3){
			if (data3.length > 0){
				for(var i in data3){
					var fmContent = '<div class="ui accordion item" onclick="updateFmAlarm(' + data3[i].fb_no + ')">[ ' + data3[i].fb_title + ' ] 에 대한 동행 신청이 수락되었습니다.</div>';
					$('#alarmMenu').html($('#alarmMenu').html() + fmContent);
				}
			} 
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
	
	// guideApply
	$.ajax({
		url: "selectGuideApplyAlarmCount.do",
		type: "post",
		data: {member_id: loginMemberId},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data4){
			if (data4 == "OK"){
				var guideApplyContent =  '<div class="ui accordion item" onclick="updateGuideApplyAlarm()">가이드 자격요건이 만족되어 가이드로 활동하실 수 있습니다.</div>';
				$('#alarmMenu').html($('#alarmMenu').html() + guideApplyContent);
			} 
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
	
	// qna
	$.ajax({
		url: "selectQnaAlarmCount.do",
		type: "post",
		data: {member_id: loginMemberId},
		dataType: "json",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data5){
			if (data5.length > 0){
				for(var i in data5){
					var qnaContent = '<div class="ui accordion item" onclick="updateQnaAlarm(' + data5[i].qna_no + ')">[ ' + data5[i].qna_title + ' ] 에 대한 답변이 등록되었습니다.</div>';
					$('#alarmMenu').html($('#alarmMenu').html() + qnaContent);
				}
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
}
var loginMemberId = '${loginMember.member_id}';
// gb 알람 읽음
function updateGbAlarm(gb_no){
	$.ajax({
		url: "updateGbAlarm.do",
		type: "post",
		data: {gb_no: gb_no, gm_id: loginMemberId},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data){
			if (data == "OK"){
				location.reload();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
}

// fb 알람 읽음
function updateFbAlarm(fb_no,fm_id){
	$.ajax({
		url: "updateFbAlarm.do",
		type: "post",
		data: {fb_no: fb_no, fm_id:fm_id },
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data){
			if (data == "OK"){
				location.reload();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
}

// fm 알람 읽음
function updateFmAlarm(fb_no){
	$.ajax({
		url: "updateFmAlarm.do",
		type: "post",
		data: {fb_no: fb_no, fm_id: loginMemberId},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data){
			if (data == "OK"){
				location.reload();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
}

// guideApply 알람 읽음
function updateGuideApplyAlarm(){
	$.ajax({
		url: "updateGuideApplyAlarm.do",
		type: "post",
		data: {member_id: loginMemberId},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data){
			if (data == "OK"){
				location.reload();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});	
}

// qna 알람 읽음
function updateQnaAlarm(qna_no){
	$.ajax({
		url: "updateQnaAlarm.do",
		type: "post",
		data: {qna_no: qna_no, qna_id: loginMemberId},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		success: function(data){
			if (data == "OK"){
				location.reload();
			}
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		} 
	});
}

$(function(){
	$(".dropdown").dropdown({
		transition: 'drop'
	});

	// 알람 갯수
	if (${!empty loginMember}){
		var loginMemberId = '${loginMember.member_id}';
		var loginMemberLevel = '${loginMember.member_level}';

	
});

function updateFbAlarm(fb_no, fm_id){
	console.log(fb_no + ", " + fm_id);
	$(function(){

		$.ajax({
			url: "selectAllAlarmCount.do",
			type: "get",
			data: {member_id: loginMemberId, memberLevel: loginMemberLevel},
			beforeSend:function(){
		        $('.wrap-loading').removeClass('display-none');
		    },
		    complete:function(){
		        $('.wrap-loading').addClass('display-none');
		    },
			success: function(data){
				$('#totalAlarmCount').html(data);
			},
			error : function(request, status, errorData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			} 
		}); 
	}
	searchAlarm();
});



</script>
</head>
<body>
<header>
<div class="ui container">
<div class="ui top fixed borderless massive menu" style="width: 100%; height: 90px; background: rgba(255,255,255, 0.4)">
	<!-- 사이트 로고 -->
	<div class="item" style="margin-right: 20px">
		<img src="${pageContext.request.contextPath}/resources/images/logo.png" onclick="location.href='${pageContext.request.contextPath}/'" style="cursor: pointer; height: 80px; width: 80px">
	</div>
	
	<!-- 비 로그인 상태일 때 -->
	<c:if test="${empty loginMember }">
	<!-- 메뉴 -->
	<a class="ui simple dropdown item" style="margin-right: 20px">
		가이드북
		<div class="menu">
			<div class="item" onclick="location.href='moveLoginPage.do'">계획하기</div>
			<div class="item" onclick="location.href='moveLoginPage.do'">제작하기</div>
		</div>
	</a> 
	<a class="item" href="moveLoginPage.do" style="margin-right: 20px">현지 가이드 매칭</a> 
	<a class="item" href="moveLoginPage.do" style="margin-right: 20px">동행 찾기</a> 
	<a class="item" href="goInfo.do" style="margin-right: 20px">이용방법</a> 
	<a class="ui simple dropdown item" style="margin-right: 20px">고객센터
		<div class="menu">
			<div class="item" onclick="location.href='selectListAllNotice.do'">공지사항</div>
			<div class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">Q&A</div>
			<div class="item" onclick="location.href='moveLoginPage.do'">가이드 신청</div>
		</div>
	</a>
	
	<!-- 우측 상단 아이콘들 -->
	<div class="item right menu" align="right" style="margin-right: 0;"data-content="Add users to your feed" id="weater_but" data-html = "true">
		<select class="ui dropdown" style="font-size: 10pt;" id="city_name" onchange="select_city()">
			<option value="Seoul" selected="selected">대한민국-서울</option>
			<option value="Paris">프랑스-파리</option>
			<option value="Tokyo">일본-도쿄</option>
			<option value="Bangkok">태국-방콕</option>
			<option value="Singapore">싱가포르-싱가포르</option>
			<option value="Manila">필리핀-마닐라</option>
			<option value="Moscow">러시아-모스크바</option>
			<option value="Hanoi">베트남-하노이</option>
			<option value="Athens">그리스-아테네</option>
			<option value="Rome">이탈리아-로마</option>
			<option value="Madrid">스페인-마드리드</option>
			<option value="Lodon">영국-런던</option>
			<option value="Wellington">뉴질랜드-웰링턴</option>
			<option value="Santiago">칠레-산티아고</option>
			<option value="Ankara">터키-앙카라</option>
			<option value="Canberra">호주-캔버라</option>
		</select>
		<img alt="" src="" id="weatherimg">
		<!-- 로그인버튼 -->
		<a style="background: #95d6f3; color: #000; width: 100px; margin-right: 20px; height: 35px; padding-top: 7px; text-align: center; cursor: pointer; border-radius: .28571429rem" href="moveLoginPage.do">로그인</a>
	</div>
	</c:if>
	<!-- 비 로그인 상태 끝 -->
	
	<!-- 일반 회원 로그인 상태일 때 -->
	<c:if test="${!empty loginMember }">
		<c:if test="${loginMember.member_level ne 3 }">
		<!-- 메뉴 -->
		<a class="ui simple dropdown item">
			가이드북
			<div class="menu">
				<div class="item" onclick="location.href='goplace.do'">계획하기</div>
				<div class="item" onclick="location.href='makeGuidebook.do'">제작하기</div>
			</div>
		</a> 
		<a class="item" onclick="location.href='guideMatchingPage.do'">현지 가이드 매칭</a> 
		<a class="item" href="selectAllFellowBoard.do?currentPage=1&contentNum=10">동행 찾기</a> 
		<a class="item" href="goInfo.do">이용방법</a> 
		<a class="ui simple dropdown item">고객센터
			<div class="menu">
				<div class="item" onclick="location.href='selectListAllNotice.do'">공지사항</div>
				<div class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">Q&A</div>
				<div class="item" onclick="location.href='guideApplyPage.do'">가이드 신청</div>
			</div>
		</a>
		
		<!-- 우측 상단 사용자정보&아이콘들 -->
	<div class="item right menu" align="right" style="margin-right: 0;"data-content="Add users to your feed" id="weater_but" data-html = "true">
		<select class="ui dropdown" style="font-size: 10pt;" id="city_name" onchange="select_city()">
			<option value="Seoul" selected="selected">대한민국-서울</option>
			<option value="Paris">프랑스-파리</option>
			<option value="Tokyo">일본-도쿄</option>
			<option value="Bangkok">태국-방콕</option>
			<option value="Singapore">싱가포르-싱가포르</option>
			<option value="Manila">필리핀-마닐라</option>
			<option value="Moscow">러시아-모스크바</option>
			<option value="Hanoi">베트남-하노이</option>
			<option value="Athens">그리스-아테네</option>
			<option value="Rome">이탈리아-로마</option>
			<option value="Madrid">스페인-마드리드</option>
			<option value="Lodon">영국-런던</option>
			<option value="Wellington">뉴질랜드-웰링턴</option>
			<option value="Santiago">칠레-산티아고</option>
			<option value="Ankara">터키-앙카라</option>
			<option value="Canberra">호주-캔버라</option>
		</select>
		<img alt="" src="" id="weatherimg">	
			
			<!-- 알람 -->
			<div class="ui top right pointing compact scrolling dropdown">
				<i class="alarm icons" style="margin-right: 10px;"> 
					<i class="bell large icon"></i> 
					<!-- 알람 있을 경우 갯수만큼 -->
						<div class="ui circular yellow mini floating label" id="totalAlarmCount"></div>
				</i> 
				<div class="menu scrollColor" style="padding:10px;" id="alarmMenu">
					
				</div>
			</div>

			<!-- <a href="selectAllChatRoom.do" style="color: black"><i class="chat icons" style="margin-right: 30px;"> -->
			<a href="javascript:chatMain('${ loginMember.member_id }');" style="color: black"><i class="chat icons" style="margin-right: 30px;">
				<i class="comments large icon"></i> 
				
					<!-- 알람 있을 경우 갯수만큼 -->
					
						<div class="ui circular blue mini floating label">2</div>
					
				</i>
			</a>
		</div>
		
		<!-- 로그인 했을 때 회원정보 -->
		<div class="ui simple dropdown item" id="userDiv">
			<c:if test="${loginMember.member_profile_rename != null }">
			<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/member_profile/${loginMember.member_profile_rename }">
			</c:if>
			<c:if test="${loginMember.member_profile_rename == null }">
			<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/molly.png">
			</c:if>
			<div class="content">
				<div class="ui sub header">&emsp; <font size="3pt">${loginMember.member_name }</font></div>
			</div>
			<div class="menu" style="text-align: center; margin-left: -40px">
				<div class="item" onclick="location.href='selectGuidebookMyList.do'">내 가이드북</div>
				<div class="item" onclick="location.href='selectMyGuideMatching.do'">가이드 매칭 기록</div>
				<div class="item" onclick="location.href='selectMyFellowMatching.do'">동행 매칭 기록</div>
				<div class="item" onclick="location.href='moveMemberInfoPage.do'">내 정보 수정</div>
				<div class="item" onclick="location.href='logout.do'">로그아웃</div>
			</div>
		</div>
		</c:if>
	</c:if>
	<!-- 일반 회원 로그인 상태 끝 -->
		
	<!-- 관리자로 로그인 상태일 때 -->
	<c:if test="${!empty loginMember }">
		<!-- 관리자 메뉴 -->
		<c:if test="${loginMember.member_level eq 3}">
			<a class="ui simple dropdown item">회원 관리
				<div class="menu">
					<div class="item" onclick="location.href='selectListAllMember.ad?currentPage=1&contentNum=10'">일반회원</div><!-- 0 -->
					<div class="item" onclick="location.href='selectListAllGuide.ad?currentPage=1&contentNum=10'">가이드</div><!-- 0 -->
					<div class="item" onclick="location.href='selectListApplyGuide.ad?currentPage=1&contentNum=10'">가이드 신청</div> <!--?currentPage=1&contentNum=10 -->
				</div>
			</a>
			<a class="ui simple dropdown item">신고 처리
				<div class="menu">
					<div class="item" onclick="location.href='selectListNormalReport.ad?currentPage=1&contentNum=10'">일반회원</div><!-- 0 -->
					<div class="item" onclick="location.href='selectListGuideReport.ad?currentPage=1&contentNum=10'">가이드</div><!-- 0 -->
				</div>
			</a>
			<a class="item" onclick="location.href='selectListAllNotice.ad?currentPage=1&contentNum=10'">공지사항 관리</a><!-- 0 -->
			<a class="item" onclick="location.href='qna.do?currentPage=1&contentNum=10'">QnA 관리</a>
	
			<!-- 우측 상단 사용자정보&아이콘들 -->
	<div class="item right menu" align="right" style="margin-right: 0;"data-content="Add users to your feed" id="weater_but" data-html = "true">
			<select class="ui dropdown" style="font-size: 10pt;" id="city_name" onchange="select_city()">
				<option value="Seoul" selected="selected">대한민국-서울</option>
				<option value="Paris">프랑스-파리</option>
				<option value="Tokyo">일본-도쿄</option>
				<option value="Bangkok">태국-방콕</option>
				<option value="Singapore">싱가포르-싱가포르</option>
				<option value="Manila">필리핀-마닐라</option>
				<option value="Moscow">러시아-모스크바</option>
				<option value="Hanoi">베트남-하노이</option>
				<option value="Athens">그리스-아테네</option>
				<option value="Rome">이탈리아-로마</option>
				<option value="Madrid">스페인-마드리드</option>
				<option value="Lodon">영국-런던</option>
				<option value="Wellington">뉴질랜드-웰링턴</option>
				<option value="Santiago">칠레-산티아고</option>
				<option value="Ankara">터키-앙카라</option>
				<option value="Canberra">호주-캔버라</option>
			</select>
			<img alt="" src="" id="weatherimg">
			</div>	

	    	<!-- 관리자 로그인 정보 -->
			<div class="ui simple dropdown item" id="userDiv">
				<c:if test="${loginMember.member_profile_rename != null }">
				<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/member_profile/${loginMember.member_profile_rename }">
				</c:if>
				<c:if test="${loginMember.member_profile_rename == null }">
				<img class="ui mini circular image" src="${pageContext.request.contextPath}/resources/images/molly.png">
				</c:if>
				<div class="content">
					<div class="ui sub header">&emsp; <font size="3pt">${loginMember.member_name }</font></div>
				</div>
		
				<div class="menu" style="text-align: center">
					<div class="item" onclick="location.href='moveAdminInfo.ad'">내 정보 수정</div>
					<div class="item" onclick="location.href='logout.do'">로그아웃</div>
				</div>
			</div>
		 </c:if>
	</c:if>
	<!-- 관리자 로그인 상태 끝 -->
	
	</div>
</div>
<!-- ajax 로딩 이미지 -->
<div class="wrap-loading display-none">
    <div><img src="resources/images/loading.gif" /></div>
</div>   

<!-- 비 로그인 상태일 때 로그인 필수 메뉴 클릭시 안내창 모달 -->
<div class="ui mini modal" id="loginChkModal">
	<i class="close icon"></i>
	<div class="description" id="loginChkContent">
		<p>로그인이 필요한 메뉴입니다.</p>
		<p>먼저 로그인을 진행해주세요.</p>
	</div>
	<div class="actions">
		<div class="fluid ui button" onclick="moveLoginPage();">확인</div>
	</div>
</div>

<script type="text/javascript">
function chatMain(id){
	
      window.open("selectAllChatRoom.do?member_id="+id, "ChatMain", "width=810px, height=600px, menubar=no, status=no, toolbar=no");
}
//날씨API
function select_city(){
	var city = $("#city_name option:selected").val();
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"dd4a3969a29c87cffb9f796d095333ee";
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
	    success: function(resp) {
	    	var values = "현재온도 : "+ (resp.main.temp- 273.15).toFixed(0)+"℃"+"<br>"+"현재습도 : "+ resp.main.humidity+"%"+"<br>"+"바람   : "+ resp.wind.speed+" m/s"+"<br>"+"구름  : "+ (resp.clouds.all) +"%";
	    	console.log(values);
	    	var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	    	 $("#weatherimg").attr("src", imgURL);
	    	$("#weater_but").attr("data-html", values);
	    	$("#weater_but").popup();
	    	/* 
	    	console.log(resp);
	    	console.log("현재온도 : "+ (resp.main.temp- 273.15) );
	    	console.log("현재습도 : "+ resp.main.humidity );
	    	console.log("날씨 : "+ resp.weather[0].main );
	    	console.log("상세날씨설명 : "+ resp.weather[0].description );
	    	console.log("날씨 이미지 : "+ resp.weather[0].icon );
	    	console.log("바람   : "+ resp.wind.speed );
	    	console.log("나라   : "+ resp.sys.country );
	    	console.log("도시이름  : "+ resp.name );
	    	console.log("구름  : "+ (resp.clouds.all) +"%" ); 	
	    	 */
	    }
	})
}

//날씨API
$(function(){
	var city = $("#city_name option:selected").val();
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"dd4a3969a29c87cffb9f796d095333ee";
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
	    success: function(resp) {
	    	var values = "현재온도 : "+ (resp.main.temp- 273.15).toFixed(0)+"℃"+"<br>"+"현재습도 : "+ resp.main.humidity+"%"+"<br>"+"바람   : "+ resp.wind.speed+" m/s"+"<br>"+"구름  : "+ (resp.clouds.all) +"%";
	    	var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	    	 $("#weatherimg").attr("src", imgURL);
	    	$("#weater_but").attr("data-html", values);
	    	$("#weater_but").popup();
	    	/* 
	    	console.log(resp);
	    	console.log("현재온도 : "+ (resp.main.temp- 273.15) );
	    	console.log("현재습도 : "+ resp.main.humidity);
	    	console.log("날씨 : "+ resp.weather[0].main );
	    	console.log("상세날씨설명 : "+ resp.weather[0].description );
	    	console.log("날씨 이미지 : "+ resp.weather[0].icon );
	    	console.log("바람   : "+ resp.wind.speed );
	    	console.log("나라   : "+ resp.sys.country );
	    	console.log("도시이름  : "+ resp.name );
	    	console.log("구름  : "+ (resp.clouds.all) +"%" ); 	
	    	 */
	    }
	});
});

</script>
</header>
</body>
</html>